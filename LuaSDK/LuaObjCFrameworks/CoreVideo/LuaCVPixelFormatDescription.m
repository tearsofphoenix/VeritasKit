//
//  LuaCVPixelFormatDescription.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCVPixelFormatDescription.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CVPixelFormatDescriptionCreateWithPixelFormatType(lua_State *L)
{
    CVPixelFormatDescriptionCreateWithPixelFormatType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelFormatDescriptionArrayCreateWithAllPixelFormatTypes(lua_State *L)
{
    CVPixelFormatDescriptionArrayCreateWithAllPixelFormatTypes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelFormatDescriptionRegisterDescriptionWithPixelFormatType(lua_State *L)
{
    CVPixelFormatDescriptionRegisterDescriptionWithPixelFormatType(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCVPixelFormatDescriptionAPIs[] = {
    {"CVPixelFormatDescriptionCreateWithPixelFormatType", lua_CVPixelFormatDescriptionCreateWithPixelFormatType},
    {"CVPixelFormatDescriptionArrayCreateWithAllPixelFormatTypes", lua_CVPixelFormatDescriptionArrayCreateWithAllPixelFormatTypes},
    {"CVPixelFormatDescriptionRegisterDescriptionWithPixelFormatType", lua_CVPixelFormatDescriptionRegisterDescriptionWithPixelFormatType},
    {NULL, NULL},
};

int LuaOpenCVPixelFormatDescription(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCVPixelFormatDescriptionAPIs);
    return 0;
}
