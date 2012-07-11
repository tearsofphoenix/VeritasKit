//
//  LuaCGPDFDocument.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGPDFDocument.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CGPDFDocumentCreateWithProvider(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFDocumentCreateWithProvider(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFDocumentCreateWithURL(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFDocumentCreateWithURL(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFDocumentRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFDocumentRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFDocumentRelease(lua_State *L)
{
    CGPDFDocumentRelease(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGPDFDocumentGetVersion(lua_State *L)
{
    int majorVersion = 0;
    int minorVersion = 0;
    CGPDFDocumentGetVersion(lua_touserdata(L, 1), &majorVersion, &minorVersion);
    lua_pushinteger(L, majorVersion);
    lua_pushinteger(L, minorVersion);
    return 2;
}

static int lua_CGPDFDocumentIsEncrypted(lua_State *L)
{
    lua_pushboolean(L, CGPDFDocumentIsEncrypted(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFDocumentUnlockWithPassword(lua_State *L)
{
    lua_pushboolean(L, CGPDFDocumentUnlockWithPassword(lua_touserdata(L, 1), lua_tostring(L, 2)));
    return 1;
}

static int lua_CGPDFDocumentIsUnlocked(lua_State *L)
{
    lua_pushboolean(L, CGPDFDocumentIsUnlocked(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFDocumentAllowsPrinting(lua_State *L)
{
    lua_pushboolean(L, CGPDFDocumentAllowsPrinting(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFDocumentAllowsCopying(lua_State *L)
{
    lua_pushboolean(L, CGPDFDocumentAllowsCopying(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFDocumentGetNumberOfPages(lua_State *L)
{
    lua_pushinteger(L, CGPDFDocumentGetNumberOfPages(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFDocumentGetPage(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFDocumentGetPage(lua_touserdata(L, 1), lua_tointeger(L, 2)));
    return 1;
}

static int lua_CGPDFDocumentGetCatalog(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFDocumentGetCatalog(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFDocumentGetInfo(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFDocumentGetInfo(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFDocumentGetID(lua_State *L)
{
    lua_pushlightuserdata(L, CGPDFDocumentGetID(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFDocumentGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGPDFDocumentGetTypeID());
    return 1;
}

static const luaL_Reg __LuaCGPDFDocumentAPIs[] = {
    {"CGPDFDocumentCreateWithProvider", lua_CGPDFDocumentCreateWithProvider},
    {"CGPDFDocumentCreateWithURL", lua_CGPDFDocumentCreateWithURL},
    {"CGPDFDocumentRetain", lua_CGPDFDocumentRetain},
    {"CGPDFDocumentRelease", lua_CGPDFDocumentRelease},
    {"CGPDFDocumentGetVersion", lua_CGPDFDocumentGetVersion},
    {"CGPDFDocumentIsEncrypted", lua_CGPDFDocumentIsEncrypted},
    {"CGPDFDocumentUnlockWithPassword", lua_CGPDFDocumentUnlockWithPassword},
    {"CGPDFDocumentIsUnlocked", lua_CGPDFDocumentIsUnlocked},
    {"CGPDFDocumentAllowsPrinting", lua_CGPDFDocumentAllowsPrinting},
    {"CGPDFDocumentAllowsCopying", lua_CGPDFDocumentAllowsCopying},
    {"CGPDFDocumentGetNumberOfPages", lua_CGPDFDocumentGetNumberOfPages},
    {"CGPDFDocumentGetPage", lua_CGPDFDocumentGetPage},
    {"CGPDFDocumentGetCatalog", lua_CGPDFDocumentGetCatalog},
    {"CGPDFDocumentGetInfo", lua_CGPDFDocumentGetInfo},
    {"CGPDFDocumentGetID", lua_CGPDFDocumentGetID},
    {"CGPDFDocumentGetTypeID", lua_CGPDFDocumentGetTypeID},
    {NULL, NULL},
};

int LuaOpenCGPDFDocument(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGPDFDocumentAPIs);
    return 0;
}
