//
//  LuaCGShading.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGShading.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaCGGeometry.h"

static int lua_CGShadingGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGShadingGetTypeID());
    return 1;
}

static int lua_CGShadingCreateAxial(lua_State *L)
{
    CGPoint *start = lua_touserdata(L, 2);
    CGPoint *end = lua_touserdata(L, 3);
    CGFunctionRef function = lua_touserdata(L, 4);
    bool extendStart = lua_toboolean(L, 5);
    bool extendEnd = lua_toboolean(L, 6);
    
    lua_pushlightuserdata(L, CGShadingCreateAxial(lua_touserdata(L, 1), *start, *end, function, extendStart, extendEnd));
    return 1;
}

static int lua_CGShadingCreateRadial(lua_State *L)
{
    CGPoint *start = lua_touserdata(L, 2);
    CGFloat startRadius = lua_tonumber(L, 3);
    CGPoint *end = lua_touserdata(L, 4);
    CGFloat endRadius = lua_tonumber(L, 5);
    CGFunctionRef function = lua_touserdata(L, 6);
    bool extendStart = lua_toboolean(L, 7);
    bool extendEnd = lua_toboolean(L, 8);

    lua_pushlightuserdata(L, CGShadingCreateRadial(lua_touserdata(L, 1), *start, startRadius, *end, endRadius, function, extendStart, extendEnd));
    return 1;
}

static int lua_CGShadingRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGShadingRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGShadingRelease(lua_State *L)
{
    CGShadingRelease(lua_touserdata(L, 1));
    return 0;
}

static const luaL_Reg __LuaCGShadingAPIs[] = 
{
    {"CGShadingGetTypeID", lua_CGShadingGetTypeID},
    {"CGShadingCreateAxial", lua_CGShadingCreateAxial},
    {"CGShadingCreateRadial", lua_CGShadingCreateRadial},
    {"CGShadingRetain", lua_CGShadingRetain},
    {"CGShadingRelease", lua_CGShadingRelease},
    {NULL, NULL},
};

int LuaOpenCGShading(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGShadingAPIs);
    return 0;
}
