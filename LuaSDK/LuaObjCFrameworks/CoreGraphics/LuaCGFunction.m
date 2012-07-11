//
//  LuaCGFunction.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGFunction.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"

static int lua_CGFunctionGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGFunctionGetTypeID());
    return 1;
}

#if 0
static int lua_CGFunctionCreate(lua_State *L)
{
    CGFloat *domain = NULL; 
    size_t domainDimension = luasdk_get_arrayf(L, 2, &domain);

    CGFloat *range = NULL;
    size_t rangeDimension = luasdk_get_arrayf(L, 3, &range);
    CGFunctionCallbacks *callbacks = lua_touserdata(L, 4);
    lua_pushlightuserdata(L, CGFunctionCreate(lua_touserdata(L, 1), domainDimension, domain,
                                              rangeDimension, range, callbacks));
    return 1;
}

#endif

static int lua_CGFunctionRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGFunctionRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFunctionRelease(lua_State *L)
{
    CGFunctionRelease(lua_touserdata(L, 1));
    return 0;
}

static const luaL_Reg __LuaCGFunctionAPIs[] = 
{
    {"CGFunctionGetTypeID", lua_CGFunctionGetTypeID},
#if 0
    {"CGFunctionCreate", lua_CGFunctionCreate},
#endif
    {"CGFunctionRetain", lua_CGFunctionRetain},
    {"CGFunctionRelease", lua_CGFunctionRelease},
    {NULL, 0},
};


int LuaOpenCGFunction(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGFunctionAPIs);
    return 0;
}
