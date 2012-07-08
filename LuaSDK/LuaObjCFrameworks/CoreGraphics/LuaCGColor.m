//
//  LuaCGColor.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGColor.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"

static int lua_CGColorCreate(lua_State *L)
{
    CGColorSpaceRef space = lua_touserdata(L, 1);
    CGFloat *components = NULL;
    luasdk_get_arrayf(L, 2, &components);
    lua_pushlightuserdata(L, CGColorCreate(space, components));
    return 1;
}

static int lua_CGColorCreateWithPattern(lua_State *L)
{
    CGColorSpaceRef space = lua_touserdata(L, 1);
    CGPatternRef pattern = lua_touserdata(L, 2);
    CGFloat *components = NULL;
    luasdk_get_arrayf(L, 3, &components);
    lua_pushlightuserdata(L, CGColorCreateWithPattern(space, pattern, components));
    return 1;
}

static int lua_CGColorCreateCopy(lua_State *L)
{
    CGColorRef color = lua_touserdata(L, 1);
    lua_pushlightuserdata(L, CGColorCreateCopy(color));
    return 1;
}
static int lua_CGColorCreateCopyWithAlpha(lua_State *L)
{
    CGColorRef color = lua_touserdata(L, 1);
    CGFloat alpha = lua_tonumber(L, 2);
    lua_pushlightuserdata(L, CGColorCreateCopyWithAlpha(color, alpha));
    return 1;

}

static int lua_CGColorRetain(lua_State *L)
{
    CGColorRef color = lua_touserdata(L, 1);
    lua_pushlightuserdata(L, CGColorRetain(color));
    return 1;
}


static int lua_CGColorRelease(lua_State *L)
{
    CGColorRelease(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGColorEqualToColor(lua_State *L)
{
    CGColorRef color1 = lua_touserdata(L, 1);
    CGColorRef color2 = lua_touserdata(L, 2);

    lua_pushboolean(L, CGColorEqualToColor(color1, color2));
    return 1;
}

static int lua_CGColorGetNumberOfComponents(lua_State *L)
{
    lua_pushinteger(L, CGColorGetNumberOfComponents(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGColorGetComponents(lua_State *L)
{
   lua_pushlightuserdata(L, (void*)CGColorGetComponents(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGColorGetAlpha(lua_State *L)
{
   lua_pushnumber(L, CGColorGetAlpha(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGColorGetColorSpace(lua_State *L)
{
    lua_pushlightuserdata(L, CGColorGetColorSpace(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGColorGetPattern(lua_State *L)
{
    lua_pushlightuserdata(L, CGColorGetPattern(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGColorGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGColorGetTypeID());
    return 1;
}

static const luaL_Reg __luaCGColorAPIs[] = 
{
    {"CGColorCreate", lua_CGColorCreate},
    {"CGColorCreateWithPattern",lua_CGColorCreateWithPattern},
    {"CGColorCreateCopy", lua_CGColorCreateCopy},
    {"CGColorCreateCopyWithAlpha", lua_CGColorCreateCopyWithAlpha},
    {"CGColorRetain", lua_CGColorRetain},
    {"CGColorRelease", lua_CGColorRelease},
    {"CGColorEqualToColor", lua_CGColorEqualToColor},
    {"CGColorGetNumberOfComponents", lua_CGColorGetNumberOfComponents},
    {"CGColorGetComponents", lua_CGColorGetComponents},
    {"CGColorGetAlpha", lua_CGColorGetAlpha},
    {"CGColorGetColorSpace", lua_CGColorGetColorSpace},
    {"CGColorGetPattern", lua_CGColorGetPattern},
    {"CGColorGetTypeID", lua_CGColorGetTypeID},
    {NULL, NULL},
};

int LuaOpenCGColor(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __luaCGColorAPIs);
    return 0;
}
