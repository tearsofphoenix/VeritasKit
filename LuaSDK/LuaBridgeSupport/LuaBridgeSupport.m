//
//  LuaBridgeSupport.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 7/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaBridgeSupport.h"
#import "LuaBridgeSupportFileParser.h"
#import "lua.h"
#import "LuaBridgeInfo.h"

static NSMutableDictionary *__registeredFrameworks = nil;
static NSMutableArray *__registeredFrameworkNames = nil;

@implementation LuaBridgeSupport

+ (void)load
{
    if (!__registeredFrameworks) 
    {
        __registeredFrameworks = [[NSMutableDictionary alloc] init];
    }
    if (!__registeredFrameworkNames)
    {
        __registeredFrameworkNames = [[NSMutableArray alloc] init];
    }
    
    [super load];
}

+ (void)importFramework: (NSString *)frameworkName
{
    if ([__registeredFrameworkNames indexOfObject: frameworkName] == NSNotFound)
    {
        NSString *bridgeFilePath = [[NSBundle mainBundle] pathForResource: frameworkName
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
            [__registeredFrameworks addEntriesFromDictionary: [LuaBridgeSupportFileParser parseFileContents: bridgeFileContent]];
            [__registeredFrameworkNames addObject: frameworkName];        
        }
    }
}

+ (void)tryToResolveName: (NSString *)name
            intoLuaState: (struct lua_State *)state
{
    LuaBridgeInfo *info = [__registeredFrameworks objectForKey: name];
    [info resolveIntoLuaState: state];
}

@end
