//
//  LuaCGBitmapContext.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGBitmapContext.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CGBitmapContextCreateWithData(lua_State *L)
{

   lua_pushlightuserdata(L, CGBitmapContextCreateWithData(lua_touserdata(L, 1), lua_tointeger(L, 2),
                                  lua_tointeger(L, 3), lua_tointeger(L, 4), 
                                  lua_tointeger(L, 5), lua_touserdata(L, 6),
                                  lua_tointeger(L, 7), lua_touserdata(L, 8),
                                  lua_touserdata(L, 9)));
    return 1;
}

static int lua_CGBitmapContextCreate(lua_State *L)
{
    lua_pushlightuserdata(L, CGBitmapContextCreate(lua_touserdata(L, 1),lua_tointeger(L, 2),
                                                   lua_tointeger(L, 3), lua_tointeger(L, 4), 
                                                   lua_tointeger(L, 5), lua_touserdata(L, 6),
                                                   lua_tointeger(L, 7)));
    return 1;
}

static int lua_CGBitmapContextGetData(lua_State *L)
{
   lua_pushlightuserdata(L, CGBitmapContextGetData(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGBitmapContextGetWidth(lua_State *L)
{
   lua_pushinteger(L, CGBitmapContextGetWidth(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGBitmapContextGetHeight(lua_State *L)
{
   lua_pushinteger(L, CGBitmapContextGetHeight(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGBitmapContextGetBitsPerComponent(lua_State *L)
{
   lua_pushinteger(L, CGBitmapContextGetBitsPerComponent(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGBitmapContextGetBitsPerPixel(lua_State *L)
{
    lua_pushinteger(L, CGBitmapContextGetBitsPerPixel(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGBitmapContextGetBytesPerRow(lua_State *L)
{
    lua_pushinteger(L, CGBitmapContextGetBytesPerRow(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGBitmapContextGetColorSpace(lua_State *L)
{
   lua_pushlightuserdata(L, CGBitmapContextGetColorSpace(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGBitmapContextGetAlphaInfo(lua_State *L)
{
   lua_pushinteger(L,  CGBitmapContextGetAlphaInfo(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGBitmapContextGetBitmapInfo(lua_State *L)
{
    lua_pushinteger(L, CGBitmapContextGetBitmapInfo(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGBitmapContextCreateImage(lua_State *L)
{
   lua_pushlightuserdata(L,  CGBitmapContextCreateImage(lua_touserdata(L, 1)));
    return 1;
}

static const luaL_Reg __luaCGBitmapContextAPIs[] = {
    {"CGBitmapContextCreateWithData", lua_CGBitmapContextCreateWithData},
    {"CGBitmapContextCreate", lua_CGBitmapContextCreate},
    {"CGBitmapContextGetData", lua_CGBitmapContextGetData},
    {"CGBitmapContextGetWidth", lua_CGBitmapContextGetWidth},
    {"CGBitmapContextGetHeight", lua_CGBitmapContextGetHeight},
    {"CGBitmapContextGetBitsPerComponent", lua_CGBitmapContextGetBitsPerComponent},
    {"CGBitmapContextGetBitsPerPixel", lua_CGBitmapContextGetBitsPerPixel},
    {"CGBitmapContextGetBytesPerRow", lua_CGBitmapContextGetBytesPerRow},
    {"CGBitmapContextGetColorSpace", lua_CGBitmapContextGetColorSpace},
    {"CGBitmapContextGetAlphaInfo", lua_CGBitmapContextGetAlphaInfo},
    {"CGBitmapContextGetBitmapInfo", lua_CGBitmapContextGetBitmapInfo},
    {"CGBitmapContextCreateImage", lua_CGBitmapContextCreateImage},
    {NULL, NULL},
};

int LuaOpenCGBitmapContext(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __luaCGBitmapContextAPIs);
    return 0;
}
