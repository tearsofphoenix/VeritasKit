//
//  LuaBridgeSupport.m
//  LuaIOS
//
//  Created by tearsofphoenix on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaBridgeSupport.h"
#import "LuaBridgeSupportFileParser.h"
#import "lua.h"
#import "LuaBridgeInfo.h"

static NSMutableDictionary *__registeredFrameworks = nil;

@implementation LuaBridgeSupport

+ (void)load
{
    if (!__registeredFrameworks)
    {
        __registeredFrameworks = [[NSMutableDictionary alloc] init];
    }
    
    [super load];
}

+ (void)importFramework: (NSString *)frameworkName
{
    if (![__registeredFrameworks objectForKey: frameworkName])
    {
        NSString *bridgeFilePath = [[NSBundle bundleForClass: self] pathForResource: frameworkName
                                                                   ofType: @"bridgesupport"];
        NSError *error = nil;
        NSString *bridgeFileContent = [NSString stringWithContentsOfFile: bridgeFilePath
                                                                encoding: NSUTF8StringEncoding
                                                                   error: &error];
        if (error)
        {
            //NSLog(@"error: %@", error);
        }else
        {
            [__registeredFrameworks setObject: [LuaBridgeSupportFileParser parseFileContents: bridgeFileContent]
                                       forKey: frameworkName];
        }
    }
}

+ (void)tryToResolveName: (NSString *)name
            intoLuaState: (struct lua_State *)state
{
    [__registeredFrameworks enumerateKeysAndObjectsUsingBlock: (^(NSString *frameworkName, NSDictionary *framework, BOOL *stop)
                                                                {
                                                                    LuaBridgeInfo *info = [framework objectForKey: name];
                                                                    if (info)
                                                                    {
                                                                        *stop = YES;
                                                                        [info resolveIntoLuaState: state];
                                                                    }
                                                                })];
    
}

@end
