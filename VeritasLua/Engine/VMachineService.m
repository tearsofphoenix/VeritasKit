//
//  VMachineService.m
//  LuaCL
//
//  Created by tearsofphoenix on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMachineService.h"

#import "lualib.h"

#import "LuaObjCClass.h"

#import "LuaObjCRuntime.h"

#if TARGET_OS_EMBEDDED || TARGET_OS_IPHONE

#import "LuaUIKit.h"

#endif

#import "lpeg.h"

#import "LuaObjCInternal.h"

#import "LuaLibraryInformation.h"

#import "LuaObjCAuxiliary.h"
#import "VBridgeService.h"
#import "LuaBridgeSupportFileParser.h"
#import "LuaObjCParser.h"
#import "NSData+Base64.h"

static char * const VMachineFrameworkImportQueueIdentifier = "com.veritas.lua-engine.framework-import.queue";

static char * const VMachineGarbageCollectionQueueIdentifier = "com.veritas.lua-engine.garbage-colletion.queue";

//Gardage collect time interval, in seconds
//
static const NSTimeInterval VMachineGarbageCollectInterval = 10;

typedef struct lua_State *LuaStateRef;

typedef struct
{
    NSString *path;
    LuaStateRef luaState;
    LuaStateRef parserState;
    dispatch_queue_t garbageCollectionQueue;
    dispatch_source_t garbageCollectTimer;
    
}VMachineAttributes;

typedef VMachineAttributes *VMachineAttributesRef;


@interface VMachineService ()
{
@private
    VMachineAttributesRef _internal;
    NSMutableDictionary *_luaEngineLibs;
    NSMutableArray *_md5OfParsedString;
}

@end


@implementation VMachineService

static void _luaEngine_initlibs(NSMutableDictionary *_libs)
{
    LuaLibraryInformation *infoLooper = nil;
    
    //`Foundation' lib
    //
    infoLooper = LuaLibraryInformationMake(VMachineObjCSupport,
                                           [NSString stringWithUTF8String: LUA_NSLIBNAME],
                                           LuaObjCOpenFoundationSupport,
                                           1,
                                           nil);
    
    [_libs setObject: infoLooper
              forKey: [infoLooper featureID]];
    
    //`UIKit' lib
    //
#if TARGET_OS_EMBEDDED || TARGET_OS_IPHONE
    infoLooper = LuaLibraryInformationMake(VMachineUIKitSupport,
                                           [NSString stringWithUTF8String: LUA_UIKITLIBNAME],
                                           LuaObjCOpenUIKit,
                                           1,
                                           [NSArray arrayWithObject:  VMachineObjCSupport]);
    [_libs setObject: infoLooper
              forKey: [infoLooper featureID]];
#endif
    //`lpeg' lib
    //
    infoLooper = LuaLibraryInformationMake(VMachineParserSupport,
                                           [NSString stringWithUTF8String: LUA_LPEGLIBNAME],
                                           luaopen_lpeg,
                                           1,
                                           nil);
    [_libs setObject: infoLooper
              forKey: [infoLooper featureID]];
}

static LuaStateRef _luaEngine_createLuaState(void)
{
    LuaStateRef luaStateRef = luaL_newstate();
    if (luaStateRef == NULL)
    {
        printf("cannot create state: not enough memory!\n");
        
        exit(EXIT_FAILURE);
    }
    
    luaL_checkversion(luaStateRef);
    lua_gc(luaStateRef, LUA_GCSTOP, 0);  /* stop collector during initialization */
    
    luaL_openlibs(luaStateRef);
    
    lua_gc(luaStateRef, LUA_GCRESTART, 0);
    
    return luaStateRef;
}

static int _luaEngine_compileTimeInteraction(lua_State *L)
{
    //VMachineService *service = LuaObjCCheckObject(L, 1);
    const char *message = lua_tostring(L, 2);
    if (!strcmp(message, "import"))
    {
        NSString *frameworkName = [NSString stringWithUTF8String: lua_tostring(L, 3)];
        frameworkName = [frameworkName substringWithRange: NSMakeRange(1, [frameworkName length] - 2)];
        
        VSC(VBridgeServiceIdentifier, VBridgeServiceImportFrameworkAction, nil, @[ frameworkName ]);
        //[VBridgeService importFramework: frameworkName];
    }
    
    return 0;
}

static const luaL_Reg __compileTimeFunctions [] =
{
    {"compileTimeInteraction", _luaEngine_compileTimeInteraction},
    {NULL, NULL},
};

