//
//  LuaUIImage.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIImage.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIImageConstants[] = {
    {"UIImageOrientationUp", UIImageOrientationUp},
    {"UIImageOrientationDown", UIImageOrientationDown},
    {"UIImageOrientationLeft", UIImageOrientationLeft},
    {"UIImageOrientationRight", UIImageOrientationRight},
    {"UIImageOrientationUpMirrored", UIImageOrientationUpMirrored},
    {"UIImageOrientationDownMirrored", UIImageOrientationDownMirrored},
    {"UIImageOrientationLeftMirrored", UIImageOrientationLeftMirrored},
    {"UIImageOrientationRightMirrored", UIImageOrientationRightMirrored},
    {NULL, 0},
};


static int lua_UIImagePNGRepresentation(lua_State *L)
{
    lua_pushlightuserdata(L, UIImagePNGRepresentation(lua_touserdata(L, 1)));
    return 1;
}

static int lua_UIImageJPEGRepresentation(lua_State *L)
{
    lua_pushlightuserdata(L, UIImageJPEGRepresentation(lua_touserdata(L, 1), lua_tonumber(L, 2)));
    return 1;
}

static const luaL_Reg __LuaUIImageAPIs[] = 
{
    {"UIImagePNGRepresentation", lua_UIImagePNGRepresentation},
    {"UIImageJPEGRepresentation", lua_UIImageJPEGRepresentation},
    {NULL, NULL},
};


int LuaOpenUIImage(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIImageConstants);
    luaObjC_loadGlobalFunctions(L, __LuaUIImageAPIs);
    return 0;
}
