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
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaObjCAuxiliary.h"

static int test_foo(lua_State *L)
{
    id obj = luaObjC_checkNSObject(L, 1);
    NSLog(@"obj: %@", obj);
    return 0;
}

int main(int argc, char *argv[])
{    
    @autoreleasepool
    {                
        lua_State *state = luaL_newstate();
        lua_pushcfunction(state, test_foo);
        luaObjC_pushNSObject(state, @"\" ");
        stackDump(state);
        lua_pcall(state, 1, 0, 0);
        
        
        NSString *sourceFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"Test.v"];
        NSString *sourceCode = [NSString stringWithContentsOfFile: sourceFilePath
                                                         encoding: NSUTF8StringEncoding
                                                            error: NULL];        
        LuaCall(sourceCode, @"main", nil, 0, 1, nil);
    }
}
