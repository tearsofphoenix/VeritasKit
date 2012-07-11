//
//  LuaCGColorSpace.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGColorSpace.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaCGColorSpaceConstants[] = 
{
    {"kCGRenderingIntentDefault", kCGRenderingIntentDefault},
    {"kCGRenderingIntentAbsoluteColorimetric", kCGRenderingIntentAbsoluteColorimetric},
    {"kCGRenderingIntentRelativeColorimetric", kCGRenderingIntentRelativeColorimetric},
    {"kCGRenderingIntentPerceptual", kCGRenderingIntentPerceptual},
    {"kCGRenderingIntentSaturation", kCGRenderingIntentSaturation},
    {"kCGColorSpaceModelUnknown", kCGColorSpaceModelUnknown},
    {"kCGColorSpaceModelMonochrome", kCGColorSpaceModelMonochrome},
    {"kCGColorSpaceModelRGB", kCGColorSpaceModelRGB},
    {"kCGColorSpaceModelCMYK", kCGColorSpaceModelCMYK},
    {"kCGColorSpaceModelLab", kCGColorSpaceModelLab},
    {"kCGColorSpaceModelDeviceN", kCGColorSpaceModelDeviceN},
    {"kCGColorSpaceModelIndexed", kCGColorSpaceModelIndexed},
    {"kCGColorSpaceModelPattern", kCGColorSpaceModelPattern},
    {NULL, 0},
};



static int lua_CGColorSpaceCreateDeviceGray(lua_State *L)
{
    lua_pushlightuserdata(L, CGColorSpaceCreateDeviceGray());
    return 1;
}

static int lua_CGColorSpaceCreateDeviceRGB(lua_State *L)
{
    lua_pushlightuserdata(L, CGColorSpaceCreateDeviceRGB());
    return 1;
}

static int lua_CGColorSpaceCreateDeviceCMYK(lua_State *L)
{
    lua_pushlightuserdata(L, CGColorSpaceCreateDeviceCMYK());
    return 1;
}

#if 0
static int lua_CGColorSpaceCreateCalibratedGray(lua_State *L)
{
    CGFloat *whitePoint = NULL;
    luasdk_get_arrayf(L, 1, &whitePoint);
    CGFloat *blackPoint = NULL;
    luasdk_get_arrayf(L, 2, &blackPoint);
    CGFloat gamma = lua_tonumber(L, 3);
    lua_pushlightuserdata(L, CGColorSpaceCreateCalibratedGray(whitePoint, blackPoint, gamma));
    return 1;
}

static int lua_CGColorSpaceCreateCalibratedRGB(lua_State *L)
{
    CGFloat *whitePoint = NULL;
    luasdk_get_arrayf(L, 1, &whitePoint);
    CGFloat *blackPoint = NULL;
    luasdk_get_arrayf(L, 2, &blackPoint);
    CGFloat *gamma = NULL;
    luasdk_get_arrayf(L, 3, &gamma);
    CGFloat *matrix = NULL;
    luasdk_get_arrayf(L, 4, &matrix);
    
    lua_pushlightuserdata(L, CGColorSpaceCreateCalibratedRGB(whitePoint, blackPoint, gamma, matrix));
    return 1;
}

static int lua_CGColorSpaceCreateLab(lua_State *L)
{
    CGFloat *whitePoint = NULL;
    luasdk_get_arrayf(L, 1, &whitePoint);
    CGFloat *blackPoint = NULL;
    luasdk_get_arrayf(L, 2, &blackPoint);
    CGFloat *range = NULL;
    luasdk_get_arrayf(L, 3, &range);
    lua_pushlightuserdata(L, CGColorSpaceCreateLab(whitePoint, blackPoint, range));
    return 1;
}

static int lua_CGColorSpaceCreateICCBased(lua_State *L)
{
    size_t nComponents = lua_tointeger(L, 1);
    CGFloat *range = NULL;
    luasdk_get_arrayf(L, 2, &range);
    CGDataProviderRef profile = lua_touserdata(L, 3);
    CGColorSpaceRef alternate = lua_touserdata(L, 4);
    lua_pushlightuserdata(L, CGColorSpaceCreateICCBased(nComponents, range, profile, alternate));
    return 1;
}

