//
//  LuaCGImage.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGImage.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"
#import "LuaCGGeometry.h"

static const LuaSDKConst __luaCGContextConstants[] = {
    {"kCGImageAlphaNone", kCGImageAlphaNone},
    {"kCGImageAlphaPremultipliedLast", kCGImageAlphaPremultipliedLast},
    {"kCGImageAlphaPremultipliedFirst", kCGImageAlphaPremultipliedFirst},
    {"kCGImageAlphaLast", kCGImageAlphaLast},
    {"kCGImageAlphaFirst", kCGImageAlphaFirst},
    {"kCGImageAlphaNoneSkipLast", kCGImageAlphaNoneSkipLast},
    {"kCGImageAlphaNoneSkipFirst", kCGImageAlphaNoneSkipFirst},
    {"kCGImageAlphaOnly", kCGImageAlphaOnly},
    {"kCGBitmapAlphaInfoMask", kCGBitmapAlphaInfoMask},
    {"kCGBitmapFloatComponents", kCGBitmapFloatComponents},
    {"kCGBitmapByteOrderMask", kCGBitmapByteOrderMask},
    {"kCGBitmapByteOrderDefault", kCGBitmapByteOrderDefault},
    {"kCGBitmapByteOrder16Little", kCGBitmapByteOrder16Little},
    {"kCGBitmapByteOrder32Little", kCGBitmapByteOrder32Little},
    {"kCGBitmapByteOrder16Big", kCGBitmapByteOrder16Big},
    {"kCGBitmapByteOrder32Big", kCGBitmapByteOrder32Big},
#ifdef __BIG_ENDIAN__
    {"kCGBitmapByteOrder16Host", kCGBitmapByteOrder16Host},
    {"kCGBitmapByteOrder32Host", kCGBitmapByteOrder32Host},
#else
    {"kCGBitmapByteOrder16Host", kCGBitmapByteOrder16Host},
    {"kCGBitmapByteOrder32Host", kCGBitmapByteOrder32Host},
#endif
    {NULL, 0},
};

static int lua_CGImageGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGImageGetTypeID());
    return 1;
}

static int lua_CGImageCreate(lua_State *L)
{
    CGFloat *decode = NULL;
    luasdk_get_arrayf(L, 9, &decode);

    lua_pushlightuserdata(L, CGImageCreate(lua_tointeger(L, 1), lua_tointeger(L, 2),
                                           lua_tointeger(L, 3), lua_tointeger(L, 4),
                                           lua_tointeger(L, 5), lua_touserdata(L, 6),
                                           lua_tointeger(L, 7), lua_touserdata(L, 8),
                                           decode, lua_toboolean(L, 10),
                                           lua_tointeger(L, 11)));
    return 1;
}

static int lua_CGImageMaskCreate(lua_State *L)
{
    CGFloat *decode = NULL;
    luasdk_get_arrayf(L, 7, &decode);

    lua_pushlightuserdata(L, CGImageMaskCreate(lua_tointeger(L, 1), lua_tointeger(L, 2),
                                               lua_tointeger(L, 3), lua_tointeger(L, 4),
                                               lua_tointeger(L, 5), lua_touserdata(L, 6), 
                                               decode, lua_toboolean(L, 8)));
    return 1;
}

