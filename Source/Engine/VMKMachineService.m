//
//  VMKMachineService.m
//  LuaCL
//
//  Created by tearsofphoenix on 2/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKMachineService.h"
#import "VMKClass.h"
#import "VMKRuntime.h"

#if TARGET_OS_EMBEDDED || TARGET_OS_IPHONE
#import "LuaUIKit.h"
#endif

#import "VMKLibraryInformation.h"
#import "VMKAuxiliary.h"
#import "VMKBridgeService.h"
#import "VMKParser.h"
#import "NSString+VMKIndex.h"
#import "NSData+Base64.h"
#import <LuaKit/LuaKit.h>
#import <pthread.h>

extern int lua_dumpSourceCode(VMKLuaStateRef state, const char *sourceCode, const char* outputPath);

static char * const VMKMachineFrameworkImportQueueIdentifier = "com.veritas.lua-engine.framework-import.queue";

static char * const VMKMachineGarbageCollectionQueueIdentifier = "com.veritas.lua-engine.garbage-colletion.queue";

//Gardage collect time interval, in seconds
//
static const NSTimeInterval VMKMachineGarbageCollectInterval = 10;

struct __VMKMachineAttributes
{
    NSString *path;
    VMKLuaStateRef luaState;
    VMKLuaStateRef parserState;
    dispatch_queue_t garbageCollectionQueue;
    dispatch_source_t garbageCollectTimer;
    pthread_mutex_t lock;
    
};

typedef struct __VMKMachineAttributes *VMKMachineAttributesRef;


@interface VMKMachineService ()
{
@private
    VMKMachineAttributesRef _internal;
    NSMutableDictionary *_luaEngineLibs;
    NSMutableArray *_md5OfParsedString;
}

@end


@implementation VMKMachineService

static int luaObjC_objc_UUIDString(VMKLuaStateRef state)
{
    NSString *uuidString = [[NSString UUID] stringByReplacingOccurrencesOfString: @"-" withString: @"_"];
    lua_pushstring(state, [uuidString UTF8String]);
    return 1;
}

static void _luaEngine_initlibs(NSMutableDictionary *_libs)
{
    VMKLibraryInformation *infoLooper = nil;
    
    //`Foundation' lib
    //
    infoLooper = VMKLibraryInformationMake(VMKMachineObjCSupport,
                                           @LUA_NSLIBNAME,
                                           VMKOpenFoundationSupport,
                                           1,
                                           nil);
    
    [_libs setObject: infoLooper
              forKey: [infoLooper featureID]];
    
    //`UIKit' lib
    //
#if TARGET_OS_EMBEDDED || TARGET_OS_IPHONE
    infoLooper = VMKLibraryInformationMake(VMKMachineUIKitSupport,
                                           @LUA_UIKITLIBNAME,
                                           VMKOpenUIKit,
                                           1,
                                           @[ VMKMachineObjCSupport ]);
    [_libs setObject: infoLooper
              forKey: [infoLooper featureID]];
#endif
    //`lpeg' lib
    //
    infoLooper = VMKLibraryInformationMake(VMKMachineParserSupport,
                                           @LUA_LPEGLIBNAME,
                                           luaopen_lpeg,
                                           1,
                                           nil);
    [_libs setObject: infoLooper
              forKey: [infoLooper featureID]];
}

