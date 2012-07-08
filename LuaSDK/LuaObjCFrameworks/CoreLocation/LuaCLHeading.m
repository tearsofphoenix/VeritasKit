//
//  LuaCLHeading.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCLHeading.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CLHeadingComponentValue(lua_State *L)
{
    CLHeadingComponentValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLHeadingComponentValue(lua_State *L)
{
    CLHeadingComponentValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLHeadingFilterNone(lua_State *L)
{
    CLHeadingFilterNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLHeadingFilterNone(lua_State *L)
{
    CLHeadingFilterNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLHeadingComponentValue(lua_State *L)
{
    CLHeadingComponentValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLHeadingComponentValue(lua_State *L)
{
    CLHeadingComponentValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLHeadingComponentValue(lua_State *L)
{
    CLHeadingComponentValue(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCLHeadingAPIs[] = {
    {"CLHeadingComponentValue", lua_CLHeadingComponentValue},
    {"CLHeadingComponentValue", lua_CLHeadingComponentValue},
    {"CLHeadingFilterNone", lua_CLHeadingFilterNone},
    {"CLHeadingFilterNone", lua_CLHeadingFilterNone},
    {"CLHeadingComponentValue", lua_CLHeadingComponentValue},
    {"CLHeadingComponentValue", lua_CLHeadingComponentValue},
    {"CLHeadingComponentValue", lua_CLHeadingComponentValue},
    {NULL, NULL},
};

int LuaOpenCLHeading(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCLHeadingAPIs);
    return 0;
}
