//
//  VBridgeService.m
//  LuaIOS
//
//  Created by tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VBridgeService.h"
#import "LuaBridgeSupportFileParser.h"
#import "lua.h"
#import "LuaBridgeInfo.h"

static NSMutableDictionary *__registeredFrameworks = nil;

@implementation VBridgeService

+ (void)load
{
    [super registerService: self];
}

+ (id)identity
{
    return VBridgeServiceIdentifier;
}

- (id)init
{
    if ((self = [super init]))
    {
        __registeredFrameworks = [[NSMutableDictionary alloc] init];
        
        [self initServerProcessors];
    }
    
    return self;
}

- (void)initServerProcessors
{
    [self registerBlock: (^(VCallbackBlock callback, NSString *action, NSArray *arguments)
                          {
                              NSString *frameworkName = [arguments objectAtIndex: 0];
                              
                              if (! CFDictionaryGetValue((CFDictionaryRef)__registeredFrameworks, frameworkName) )
                              {
                                  NSString *bridgeFilePath = [[NSBundle bundleForClass: [self class]] pathForResource: frameworkName
                                                                                                               ofType: @"bridgesupport"];
                                  NSError *error = nil;
                                  NSString *bridgeFileContent = [NSString stringWithContentsOfFile: bridgeFilePath
                                                                                          encoding: NSUTF8StringEncoding
                                                                                             error: &error];
                                  if (error)
                                  {
#if DEBUG
                                      //NSLog(@"in func error: %@ framework name: %@", error, frameworkName);
#endif
                                  }else
                                  {
                                      [__registeredFrameworks setObject: [LuaBridgeSupportFileParser parseFileContents: bridgeFileContent]
                                                                 forKey: frameworkName];
                                  }
                              }
                          })
              forAction: VBridgeServiceImportFrameworkAction];
    
    [self registerBlock: (^(VCallbackBlock callback, NSString *action, NSArray *arguments)
                          {
                              NSString *name = [arguments objectAtIndex: 0];
                              lua_State *state = [[arguments objectAtIndex: 1] pointerValue];
                              
                              for (NSDictionary *framework in [__registeredFrameworks allValues])
                              {
                                  LuaBridgeInfo *info = CFDictionaryGetValue((CFDictionaryRef)framework, name);
                                  if (info)
                                  {
                                      [info resolveIntoLuaState: state];
                                      break;
                                  }
                              }
                          })
              forAction: VBridgeServiceResolveNameIntoStateAction];
}

@end

NSString * const VBridgeServiceIdentifier = @"com.veritas.service.bridge-support";

NSString * const VBridgeServiceImportFrameworkAction = @"lua-engine.action.importFramework";

NSString * const VBridgeServiceResolveNameIntoStateAction = @"lua-engine.action.resolveNameIntoState";

