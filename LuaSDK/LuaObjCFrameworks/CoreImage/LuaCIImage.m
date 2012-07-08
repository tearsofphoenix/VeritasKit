//
//  LuaCIImage.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCIImage.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CIImageColorSpace(lua_State *L)
{
    CIImageColorSpace(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIImageProperties(lua_State *L)
{
    CIImageProperties(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIImageProperties(lua_State *L)
{
    CIImageProperties(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIImageAutoAdjustEnhance(lua_State *L)
{
    CIImageAutoAdjustEnhance(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIImageAutoAdjustRedEye(lua_State *L)
{
    CIImageAutoAdjustRedEye(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIImageAutoAdjustFeatures(lua_State *L)
{
    CIImageAutoAdjustFeatures(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCIImageAPIs[] = {
    {"CIImageColorSpace", lua_CIImageColorSpace},
    {"CIImageProperties", lua_CIImageProperties},
    {"CIImageProperties", lua_CIImageProperties},
    {"CIImageAutoAdjustEnhance", lua_CIImageAutoAdjustEnhance},
    {"CIImageAutoAdjustRedEye", lua_CIImageAutoAdjustRedEye},
    {"CIImageAutoAdjustFeatures", lua_CIImageAutoAdjustFeatures},
    {NULL, NULL},
};

int LuaOpenCIImage(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCIImageAPIs);
    return 0;
}
