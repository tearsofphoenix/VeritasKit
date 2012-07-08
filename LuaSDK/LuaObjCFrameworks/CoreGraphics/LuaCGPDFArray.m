//
//  LuaCGPDFArray.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGPDFArray.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CGPDFArrayGetCount(lua_State *L)
{
    lua_pushinteger(L, CGPDFArrayGetCount(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFArrayGetObject(lua_State *L)
{
    CGPDFObjectRef value;
    lua_pushboolean(L, CGPDFArrayGetObject(lua_touserdata(L, 1), lua_tointeger(L, 2), &value));
    lua_pushlightuserdata(L, value);
    
    return 2;
}

static int lua_CGPDFArrayGetNull(lua_State *L)
{
    lua_pushboolean(L, CGPDFArrayGetNull(lua_touserdata(L, 1), lua_tointeger(L, 2)));
    return 1;
}

static int lua_CGPDFArrayGetBoolean(lua_State *L)
{
    CGPDFBoolean value;
    lua_pushboolean(L, CGPDFArrayGetBoolean(lua_touserdata(L, 1), lua_tointeger(L, 2), &value));
    lua_pushinteger(L, value);
    return 2;
}

static int lua_CGPDFArrayGetInteger(lua_State *L)
{
    CGPDFInteger value;
    lua_pushboolean(L, CGPDFArrayGetInteger(lua_touserdata(L, 1), lua_tointeger(L, 2), &value));
    lua_pushinteger(L, value);
    return 2;
}

static int lua_CGPDFArrayGetNumber(lua_State *L)
{
    CGPDFReal value;
    lua_pushboolean(L, CGPDFArrayGetNumber(lua_touserdata(L, 1), lua_tointeger(L, 2), &value));
    lua_pushnumber(L, value);
    return 2;
}

static int lua_CGPDFArrayGetName(lua_State *L)
{
    const char* value;
    lua_pushboolean(L, CGPDFArrayGetName(lua_touserdata(L, 1), lua_tointeger(L, 2), &value));
    lua_pushstring(L, value);
    return 2;
}

static int lua_CGPDFArrayGetString(lua_State *L)
{
    CGPDFStringRef value;
    lua_pushboolean(L, CGPDFArrayGetString(lua_touserdata(L, 1), lua_tointeger(L, 2), &value));
    lua_pushlightuserdata(L, value);
    return 2;
}

static int lua_CGPDFArrayGetArray(lua_State *L)
{
    CGPDFArrayRef value;
    lua_pushboolean(L, CGPDFArrayGetArray(lua_touserdata(L, 1), lua_tointeger(L, 2), &value));
    lua_pushlightuserdata(L, value);
    return 2;
}

static int lua_CGPDFArrayGetDictionary(lua_State *L)
{
    CGPDFDictionaryRef value;
    lua_pushboolean(L, CGPDFArrayGetDictionary(lua_touserdata(L, 1), lua_tointeger(L, 2), &value));
    lua_pushlightuserdata(L, value);
    return 2;
}

static int lua_CGPDFArrayGetStream(lua_State *L)
{
    CGPDFStreamRef value;
    lua_pushboolean(L, CGPDFArrayGetStream(lua_touserdata(L, 1), lua_tointeger(L, 2), &value));
    lua_pushlightuserdata(L, value);
    return 2;
}

static const luaL_Reg __LuaCGPDFArrayAPIs[] = {
    {"CGPDFArrayGetCount", lua_CGPDFArrayGetCount},
    {"CGPDFArrayGetObject", lua_CGPDFArrayGetObject},
    {"CGPDFArrayGetNull", lua_CGPDFArrayGetNull},
    {"CGPDFArrayGetBoolean", lua_CGPDFArrayGetBoolean},
    {"CGPDFArrayGetInteger", lua_CGPDFArrayGetInteger},
    {"CGPDFArrayGetNumber", lua_CGPDFArrayGetNumber},
    {"CGPDFArrayGetName", lua_CGPDFArrayGetName},
    {"CGPDFArrayGetString", lua_CGPDFArrayGetString},
    {"CGPDFArrayGetArray", lua_CGPDFArrayGetArray},
    {"CGPDFArrayGetDictionary", lua_CGPDFArrayGetDictionary},
    {"CGPDFArrayGetStream", lua_CGPDFArrayGetStream},
    {NULL, NULL},
};

int LuaOpenCGPDFArray(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGPDFArrayAPIs);
    return 0;
}
