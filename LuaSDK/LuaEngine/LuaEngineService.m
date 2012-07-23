//
//  LuaEngineService.m
//  LuaCL
//
//  Created by tearsofphoenix on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaEngineService.h"

#import "lauxlib.h"

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
#import "LuaBridgeSupport.h"

static LuaEngineService *g_engine = nil;

extern FILE *g_luaOutputFilePointer;

typedef struct lua_State *LuaStateRef;

typedef struct 
{
    NSString *path;
    LuaStateRef luaState;
    LuaStateRef parserState;
    NSMutableArray *supportedFetures;
    
}LuaEngineAttributes;

typedef LuaEngineAttributes *LuaEngineAttributesRef;


@interface LuaEngineService ()
{
@private    
    LuaEngineAttributesRef _internal;
    NSMutableDictionary *_luaEngineLibs;
    NSMutableArray *_md5OfParsedString;
}

- (void)showLuaOutput;

@end


@implementation LuaEngineService

@synthesize delegate = _delegate;


static void _luaEngine_initlibs(NSMutableDictionary *_libs)
{
    LuaLibraryInformation *infoLooper = nil;
    
    //`Foundation' lib
    //
    infoLooper = LuaLibraryInformationMakeC(LuaEngineObjCSupport, LUA_NSLIBNAME, luaopen_foundation, 1, nil);
    
    [_libs setObject: infoLooper
              forKey: [infoLooper featureID]];
    
    //`UIKit' lib
    //
#if TARGET_OS_EMBEDDED || TARGET_OS_IPHONE 
    infoLooper = LuaLibraryInformationMakeC(LuaEngineUIKitSupport, LUA_UIKITLIBNAME, LuaOpenUIKit, 1, 
                                            [NSArray arrayWithObject:  LuaEngineObjCSupport]);
    [_libs setObject: infoLooper
              forKey: [infoLooper featureID]];
#endif
    //`lpeg' lib
    //
    infoLooper = LuaLibraryInformationMakeC(LuaEngineParserSupport, LUA_LPEGLIBNAME, luaopen_lpeg, 1, 
                                            nil);
    [_libs setObject: infoLooper
              forKey: [infoLooper featureID]];    
}

static LuaStateRef _luaEngine_createLuaState(void)
{
    LuaStateRef luaStateRef = luaL_newstate();
    if (luaStateRef == NULL) 
    {
        NSLog(@"cannot create state: not enough memory");
        exit(EXIT_FAILURE);
    }    
    
    luaL_checkversion(luaStateRef);
    lua_gc(luaStateRef, LUA_GCSTOP, 0);  /* stop collector during initialization */
    
    luaL_openlibs(luaStateRef);  
    //TODO, forbide gc first
    lua_gc(luaStateRef, LUA_GCRESTART, 0);
    
    return luaStateRef;
}

static int _luaEngine_compileTimeInteraction(lua_State *L)
{
    //LuaEngineService *service = luaObjC_checkNSObject(L, 1);
    const char *message = lua_tostring(L, 2);
    if (!strcmp(message, "import"))
    {
        NSString *frameworkName = [NSString stringWithUTF8String: lua_tostring(L, 3)];
        frameworkName = [frameworkName substringWithRange: NSMakeRange(1, [frameworkName length] - 2)];
        [NSThread detachNewThreadSelector: @selector(importFramework:)
                                 toTarget: [LuaBridgeSupport class]
                               withObject: frameworkName];
    }
        
    return 0;
}

static const luaL_Reg __compileTimeFunctions [] =
{
    {"compileTimeInteraction", _luaEngine_compileTimeInteraction},
    {NULL, NULL},
};

