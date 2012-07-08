//
//  LuaCGLayer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGLayer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaCGGeometry.h"

static int lua_CGLayerCreateWithContext(lua_State *L)
{
    CGSize *s = lua_touserdata(L, 2);
    lua_pushlightuserdata(L, CGLayerCreateWithContext(lua_touserdata(L, 1), *s, lua_touserdata(L, 3)));
    return 1;
}

static int lua_CGLayerRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGLayerRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGLayerRelease(lua_State *L)
{
    CGLayerRelease(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGLayerGetSize(lua_State *L)
{
    lua_pushCGSize(L, CGLayerGetSize(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGLayerGetContext(lua_State *L)
{
    lua_pushlightuserdata(L, CGLayerGetContext(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGLayerGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGLayerGetTypeID());
    return 1;
}

static const luaL_Reg __LuaCGLayerAPIs[] = {
    {"CGLayerCreateWithContext", lua_CGLayerCreateWithContext},
    {"CGLayerRetain", lua_CGLayerRetain},
    {"CGLayerRelease", lua_CGLayerRelease},
    {"CGLayerGetSize", lua_CGLayerGetSize},
    {"CGLayerGetContext", lua_CGLayerGetContext},
    {"CGLayerGetTypeID", lua_CGLayerGetTypeID},
    {NULL, 0},
};

int LuaOpenCGLayer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGLayerAPIs);
    return 0;
}
