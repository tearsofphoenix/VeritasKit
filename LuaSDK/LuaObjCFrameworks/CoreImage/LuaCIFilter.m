//
//  LuaCIFilter.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCIFilter.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CIFilterConstructor(lua_State *L)
{
    CIFilterConstructor(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIFilterShape(lua_State *L)
{
    CIFilterShape(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIFilterShape(lua_State *L)
{
    CIFilterShape(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIFilterRegistry(lua_State *L)
{
    CIFilterRegistry(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIFilterConstructor(lua_State *L)
{
    CIFilterConstructor(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCIFilterAPIs[] = {
    {"CIFilterConstructor", lua_CIFilterConstructor},
    {"CIFilterShape", lua_CIFilterShape},
    {"CIFilterShape", lua_CIFilterShape},
    {"CIFilterRegistry", lua_CIFilterRegistry},
    {"CIFilterConstructor", lua_CIFilterConstructor},
    {NULL, NULL},
};

int LuaOpenCIFilter(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCIFilterAPIs);
    return 0;
}