#endif

static int lua_CGColorSpaceCreateWithICCProfile(lua_State *L)
{
    lua_pushlightuserdata(L, CGColorSpaceCreateWithICCProfile(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGColorSpaceCreateIndexed(lua_State *L)
{
    CGColorSpaceRef baseSpace = lua_touserdata(L, 1);
    size_t lastIndex = lua_tointeger(L, 2);
    const unsigned char *colorTable = lua_touserdata(L, 3);
    lua_pushlightuserdata(L, CGColorSpaceCreateIndexed(baseSpace, lastIndex, colorTable));
    return 1;
}

static int lua_CGColorSpaceCreatePattern(lua_State *L)
{
    lua_pushlightuserdata(L, CGColorSpaceCreatePattern(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGColorSpaceCreateWithName(lua_State *L)
{
    lua_pushlightuserdata(L, CGColorSpaceCreateWithName(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGColorSpaceRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGColorSpaceRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGColorSpaceRelease(lua_State *L)
{
    CGColorSpaceRelease(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGColorSpaceGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGColorSpaceGetTypeID());
    return 1;
}

static int lua_CGColorSpaceGetNumberOfComponents(lua_State *L)
{
    lua_pushinteger(L, CGColorSpaceGetNumberOfComponents(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGColorSpaceGetModel(lua_State *L)
{
    lua_pushinteger(L, CGColorSpaceGetModel(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGColorSpaceGetBaseColorSpace(lua_State *L)
{
    lua_pushlightuserdata(L, CGColorSpaceGetBaseColorSpace(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGColorSpaceGetColorTableCount(lua_State *L)
{
    lua_pushinteger(L, CGColorSpaceGetColorTableCount(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGColorSpaceGetColorTable(lua_State *L)
{
    CGColorSpaceRef space = lua_touserdata(L, 1);
    uint8_t table;
    CGColorSpaceGetColorTable(space, &table);
    lua_pushinteger(L, table);
    return 1;
}



static const luaL_Reg __LuaCGColorSpaceAPIs[] = 
{
    {"CGColorSpaceCreateDeviceGray", lua_CGColorSpaceCreateDeviceGray},
    {"CGColorSpaceCreateDeviceRGB", lua_CGColorSpaceCreateDeviceRGB},
    {"CGColorSpaceCreateDeviceCMYK", lua_CGColorSpaceCreateDeviceCMYK},
#if 0
    {"CGColorSpaceCreateCalibratedGray", lua_CGColorSpaceCreateCalibratedGray},
    {"CGColorSpaceCreateCalibratedRGB", lua_CGColorSpaceCreateCalibratedRGB},
    {"CGColorSpaceCreateLab", lua_CGColorSpaceCreateLab},
    {"CGColorSpaceCreateICCBased", lua_CGColorSpaceCreateICCBased},
#endif
    {"CGColorSpaceCreateWithICCProfile", lua_CGColorSpaceCreateWithICCProfile},
    {"CGColorSpaceCreateIndexed", lua_CGColorSpaceCreateIndexed},
    {"CGColorSpaceCreatePattern", lua_CGColorSpaceCreatePattern},
    {"CGColorSpaceCreateWithName", lua_CGColorSpaceCreateWithName},
    {"CGColorSpaceRetain", lua_CGColorSpaceRetain},
    {"CGColorSpaceRelease", lua_CGColorSpaceRelease},
    {"CGColorSpaceGetTypeID", lua_CGColorSpaceGetTypeID},
    {"CGColorSpaceGetNumberOfComponents", lua_CGColorSpaceGetNumberOfComponents},
    {"CGColorSpaceGetModel", lua_CGColorSpaceGetModel},
    {"CGColorSpaceGetBaseColorSpace", lua_CGColorSpaceGetBaseColorSpace},
    {"CGColorSpaceGetColorTableCount", lua_CGColorSpaceGetColorTableCount},
    {"CGColorSpaceGetColorTable", lua_CGColorSpaceGetColorTable},
    {NULL, NULL},
};


int LuaOpenCGColorSpace(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaCGColorSpaceConstants);
    luaObjC_loadGlobalFunctions(L, __LuaCGColorSpaceAPIs);
    return 0;
}