static void VMachine_initialize(VMachineService *self)
{
    self->_md5OfParsedString = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *libs = [[NSMutableDictionary alloc] init];
    _luaEngine_initlibs(libs);
    
    self->_luaEngineLibs = libs;
    
    //initialize the internal
    //
    VMachineAttributesRef internal = calloc(1, sizeof(VMachineAttributes));
    
    //init parser state
    //
    LuaStateRef parserStateRef = _luaEngine_createLuaState();
    
    LuaObjCLoadGlobalFunctions(parserStateRef, __compileTimeFunctions);
    LuaLibraryInformationRegisterToState(libs, VMachineParserSupport, parserStateRef);
    
    internal->parserState = parserStateRef;
    
    //init runtime state
    //
    LuaStateRef luaStateRef = _luaEngine_createLuaState();
    
    LuaLibraryInformationRegisterToState(libs, VMachineUIKitSupport, luaStateRef);
    
    internal->luaState = luaStateRef;
    
#if 0
    NSString *sourceCode = [[NSString alloc] initWithData: [NSData dataFromBase64String: kLuaObjCParserString]
                                                 encoding: NSUTF8StringEncoding];
#else
    NSString *luaObjCParserPath = [[NSBundle bundleForClass: [self class]] pathForResource: @"LuaObjCParser"
                                                                                    ofType: @"lua"];
    NSString *sourceCode = [[NSString alloc] initWithContentsOfFile: luaObjCParserPath
                                                           encoding: NSUTF8StringEncoding
                                                              error: NULL];
#endif
    //int status = luaL_dostring(parserStateRef, [parserSourceCode UTF8String]);
    if (luaL_dostring(parserStateRef, [sourceCode UTF8String]) != LUA_OK)
    {
        luaL_error(luaStateRef, "error in do string");
    }
    
    [sourceCode release];
    
    dispatch_queue_t garbageQueue = dispatch_queue_create(VMachineGarbageCollectionQueueIdentifier, DISPATCH_QUEUE_SERIAL);
    internal->garbageCollectionQueue = garbageQueue;
    
    dispatch_source_t garbageCollectTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, garbageQueue);
    internal->garbageCollectTimer = garbageCollectTimer;
    
    NSTimeInterval collectInterval = VMachineGarbageCollectInterval * NSEC_PER_SEC;
    
    dispatch_source_set_timer(garbageCollectTimer, dispatch_time(DISPATCH_TIME_NOW, collectInterval), collectInterval, 0);
    dispatch_source_set_event_handler(garbageCollectTimer,
                                      (^
                                       {
                                           lua_gc(luaStateRef, LUA_GCCOLLECT, 0);
                                           
                                       }));
    
    self->_internal = internal;
}

+ (void)load
{
    [super registerService: self];
}

- (id)init
{
    if ((self = [super init]))
    {
        VMachine_initialize(self);
        
        dispatch_resume(_internal->garbageCollectTimer);
        
        //        NSData *data = [[NSData alloc] initWithContentsOfFile: [[NSBundle bundleForClass: [self class]] pathForResource: @"LuaObjCParser"
        //                                                                                                                 ofType: @"lua"]];
        //
        //        NSLog(@"%@", [data base64EncodedString]);
        
        [self initServiceCallbackFunctions];
        
    }
    return self;
}

- (void)dealloc
{
    lua_close(_internal->parserState);
    _internal->parserState = NULL;
    
    lua_close(_internal->luaState);
    _internal->luaState = NULL;
    
    free(_internal);
    
    [_luaEngineLibs release];
    [_md5OfParsedString release];
    
    [super dealloc];
}

- (void)initServiceCallbackFunctions
{
    __block id fakeSelf = self;
    
    [self registerBlock: (^(VCallbackBlock callback, NSString *action, NSArray *arguments)
                          {
                              [fakeSelf doString: [arguments objectAtIndex: 0]];
                              if (callback)
                              {
                                  callback(action, arguments);
                              }
                          })
              forAction: VMachineServiceDoSourceCodeAction];
    
    [self registerBlock: (^(VCallbackBlock callback, NSString *action, NSArray *arguments)
                          {
                              LuaStateRef L = _internal->luaState;
                              
                              [arguments enumerateObjectsUsingBlock: (^(NSArray *obj, NSUInteger idx, BOOL *stop)
                                                                      {
                                                                          NSInteger value = [[obj objectAtIndex: 0] intValue];
                                                                          NSString *name = [obj objectAtIndex: 1];
                                                                          
                                                                          lua_pushinteger(L, value);
                                                                          lua_setglobal(L, [name UTF8String]);
                                                                      })];
                          })
              forAction: VMachineServiceRegisterGlobalConstantsAction];   
}

