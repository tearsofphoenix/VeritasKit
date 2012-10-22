//
//  LuaUIGraphics.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIGraphics.h"
#import "LuaObjCAuxiliary.h"
#import "LuaCGGeometry.h"

static int lua_UIGraphicsBeginImageContext(lua_State *L)
{
    CGSize *size = lua_touserdata(L, 2);
    UIGraphicsBeginImageContext(*size);
    return 0;
}

static int lua_UIGraphicsBeginImageContextWithOptions(lua_State *L)
{
    CGSize *size = lua_touserdata(L, 1);
    BOOL opaque = lua_toboolean(L, 2);
    CGFloat scale = lua_tonumber(L, 3);
    
    UIGraphicsBeginImageContextWithOptions(*size, opaque, scale);
    return 0;
}

static int lua_UIGraphicsBeginPDFContextToFile(lua_State *L)
{
    NSString *path = lua_touserdata(L, 1);
    CGRect *bounds = lua_touserdata(L, 2);
    NSDictionary *documentInfo = lua_touserdata(L, 3);
    lua_pushboolean(L, UIGraphicsBeginPDFContextToFile(path, *bounds, documentInfo));
    return 1;
}

static int lua_UIGraphicsBeginPDFContextToData(lua_State *L)
{
    NSMutableData *data = lua_touserdata(L, 1);
    CGRect *bounds = lua_touserdata(L, 2);
    NSDictionary *documentInfo = lua_touserdata(L, 3);
    UIGraphicsBeginPDFContextToData(data, *bounds, documentInfo);
    return 0;
}

static int lua_UIGraphicsBeginPDFPageWithInfo(lua_State *L)
{
    CGRect *bounds = lua_touserdata(L, 1);
    NSDictionary *pageInfo = lua_touserdata(L, 2);
    UIGraphicsBeginPDFPageWithInfo(*bounds, pageInfo);
    return 0;
}

static int lua_UIGraphicsGetPDFContextBounds(lua_State *L)
{
    LuaObjCPushCGRect(L, UIGraphicsGetPDFContextBounds());
    return 1;
}

static int lua_UIGraphicsSetPDFContextURLForRect(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 2);
    UIGraphicsSetPDFContextURLForRect(lua_touserdata(L, 1), *rect);
    return 0;
}

static int lua_UIGraphicsAddPDFContextDestinationAtPoint(lua_State *L)
{
    CGPoint *point = lua_touserdata(L, 2);
    UIGraphicsAddPDFContextDestinationAtPoint(lua_touserdata(L, 1), *point);
    return 0;
}

static int lua_UIGraphicsSetPDFContextDestinationForRect(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 2);
    UIGraphicsSetPDFContextDestinationForRect(lua_touserdata(L, 1), *rect);
    return 0;
}


static int lua_UIRectFillUsingBlendMode(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    UIRectFillUsingBlendMode(*rect, lua_tointeger(L, 2));
    return 0;
}

static int lua_UIRectFill(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    UIRectFill(*rect);
    return 0;
}

static int lua_UIRectFrameUsingBlendMode(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    UIRectFrameUsingBlendMode(*rect, lua_tointeger(L, 2));
    return 0;
}

static int lua_UIRectFrame(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    UIRectFrame(*rect);
    return 0;
}

static int lua_UIRectClip(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 1);
    UIRectClip(*rect);
    return 0;
}

static const luaL_Reg __LuaUIGraphicsAPIs[] = 
{
    {"UIRectFillUsingBlendMode", lua_UIRectFillUsingBlendMode},
    {"UIRectFill", lua_UIRectFill},
    {"UIRectFrameUsingBlendMode", lua_UIRectFrameUsingBlendMode},
    {"UIRectFrame", lua_UIRectFrame},
    {"UIRectClip", lua_UIRectClip},
    {"UIGraphicsBeginImageContext", lua_UIGraphicsBeginImageContext},
    {"UIGraphicsBeginImageContextWithOptions", lua_UIGraphicsBeginImageContextWithOptions},
    {"UIGraphicsBeginPDFContextToFile", lua_UIGraphicsBeginPDFContextToFile},
    {"UIGraphicsBeginPDFContextToData", lua_UIGraphicsBeginPDFContextToData},
    {"UIGraphicsBeginPDFPageWithInfo", lua_UIGraphicsBeginPDFPageWithInfo},
    {"UIGraphicsGetPDFContextBounds", lua_UIGraphicsGetPDFContextBounds},
    {"UIGraphicsSetPDFContextURLForRect", lua_UIGraphicsSetPDFContextURLForRect},
    {"UIGraphicsAddPDFContextDestinationAtPoint", lua_UIGraphicsAddPDFContextDestinationAtPoint},
    {"UIGraphicsSetPDFContextDestinationForRect", lua_UIGraphicsSetPDFContextDestinationForRect},
    {NULL, NULL},
};

int LuaObjCOpenUIGraphics(lua_State *L)
{
    LuaObjCLoadGlobalFunctions(L, __LuaUIGraphicsAPIs);
    return 0;
}