static int lua_CGImageCreateCopy(lua_State *L)
{
    lua_pushlightuserdata(L, CGImageCreateCopy(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageCreateWithJPEGDataProvider(lua_State *L)
{
    CGFloat *decode = NULL;
    luasdk_get_arrayf(L, 1, &decode);
    bool shouldInterpolate = lua_toboolean(L, 2);
    CGColorRenderingIntent intent = lua_tointeger(L, 3);

    lua_pushlightuserdata(L, CGImageCreateWithJPEGDataProvider(lua_touserdata(L, 1), decode, shouldInterpolate, intent));
    return 1;
}

static int lua_CGImageCreateWithPNGDataProvider(lua_State *L)
{
    CGFloat *decode = NULL;
    luasdk_get_arrayf(L, 1, &decode);
    bool shouldInterpolate = lua_toboolean(L, 2);
    CGColorRenderingIntent intent = lua_tointeger(L, 3);
    lua_pushlightuserdata(L, CGImageCreateWithPNGDataProvider(lua_touserdata(L, 1), decode, shouldInterpolate, intent));
    return 1;
}

static int lua_CGImageCreateWithImageInRect(lua_State *L)
{
    CGRect *r = lua_touserdata(L, 2);
    lua_pushlightuserdata(L, CGImageCreateWithImageInRect(lua_touserdata(L, 1), *r));
    return 1;
}

static int lua_CGImageCreateWithMask(lua_State *L)
{
    lua_pushlightuserdata(L, CGImageCreateWithMask(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGImageCreateWithMaskingColors(lua_State *L)
{
    lua_pushlightuserdata(L, CGImageCreateWithMaskingColors(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGImageCreateCopyWithColorSpace(lua_State *L)
{
    lua_pushlightuserdata(L, CGImageCreateCopyWithColorSpace(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGImageRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGImageRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageRelease(lua_State *L)
{
    CGImageRelease(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGImageIsMask(lua_State *L)
{
    lua_pushboolean(L, CGImageIsMask(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageGetWidth(lua_State *L)
{
    lua_pushinteger(L, CGImageGetWidth(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageGetHeight(lua_State *L)
{
    lua_pushinteger(L, CGImageGetHeight(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageGetBitsPerComponent(lua_State *L)
{
    lua_pushinteger(L, CGImageGetBitsPerComponent(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageGetBitsPerPixel(lua_State *L)
{
    lua_pushinteger(L, CGImageGetBitsPerPixel(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageGetBytesPerRow(lua_State *L)
{
    lua_pushinteger(L, CGImageGetBytesPerRow(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageGetColorSpace(lua_State *L)
{
    lua_pushlightuserdata(L, CGImageGetColorSpace(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageGetAlphaInfo(lua_State *L)
{
    lua_pushinteger(L, CGImageGetAlphaInfo(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageGetDataProvider(lua_State *L)
{
    lua_pushlightuserdata(L, CGImageGetDataProvider(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageGetDecode(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGImageGetDecode(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageGetShouldInterpolate(lua_State *L)
{
    lua_pushboolean(L, CGImageGetShouldInterpolate(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageGetRenderingIntent(lua_State *L)
{
    lua_pushinteger(L, CGImageGetRenderingIntent(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGImageGetBitmapInfo(lua_State *L)
{
    lua_pushinteger(L, CGImageGetBitmapInfo(lua_touserdata(L, 1)));
    return 1;
}

static const luaL_Reg __LuaCGImageAPIs[] = {
    {"CGImageGetTypeID", lua_CGImageGetTypeID},
    {"CGImageCreate", lua_CGImageCreate},
    {"CGImageMaskCreate", lua_CGImageMaskCreate},
    {"CGImageCreateCopy", lua_CGImageCreateCopy},
    {"CGImageCreateWithJPEGDataProvider", lua_CGImageCreateWithJPEGDataProvider},
    {"CGImageCreateWithPNGDataProvider", lua_CGImageCreateWithPNGDataProvider},
    {"CGImageCreateWithImageInRect", lua_CGImageCreateWithImageInRect},
    {"CGImageCreateWithMask", lua_CGImageCreateWithMask},
    {"CGImageCreateWithMaskingColors", lua_CGImageCreateWithMaskingColors},
    {"CGImageCreateCopyWithColorSpace", lua_CGImageCreateCopyWithColorSpace},
    {"CGImageRetain", lua_CGImageRetain},
    {"CGImageRelease", lua_CGImageRelease},
    {"CGImageIsMask", lua_CGImageIsMask},
    {"CGImageGetWidth", lua_CGImageGetWidth},
    {"CGImageGetHeight", lua_CGImageGetHeight},
    {"CGImageGetBitsPerComponent", lua_CGImageGetBitsPerComponent},
    {"CGImageGetBitsPerPixel", lua_CGImageGetBitsPerPixel},
    {"CGImageGetBytesPerRow", lua_CGImageGetBytesPerRow},
    {"CGImageGetColorSpace", lua_CGImageGetColorSpace},
    {"CGImageGetAlphaInfo", lua_CGImageGetAlphaInfo},
    {"CGImageGetDataProvider", lua_CGImageGetDataProvider},
    {"CGImageGetDecode", lua_CGImageGetDecode},
    {"CGImageGetShouldInterpolate", lua_CGImageGetShouldInterpolate},
    {"CGImageGetRenderingIntent", lua_CGImageGetRenderingIntent},
    {"CGImageGetBitmapInfo", lua_CGImageGetBitmapInfo},
    {NULL, 0},
};

int LuaOpenCGImage(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGImageAPIs);
    return 0;
}
