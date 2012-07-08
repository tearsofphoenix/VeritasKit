//
//  LuaCFNetServices.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFNetServices.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFNetServicesError(lua_State *L)
{
    CFNetServicesError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNetServicesError(lua_State *L)
{
    CFNetServicesError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNetServicesErrorUnknown(lua_State *L)
{
    CFNetServicesErrorUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNetServicesErrorCollision(lua_State *L)
{
    CFNetServicesErrorCollision(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNetServicesErrorNotFound(lua_State *L)
{
    CFNetServicesErrorNotFound(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNetServicesErrorInProgress(lua_State *L)
{
    CFNetServicesErrorInProgress(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNetServicesErrorBadArgument(lua_State *L)
{
    CFNetServicesErrorBadArgument(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNetServicesErrorCancel(lua_State *L)
{
    CFNetServicesErrorCancel(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNetServicesErrorInvalid(lua_State *L)
{
    CFNetServicesErrorInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNetServicesErrorTimeout(lua_State *L)
{
    CFNetServicesErrorTimeout(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNetServicesError(lua_State *L)
{
    CFNetServicesError(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFNetServicesAPIs[] = {
    {"CFNetServicesError", lua_CFNetServicesError},
    {"CFNetServicesError", lua_CFNetServicesError},
    {"CFNetServicesErrorUnknown", lua_CFNetServicesErrorUnknown},
    {"CFNetServicesErrorCollision", lua_CFNetServicesErrorCollision},
    {"CFNetServicesErrorNotFound", lua_CFNetServicesErrorNotFound},
    {"CFNetServicesErrorInProgress", lua_CFNetServicesErrorInProgress},
    {"CFNetServicesErrorBadArgument", lua_CFNetServicesErrorBadArgument},
    {"CFNetServicesErrorCancel", lua_CFNetServicesErrorCancel},
    {"CFNetServicesErrorInvalid", lua_CFNetServicesErrorInvalid},
    {"CFNetServicesErrorTimeout", lua_CFNetServicesErrorTimeout},
    {"CFNetServicesError", lua_CFNetServicesError},
    {NULL, NULL},
};

int LuaOpenCFNetServices(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFNetServicesAPIs);
    return 0;
}
