//
//  main.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaEngineService.h"
#import "LuaObjCInternal.h"

int main(int argc, char *argv[])
{    
    @autoreleasepool 
    {      
        //objc_dumpClass(NSClassFromString(@"NSString"));
        
        NSString *sourceFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"Test.v"];
        NSString *sourceCode = [NSString stringWithContentsOfFile: sourceFilePath
                                                         encoding: NSUTF8StringEncoding
                                                            error: NULL];        
        
        LuaCall(sourceCode, @"main", nil, 0, 1, nil);
    }
}
