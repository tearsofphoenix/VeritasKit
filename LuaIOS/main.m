//
//  main.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaEngineService.h"

static int test(id obj)
{
    printf("test\n");
    return 2;
}

int main(int argc, char *argv[])
{
    @autoreleasepool 
    {           
        NSString *sourceFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"Test.v"];
        NSString *sourceCode = [NSString stringWithContentsOfFile: sourceFilePath
                                                         encoding: NSUTF8StringEncoding
                                                            error: NULL];        
        
        LuaCall(sourceCode, @"main", nil, 0, 1, nil);
    }
}
