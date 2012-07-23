//
//  main.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaEngineService.h"
#import "LuaObjCInternal.h"
#import "LuaObjCProfile.h"
#import "LuaObjCClass.h"
#import "ffi.h"
#import <objc/runtime.h>
#import "lua.h"

int main(int argc, char *argv[])
{    
    @autoreleasepool
    {                
        NSTimeInterval start_time = [NSDate timeIntervalSinceReferenceDate];
        printf("start-time: %f\n", start_time);
        
        NSTimeInterval end_time = [NSDate timeIntervalSinceReferenceDate];
        
        printf("end-time: %f interval: %f\n", end_time, end_time - start_time);        
        
        NSString *sourceFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"Test.v"];
        NSString *sourceCode = [NSString stringWithContentsOfFile: sourceFilePath
                                                         encoding: NSUTF8StringEncoding
                                                            error: NULL];        
        LuaCall(sourceCode, @"main", nil, 0, 1, nil);
    }
}
