//
//  LuaCGPDFScanner.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGPDFScanner.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CGPDFScannerCreate(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFScannerCreate(lua_touserdata(L, 1), lua_touserdata(L, 2), lua_touserdata(L, 3)));
    return 1;
}

static int lua_CGPDFScannerRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFScannerRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFScannerRelease(lua_State *L)
{
    CGPDFScannerRelease(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGPDFScannerScan(lua_State *L)
{
    lua_pushboolean(L, CGPDFScannerScan(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFScannerGetContentStream(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFScannerGetContentStream(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFScannerPopObject(lua_State *L)
{
    lua_pushboolean(L, CGPDFScannerPopObject(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGPDFScannerPopBoolean(lua_State *L)
{
    lua_pushboolean(L, CGPDFScannerPopBoolean(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGPDFScannerPopInteger(lua_State *L)
{
    lua_pushboolean(L, CGPDFScannerPopInteger(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGPDFScannerPopNumber(lua_State *L)
{
    lua_pushboolean(L, CGPDFScannerPopNumber(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGPDFScannerPopName(lua_State *L)
{
    lua_pushboolean(L, CGPDFScannerPopName(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGPDFScannerPopString(lua_State *L)
{
    lua_pushboolean(L, CGPDFScannerPopString(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGPDFScannerPopArray(lua_State *L)
{
    lua_pushboolean(L, CGPDFScannerPopArray(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGPDFScannerPopDictionary(lua_State *L)
{
    lua_pushboolean(L, CGPDFScannerPopDictionary(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGPDFScannerPopStream(lua_State *L)
{
    lua_pushboolean(L, CGPDFScannerPopStream(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static const luaL_Reg __LuaCGPDFScannerAPIs[] = {
    {"CGPDFScannerCreate", lua_CGPDFScannerCreate},
    {"CGPDFScannerRetain", lua_CGPDFScannerRetain},
    {"CGPDFScannerRelease", lua_CGPDFScannerRelease},
    {"CGPDFScannerScan", lua_CGPDFScannerScan},
    {"CGPDFScannerGetContentStream", lua_CGPDFScannerGetContentStream},
    {"CGPDFScannerPopObject", lua_CGPDFScannerPopObject},
    {"CGPDFScannerPopBoolean", lua_CGPDFScannerPopBoolean},
    {"CGPDFScannerPopInteger", lua_CGPDFScannerPopInteger},
    {"CGPDFScannerPopNumber", lua_CGPDFScannerPopNumber},
    {"CGPDFScannerPopName", lua_CGPDFScannerPopName},
    {"CGPDFScannerPopString", lua_CGPDFScannerPopString},
    {"CGPDFScannerPopArray", lua_CGPDFScannerPopArray},
    {"CGPDFScannerPopDictionary", lua_CGPDFScannerPopDictionary},
    {"CGPDFScannerPopStream", lua_CGPDFScannerPopStream},
    {NULL, NULL},
};

int LuaOpenCGPDFScanner(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGPDFScannerAPIs);
    return 0;
}
