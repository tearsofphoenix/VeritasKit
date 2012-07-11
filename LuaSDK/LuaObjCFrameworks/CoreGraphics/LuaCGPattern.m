//
//  LuaCGPattern.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGPattern.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaCGContextConstants[] = {
    {"kCGPatternTilingNoDistortion", kCGPatternTilingNoDistortion},
    {"kCGPatternTilingConstantSpacingMinimalDistortion", kCGPatternTilingConstantSpacingMinimalDistortion},
    {"kCGPatternTilingConstantSpacing", kCGPatternTilingConstantSpacing},
    {NULL, 0},
};

static int lua_CGPatternGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGPatternGetTypeID());
    return 1;
}

static int lua_CGPatternCreate(lua_State *L)
{
    CGRect *bounds = lua_touserdata(L, 2);
    CGAffineTransform *matrix = lua_touserdata(L, 3);
    CGFloat xStep = lua_tonumber(L, 4);
    CGFloat yStep = lua_tonumber(L, 5);
    CGPatternTiling tiling = lua_tointeger(L, 6);
    bool isColored = lua_toboolean(L, 7);
    const CGPatternCallbacks *callbacks = lua_touserdata(L, 8);
    lua_pushlightuserdata(L, CGPatternCreate(lua_touserdata(L, 1),
                                             *bounds, *matrix,
                                             xStep, yStep,
                                             tiling, isColored,
                                             callbacks));
    return 1;
}

static int lua_CGPatternRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGPatternRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPatternRelease(lua_State *L)
{
    CGPatternRelease(lua_touserdata(L, 1));
    return 0;
}

static const luaL_Reg __LuaCGPatternAPIs[] = {
    {"CGPatternGetTypeID", lua_CGPatternGetTypeID},
    {"CGPatternCreate", lua_CGPatternCreate},
    {"CGPatternRetain", lua_CGPatternRetain},
    {"CGPatternRelease", lua_CGPatternRelease},
    {NULL, NULL},
};

int LuaOpenCGPattern(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaCGContextConstants);
    luaObjC_loadGlobalFunctions(L, __LuaCGPatternAPIs);
    return 0;
}
