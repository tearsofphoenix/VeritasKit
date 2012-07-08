//
//  LuaCGPDFPage.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGPDFPage.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"
#import "LuaCGAffineTransform.h"
#import "LuaCGGeometry.h"

static const LuaSDKConst __luaCGContextConstants[] = 
{
    {"kCGPDFMediaBox", kCGPDFMediaBox},
    {"kCGPDFCropBox", kCGPDFCropBox},
    {"kCGPDFBleedBox", kCGPDFBleedBox},
    {"kCGPDFTrimBox", kCGPDFTrimBox},
    {"kCGPDFArtBox", kCGPDFArtBox},
    {NULL, 0},
};


static int lua_CGPDFPageRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFPageRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFPageRelease(lua_State *L)
{
    CGPDFPageRelease(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGPDFPageGetDocument(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFPageGetDocument(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFPageGetPageNumber(lua_State *L)
{
    lua_pushinteger(L, CGPDFPageGetPageNumber(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFPageGetBoxRect(lua_State *L)
{
    lua_pushCGRect(L, CGPDFPageGetBoxRect(lua_touserdata(L, 1), lua_tointeger(L, 2)));
    return 1;
}

static int lua_CGPDFPageGetRotationAngle(lua_State *L)
{
    lua_pushinteger(L, CGPDFPageGetRotationAngle(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFPageGetDrawingTransform(lua_State *L)
{
    CGPDFBox box = lua_tointeger(L, 2);
    CGRect *rect = lua_touserdata(L, 3);
    int rotate = lua_tointeger(L, 4);
    bool preserveAspectRatio = lua_toboolean(L, 5);
    lua_pushCGAffineTransform(L, CGPDFPageGetDrawingTransform(lua_touserdata(L, 1), box, *rect, rotate, preserveAspectRatio));
    return 1;
}

static int lua_CGPDFPageGetDictionary(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFPageGetDictionary(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFPageGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGPDFPageGetTypeID());
    return 1;
}

static const luaL_Reg __LuaCGPDFPageAPIs[] = {
    {"CGPDFPageRetain", lua_CGPDFPageRetain},
    {"CGPDFPageRelease", lua_CGPDFPageRelease},
    {"CGPDFPageGetDocument", lua_CGPDFPageGetDocument},
    {"CGPDFPageGetPageNumber", lua_CGPDFPageGetPageNumber},
    {"CGPDFPageGetBoxRect", lua_CGPDFPageGetBoxRect},
    {"CGPDFPageGetRotationAngle", lua_CGPDFPageGetRotationAngle},
    {"CGPDFPageGetDrawingTransform", lua_CGPDFPageGetDrawingTransform},
    {"CGPDFPageGetDictionary", lua_CGPDFPageGetDictionary},
    {"CGPDFPageGetTypeID", lua_CGPDFPageGetTypeID},
    {NULL, NULL},
};

int LuaOpenCGPDFPage(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGPDFPageAPIs);
    return 0;
}