static void LuaEngine_initialize(LuaEngineService *self,
                                 LuaEngineAttributesRef *_internal,
                                 NSMutableDictionary **_luaEngineLibs,
                                 NSMutableArray **_md5OfParsedString)
{
    *_md5OfParsedString = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *libs = [[NSMutableDictionary alloc] init];
    _luaEngine_initlibs(libs);
    *_luaEngineLibs = libs;
    
    LuaEngineAttributesRef internal = calloc(1, sizeof(LuaEngineAttributes));
    
    //    NSString *guid = [[NSProcessInfo processInfo] globallyUniqueString];
    //    NSString *path = [[NSTemporaryDirectory() stringByAppendingPathComponent:guid] retain];
    NSString *path = @"./log.txt";
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath: path])
    {
        [fileManager createFileAtPath: path
                             contents: nil
                           attributes: nil];
    }
    g_luaOutputFilePointer = stdout;
    //    g_luaOutputFilePointer = fopen([path cStringUsingEncoding: NSUTF8StringEncoding], "w");
    
    internal->path = path;

    //init parser state
    //
    LuaStateRef parserStateRef = _luaEngine_createLuaState();
    luaObjC_loadGlobalFunctions(parserStateRef, __compileTimeFunctions);
    LuaLibraryInformationRegisterToState(libs, LuaEngineParserSupport, parserStateRef);
    internal->parserState = parserStateRef;

    //init runtime state
    //
    LuaStateRef luaStateRef = _luaEngine_createLuaState();
    
    LuaLibraryInformationRegisterToState(libs, LuaEngineUIKitSupport, luaStateRef);
    
    internal->luaState = luaStateRef;    
    
    internal->supportedFetures = [[NSMutableArray alloc] init];    
    
    NSString *sourceFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"LuaObjCParser.lua"];
    //    NSString *sourceFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"LuaCParser.lua"];
    NSString *parserSourceCode = [[NSString alloc] initWithContentsOfFile: sourceFilePath
                                                                 encoding: NSUTF8StringEncoding
                                                                    error: NULL];
    int status = luaL_dostring(parserStateRef, [parserSourceCode UTF8String]);
    if (status != LUA_OK)
    {
        luaObjC_throwExceptionIfError(parserStateRef);
    }
    [parserSourceCode release];
    
    *_internal = internal;
    
    g_engine = self;
}

+ (void)load
{
    [super load];
}

- (id)init
{
    if ((self = [super init]))
    {
        LuaEngine_initialize(self, &_internal, &_luaEngineLibs, &_md5OfParsedString);
    }
    return self;
}

- (void)dealloc
{
    lua_close(_internal->parserState);
    _internal->parserState = NULL;
    
    lua_close(_internal->luaState);
    _internal->luaState = NULL;
    
    [_internal->supportedFetures  release];
    _internal->supportedFetures = nil;
    
    free(_internal);
    
    fclose(g_luaOutputFilePointer);
    g_luaOutputFilePointer = NULL;
    g_engine = nil;
    
    [_luaEngineLibs release];
    [_md5OfParsedString release];
    
    [super dealloc];
}

- (void)initServiceCallbackFunctions
{
    [super initServiceCallbackFunctions];
    
    
    [self registerBlock: (^(ERGeneralCallbackBlock callback, NSString *action, NSArray *arguments) 
                          {
                              NSString *supportID = [arguments objectAtIndex: 0];
                              LuaLibraryInformationRegisterToState(_luaEngineLibs, supportID, _internal->luaState);
                          })
              forAction: LuaEngineOpenLibrarySupport];
    
    [self registerBlock: (^(ERGeneralCallbackBlock callback, NSString *action, NSArray *arguments) 
                          {
                              [self doString: [arguments objectAtIndex: 0]];
                              if (callback)
                              {
                                  callback(action, arguments);
                              }
                          })
              forAction: LuaEngineDoSourceCode];
    
    [self registerBlock: (^(ERGeneralCallbackBlock callback, NSString *action, NSArray *arguments) 
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
              forAction: LuaEngineRegisterGlobalConstants];
    
    [self registerBlock: (^(ERGeneralCallbackBlock callback, NSString *action, NSArray *arguments) 
                          {
                              LuaStateRef L = _internal->luaState;
                              __block Class classLooper = nil;
                              NSArray *classList = [arguments objectAtIndex: 0];
                              [classList enumerateObjectsUsingBlock: (^(NSString *className, NSUInteger idx, BOOL *stop) 
                                                                      {
                                                                          classLooper = NSClassFromString(className);
                                                                          if (classLooper)
                                                                          {
                                                                              luaObjC_pushNSObject(L, classLooper);
                                                                              lua_setglobal(L, [className UTF8String]);
                                                                          }
                                                                          
                                                                      })];
                          })
              forAction: LuaEngineLoadClassList];
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
        return ret;
    }else
    {
        luaObjC_throwExceptionIfError(luaStateRef);
    }
    
    return NULL;
}