- (const char *)parseString: (NSString *)sourceCode
{
    LuaStateRef luaStateRef = _internal->parserState;
    lua_getglobal(luaStateRef, "translate");
    lua_pushstring(luaStateRef, [sourceCode UTF8String]);
    
    int status = lua_pcall(luaStateRef, 1, 1, 0);
    
    if (status == LUA_OK)
    {
        const char* ret = luaL_checkstring(luaStateRef, -1);
        lua_pop(luaStateRef, 1);
        //printf("parsed: %s\n", ret);
        ///TODO: is here right?
        //
        return strdup(ret);
    }else
    {
        luaL_error(luaStateRef, "error in parse string");
    }
    
    return NULL;
}

- (void)executeFunctionName: (NSString *)functionName
               inSourceCode: (NSString *) sourceCode
          argumentPassBlock: (LuaObjCBlock)block
              argumentCount: (int)argumentCount
                returnCount: (int)returnCount
                 completion: (LuaObjCBlock)completion
{
    LuaStateRef luaStateRef = _internal->luaState;
    lua_Integer status;
    
    if ([sourceCode hasSuffix: @".v"])
    {
        //is a path infact
        NSString *filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: sourceCode];
        NSError *error = nil;
        sourceCode = [NSString stringWithContentsOfFile: filePath
                                               encoding: NSUTF8StringEncoding
                                                  error: &error];
        if (error)
        {
            NSLog(@"in function: %s line: %d error: %@", __PRETTY_FUNCTION__, __LINE__, error);
        }
    }
    
    if (sourceCode)
    {
        [self doString: sourceCode];
    }
    
    if (functionName)
    {
        //get function in stack
        //
        const char* functionNameString = [functionName UTF8String];
        lua_getglobal(luaStateRef, functionNameString);
        
        //check if is a function
        //
        if(!lua_isfunction(luaStateRef, -1))
        {
            luaL_error(luaStateRef, "not function found with name: %s", functionNameString);
        }else
        {
            //push arguments
            //
            if (block)
            {
                if (0 == argumentCount)
                {
                    printf("[VMachineService] warning: push arguments to `void'-arguments-function\n");
                }
                
                block(luaStateRef);
            }
            
            //execute
            //
            //printf("[VMachineService] debug: will call lua function: %s\n", functionNameString);
            
            status = lua_pcall(luaStateRef, argumentCount, returnCount, 0);
            
            if (status != LUA_OK)
            {
                luaL_error(luaStateRef, "error run");
            }
            
            //deal return value
            //
            if (completion)
            {
                if (0 == returnCount)
                {
                    printf("[VMachineService] warning: deal return value on `void'-return-function\n");
                }
                
                completion(luaStateRef);
            }
            
            //clear up the return value
            //
            lua_pop(luaStateRef, 1);
        }
    }else
    {
        if (completion)
        {
            completion(luaStateRef);
        }
        
        //clear up the return value
        //
        lua_pop(luaStateRef, 1);
    }
}

- (void)doString: (NSString *)sourceCode
{
    if ([_md5OfParsedString indexOfObject: sourceCode] == NSNotFound)
    {
        [_md5OfParsedString addObject: sourceCode];
        
        LuaStateRef luaStateRef = _internal->luaState;
        
        //parse source code to lua code
        //
        const char* parsedString = [self parseString: sourceCode];
        //printf("string: %s\n", parsedString);
        //load source code
        //
        
        if (luaL_dostring(luaStateRef, parsedString) != LUA_OK)
        {
            luaL_error(luaStateRef, "error in do string: %s", parsedString);
        }
    }
}

+ (id)identity
{
    return VMachineServiceID;
}

@end

#pragma mark - engine id

NSString * const VMachineServiceID = @"com.veritas.service.lua-engine";

NSString * const VMachineObjCSupport = @"lua-engine.feature.objc";

NSString * const VMachineUIKitSupport = @"lua-engine.feature.uikit";

NSString * const VMachineParserSupport = @"lua-engine.feature.lpeg";

#pragma mark - engine supported actions

NSString * const VMachineServiceDoSourceCodeAction = @"lua-engine.action.doSourceCode";

NSString * const VMachineServiceRegisterGlobalConstantsAction = @"lua-engine.action.registerGlobalConstatns";

void LuaCall(NSString *sourceCode,
             NSString *functionName,
             LuaObjCBlock start,
             int argumentCount,
             int returnCount,
             LuaObjCBlock completion
             )
{
    [(VMachineService *)[VMetaService serviceByID: VMachineServiceID] executeFunctionName: functionName
                                                                             inSourceCode: sourceCode
                                                                        argumentPassBlock: start
                                                                            argumentCount: argumentCount
                                                                              returnCount: returnCount
                                                                               completion: completion];
}

