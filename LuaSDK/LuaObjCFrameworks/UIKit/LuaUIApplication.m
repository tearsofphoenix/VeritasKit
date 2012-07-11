//
//  LuaUIApplication.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIApplication.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static int lua_UIApplicationMain(lua_State *L)
{
    int argc = luaL_checkinteger(L, 1);
    const char **argv =  NULL;
    NSString * principalClassName = luaObjC_checkNSObject(L, 3);
    NSString * delegateClassName = luaObjC_checkNSObject(L, 4);
    
    lua_pushinteger(L, UIApplicationMain(argc, (char **)argv, principalClassName, delegateClassName));
    
    return 1;
}

static const luaL_Reg __luaUIApplicationAPIs[] = 
{
    {"UIApplicationMain", lua_UIApplicationMain},
    {NULL, NULL},
};

int LuaOpenUIApplication(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __luaUIApplicationAPIs);
    return 0;
}