- (void)executeFunctionName: (NSString *)functionName
               inSourceCode: (NSString *) sourceCode
          argumentPassBlock: (ERGeneralCallbackBlock)block
              argumentCount: (int)argumentCount
                returnCount: (int)returnCount
                 completion: (ERGeneralCallbackBlock)completion
{    
    LuaStateRef luaStateRef = _internal->luaState;
    lua_Integer status;
    
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
            luaObjC_throwExceptionIfError(luaStateRef);     
        }else 
        {        
            //push arguments
            //
            if (block)
            {
                if (0 == argumentCount) 
                {
                    printf("[LuaEngineService] warning: push arguments to `void'-arguments-function\n");
                }
                
                block(nil, [NSArray arrayWithObject: [NSValue valueWithPointer: luaStateRef]]);
            }
            
            //execute
            //
            //printf("[LuaEngineService] debug: will call lua function: %s\n", functionNameString);
            
            status = lua_pcall(luaStateRef, argumentCount, returnCount, 0);
            
            if (status != LUA_OK)
            {
                luaObjC_throwExceptionIfError(luaStateRef);
            }
            
            //deal return value
            //
            if (completion)
            {
                if (0 == returnCount) 
                {
                    printf("[LuaEngineService] warning: deal return value on `void'-return-function\n");
                }
                
                completion(nil, [NSArray arrayWithObject: [NSValue valueWithPointer: luaStateRef]]);
            }
            
            //clear up the return value
            //
            lua_pop(luaStateRef, 1);
        }
    }else
    {
        if (completion)
        {            
            completion(nil, [NSArray arrayWithObject: [NSValue valueWithPointer: luaStateRef]]);
        }
        
        //clear up the return value
        //
        lua_pop(luaStateRef, 1);
    }
}

- (void)doString:(NSString *)sourceCode
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
            luaObjC_throwExceptionIfError(luaStateRef);
        }
    }
}


- (void)showLuaOutput
{
    NSString *path = _internal->path;
    NSString *fileContent = [NSString stringWithContentsOfFile: path
                                                      encoding: NSUTF8StringEncoding
                                                         error: nil];
    if ([_delegate respondsToSelector: @selector(showOutput:ofEngine:)])
    {
        
        [_delegate showOutput: fileContent
                     ofEngine: self];
    }else
    {
        NSLog(@"Engine:%@", fileContent);
    }    
}


+ (id)identity
{
    return LuaEngineServiceID;
}

@end

#pragma mark - engine id

NSString * const LuaEngineServiceID = @"com.veritas.service.luaengine";

#pragma mark - supported libraries

NSString * const LuaEngineXPathSupport = @"com.veritas.LuaEngineService.feature.xpath";

NSString * const LuaEngineSqliteSupport = @"com.veritas.LuaEngineService.feature.sqlite";

NSString * const LuaEngineOpenGLESSupport = @"com.veritas.LuaEngineService.feature.opengles";

NSString * const LuaEngineCGLSupport = @"com.veritas.LuaEngineService.feature.cgl";

NSString * const LuaEngineTCCSupport = @"com.veritas.LuaEngineService.feature.tcc";

NSString * const LuaEngineObjCSupport = @"com.veritas.LuaEngineService.feature.objc";

NSString * const LuaEngineGLUSupport = @"com.veritas.LuaEngineService.feature.glu";

NSString * const LuaEngineUIKitSupport = @"com.veritas.LuaEngineService.feature.uikit";

NSString * const LuaEngineParserSupport = @"com.veritas.LuaEngineService.feature.lpeg";

#pragma mark - engine supported actions

NSString * const LuaEngineOpenLibrarySupport = @"com.veritas.LuaEngineService.openLibrarySupport";

NSString * const LuaEngineDoSourceCode = @"com.veritas.LuaEngineService.doSourceCode";

NSString * const LuaEngineRegisterGlobalConstants = @"com.veritas.LuaEngineService.registerGlobalConstatns";

NSString * const LuaEngineLoadClassList = @"com.verits.LuaEngineService.loadClassList";

void LuaCall(NSString *sourceCode,
             NSString *functionName,
             ERGeneralCallbackBlock block, 
             int argumentCount,
             int returnCount,
             ERGeneralCallbackBlock completion)
{
    [(LuaEngineService *)[ERGeneralDataSource serviceByID: LuaEngineServiceID] executeFunctionName: functionName
                                                                                      inSourceCode: sourceCode
                                                                                 argumentPassBlock: block
                                                                                     argumentCount: argumentCount
                                                                                       returnCount: returnCount
                                                                                        completion: completion];
}

