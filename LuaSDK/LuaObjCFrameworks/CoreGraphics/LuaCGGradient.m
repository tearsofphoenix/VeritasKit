//
//  LuaCGGradient.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGGradient.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaCGGradientConstants[] = 
{
    {"kCGGradientDrawsBeforeStartLocation", kCGGradientDrawsBeforeStartLocation},
    {"kCGGradientDrawsAfterEndLocation", kCGGradientDrawsAfterEndLocation},
    {NULL, 0},
};

static int lua_CGGradientGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGGradientGetTypeID());
    return 1;
}

#if 0
static int lua_CGGradientCreateWithColorComponents(lua_State *L)
{
    CGFloat *components = NULL;
    luasdk_get_arrayf(L, 2, &components);
    CGFloat *locations = NULL;
    size_t count = luasdk_get_arrayf(L, 3, &locations);
    lua_pushlightuserdata(L, CGGradientCreateWithColorComponents(lua_touserdata(L, 1), components, locations, count));
    return 1;
}

static int lua_CGGradientCreateWithColors(lua_State *L)
{
    CGFloat *locations = NULL;
    luasdk_get_arrayf(L, 3, &locations);
    lua_pushlightuserdata(L, CGGradientCreateWithColors(lua_touserdata(L, 1), lua_touserdata(L, 2), locations));
    return 1;
}
#endif

static int lua_CGGradientRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGGradientRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGGradientRelease(lua_State *L)
{
    CGGradientRelease(lua_touserdata(L, 1));
    return 0;
}

static const luaL_Reg __LuaCGGradientAPIs[] = 
{
    {"CGGradientGetTypeID", lua_CGGradientGetTypeID},
#if 0
    {"CGGradientCreateWithColorComponents", lua_CGGradientCreateWithColorComponents},
    {"CGGradientCreateWithColors", lua_CGGradientCreateWithColors},
#endif
    {"CGGradientRetain", lua_CGGradientRetain},
    {"CGGradientRelease", lua_CGGradientRelease},
    {NULL, 0},
};


int LuaOpenCGGradient(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaCGGradientConstants);
    luaObjC_loadGlobalFunctions(L, __LuaCGGradientAPIs);
    return 0;
}