static VMKLuaStateRef _luaEngine_createLuaState(void)
{
    VMKLuaStateRef luaStateRef = luaL_newstate();
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

static int _luaEngine_compileTimeInteraction(VMKLuaStateRef state)
{
    const char *message = lua_tostring(state, 2);
    if (!strcmp(message, "import"))
    {
        NSString *frameworkName = @( lua_tostring(state, 3) );
        frameworkName = [frameworkName substringWithRange: NSMakeRange(1, [frameworkName length] - 2)];
        
        [[VMKBridgeService sharedService] importFramework: frameworkName];
    }
    
    return 0;
}

static const luaL_Reg __compileTimeFunctions [] =
{
    {"objc_UUIDString", luaObjC_objc_UUIDString},
    {"compileTimeInteraction", _luaEngine_compileTimeInteraction},
    {NULL, NULL},
};

static void VMKMachine_initialize(VMKMachineService *self)
{
    self->_md5OfParsedString = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *libs = [[NSMutableDictionary alloc] init];
    _luaEngine_initlibs(libs);
    
    self->_luaEngineLibs = libs;
    
    //initialize the internal
    //
    VMKMachineAttributesRef internal = calloc(1, sizeof(struct __VMKMachineAttributes));
    
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    
    pthread_mutex_init(&internal->lock, &attr);
    
    pthread_mutexattr_destroy(&attr);
    
    //init parser state
    //
    VMKLuaStateRef parserStateRef = _luaEngine_createLuaState();
    
    VMKLoadGlobalFunctions(parserStateRef, __compileTimeFunctions);
    VMKLibraryInformationRegisterToState(libs, VMKMachineParserSupport, parserStateRef);
    
    internal->parserState = parserStateRef;
    
    //init runtime state
    //
    VMKLuaStateRef luaStateRef = _luaEngine_createLuaState();
    
    VMKLibraryInformationRegisterToState(libs, VMKMachineUIKitSupport, luaStateRef);
    
    internal->luaState = luaStateRef;
    
#if 0
    NSString *sourceCode = [[NSString alloc] initWithData: [NSData dataFromBase64String: kLuaObjCParserString]
                                                 encoding: NSUTF8StringEncoding];
#else
    NSString *luaObjCParserPath = [[NSBundle bundleForClass: [self class]] pathForResource: @"VMKParser"
                                                                                    ofType: @"lua"];
    NSString *sourceCode = [[NSString alloc] initWithContentsOfFile: luaObjCParserPath
                                                           encoding: NSUTF8StringEncoding
                                                              error: NULL];
#endif
    
    if (luaL_dostring(parserStateRef, [sourceCode UTF8String]) != LUA_OK)
    {
        lua_error(luaStateRef);
    }
    
    [sourceCode release];
    
    /*
    dispatch_queue_t garbageQueue = dispatch_queue_create(VMKMachineGarbageCollectionQueueIdentifier, DISPATCH_QUEUE_SERIAL);
    internal->garbageCollectionQueue = garbageQueue;
    
    dispatch_source_t garbageCollectTimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, garbageQueue);
    internal->garbageCollectTimer = garbageCollectTimer;
    
    NSTimeInterval collectInterval = VMKMachineGarbageCollectInterval * NSEC_PER_SEC;
    
    dispatch_source_set_timer(garbageCollectTimer, dispatch_time(DISPATCH_TIME_NOW, collectInterval), collectInterval, 0);
    dispatch_source_set_event_handler(garbageCollectTimer,
                                      (^
                                       {
                                           pthread_mutex_lock(&internal->lock);
                                           lua_gc(luaStateRef, LUA_GCCOLLECT, 0);
                                           pthread_mutex_unlock(&internal->lock);
                                           
                                       }));*/
    
    self->_internal = internal;
}

static VMKMachineService *sSharedService = nil;

+ (id)sharedService
{
    if (!sSharedService)
    {
        sSharedService = [[self alloc] init];
    }
    
    return sSharedService;
}

- (id)init
{
    if ((self = [super init]))
    {
        VMKMachine_initialize(self);
        
        [NSTimer scheduledTimerWithTimeInterval: VMKMachineGarbageCollectInterval
                                         target: self
                                       selector: @selector(_gabageCollectByTimer:)
                                       userInfo: nil
                                        repeats: YES];
        
        //dispatch_resume(_internal->garbageCollectTimer);
        
        //        NSData *data = [[NSData alloc] initWithContentsOfFile: [[NSBundle bundleForClass: [self class]] pathForResource: @"VMKParser"
        //                                                                                                                 ofType: @"lua"]];
        //
        //        NSLog(@"%@", [data base64EncodedString]);
        
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

- (void)_gabageCollectByTimer: (NSTimer *)timer
{
    pthread_mutex_lock(&_internal->lock);
    lua_gc(_internal->luaState, LUA_GCCOLLECT, 0);
    pthread_mutex_unlock(&_internal->lock);

}

static void VMKMachineServiceParseSourceCode(VMKMachineService *self, NSString *sourceCode, VCallbackBlock callback)
{
    VMKLuaStateRef luaStateRef = self->_internal->parserState;
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
        if (callback)
        {
            callback( @[ @YES, @(ret) ] );
        }
    }else
    {
        if (callback)
        {
            callback(@[ @NO, @( lua_tostring(luaStateRef, 1) ) ]);
            
        }else
        {
            lua_error(luaStateRef);
        }
    }
}

- (void)registerGlobalConstants: (NSArray *)constants
{
    VMKLuaStateRef L = _internal->luaState;
    
    for (NSArray *obj in constants)
    {
        NSInteger value = [[obj objectAtIndex: 0] intValue];
        NSString *name = [obj objectAtIndex: 1];
        
        lua_pushinteger(L, value);
        lua_setglobal(L, [name UTF8String]);
    }
}

- (void)dumpSourceCode: (NSString *)sourceCode
                toPath: (NSString *)filePath
{
    VMKMachineServiceParseSourceCode(self,
                                     sourceCode,
                                     (^(NSArray *callbackArguments)
                                      {
                                          NSNumber *success = [callbackArguments objectAtIndex: 0];
                                          NSString *arg = [callbackArguments objectAtIndex: 1];
                                          
                                          if ([success boolValue])
                                          {
                                              VMKLuaStateRef luaStateRef = _internal->parserState;
                                              
                                              lua_dumpSourceCode(luaStateRef, [arg UTF8String], [filePath UTF8String]);
                                              
                                          }else
                                          {
                                              NSLog(@"in func: %s error: %@", __func__, arg);
                                          }
                                      }));
}

- (void)debugSourceFile: (NSArray *)sourceCodes
{
    VMKLuaStateRef luaStateRef = _internal->luaState;
    
    for (NSString *sourceCodeLooper in sourceCodes)
    {
        VMKMachineServiceParseSourceCode(self,
                                         sourceCodeLooper,
                                         (^(NSArray *callbackArguments)
                                          {
                                              NSNumber *success = [callbackArguments objectAtIndex: 0];
                                              NSString *arg = [callbackArguments objectAtIndex: 1];
                                              
                                              if ([success boolValue])
                                              {
                                                  if(luaL_dostring(luaStateRef, [arg UTF8String]) != LUA_OK)
                                                  {
                                                      lua_error(luaStateRef);
                                                      return ;
                                                  }
                                                  
                                              }else
                                              {
                                                  NSLog(@"in func: %s error: %@", __func__, arg);
                                              }
                                          }));
    }
    
    lua_getglobal(luaStateRef, "main");
    
    if(lua_pcall(luaStateRef, 0, 0, 0) != LUA_OK)
    {
        lua_error(luaStateRef);
    }
}

- (void)parseSourceCode: (NSString *)sourceCode
{
    VMKMachineServiceParseSourceCode(self, sourceCode, nil);
}

- (void)executeFunctionName: (NSString *)functionName
               inSourceCode: (NSString *) sourceCode
          argumentPassBlock: (VMKBlock)block
              argumentCount: (int)argumentCount
                returnCount: (int)returnCount
                 completion: (VMKBlock)completion
{
    VMKLuaStateRef luaStateRef = _internal->luaState;
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
        [self doSourceCode: sourceCode];
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
                    printf("[VMKMachineService] warning: push arguments to `void'-arguments-function\n");
                }
                
                block(luaStateRef);
            }
            
            //execute
            //
            //printf("[VMKMachineService] debug: will call lua function: %s\n", functionNameString);
            
            status = lua_pcall(luaStateRef, argumentCount, returnCount, 0);
            
            if (status != LUA_OK)
            {
                lua_error(luaStateRef);
            }
            
            //deal return value
            //
            if (completion)
            {
                if (0 == returnCount)
                {
                    printf("[VMKMachineService] warning: deal return value on `void'-return-function\n");
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

- (void)doSourceCode: (NSString *)sourceCode
{
    if ([_md5OfParsedString indexOfObject: sourceCode] == NSNotFound)
    {
        [_md5OfParsedString addObject: sourceCode];
        
        VMKLuaStateRef luaStateRef = _internal->luaState;
        
        //parse source code to lua code
        //
        VMKMachineServiceParseSourceCode(self, sourceCode,
                                         (^(NSArray *callbackArguments)
                                          {
                                              
                                              NSNumber *success = [callbackArguments objectAtIndex: 0];
                                              NSString *arg = [callbackArguments objectAtIndex: 1];
                                              
                                              if ([success boolValue])
                                              {
                                                  
                                                  if (luaL_dostring(luaStateRef, [arg UTF8String]) != LUA_OK)
                                                  {
                                                      lua_error(luaStateRef);
                                                  }
                                              }else
                                              {
                                                  
                                              }
                                          }));
    }
}

@end

#pragma mark - engine id

NSString * const VMKMachineObjCSupport = @"lua-engine.feature.objc";

NSString * const VMKMachineUIKitSupport = @"lua-engine.feature.uikit";

NSString * const VMKMachineParserSupport = @"lua-engine.feature.lpeg";

void LuaCall(NSString *sourceCode, NSString *functionName, VMKBlock start, int argumentCount, int returnCount, VMKBlock completion
             )
{
    [[VMKMachineService sharedService] executeFunctionName: functionName
                                              inSourceCode: sourceCode
                                         argumentPassBlock: start
                                             argumentCount: argumentCount
                                               returnCount: returnCount
                                                completion: completion];
}

