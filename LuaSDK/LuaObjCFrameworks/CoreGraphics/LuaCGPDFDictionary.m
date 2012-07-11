//
//  LuaCGPDFDictionary.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGPDFDictionary.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CGPDFDictionaryGetCount(lua_State *L)
{
    lua_pushinteger(L, CGPDFDictionaryGetCount(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGPDFDictionaryGetObject(lua_State *L)
{
    CGPDFObjectRef value;
    CGPDFDictionaryGetObject(lua_touserdata(L, 1), lua_tostring(L, 2), &value);    
    lua_pushlightuserdata(L, value);
    return 1;
}

static int lua_CGPDFDictionaryGetBoolean(lua_State *L)
{
    CGPDFBoolean value;
    CGPDFDictionaryGetBoolean(lua_touserdata(L, 1), lua_tostring(L, 2), &value);
    lua_pushinteger(L, value);
    return 1;
}

static int lua_CGPDFDictionaryGetInteger(lua_State *L)
{
    CGPDFInteger value;
    CGPDFDictionaryGetInteger(lua_touserdata(L, 1), lua_tostring(L, 2), &value);

    lua_pushinteger(L, value);
    return 1;
}

static int lua_CGPDFDictionaryGetNumber(lua_State *L)
{
    CGPDFReal value;
    CGPDFDictionaryGetNumber(lua_touserdata(L, 1), lua_tostring(L, 2), &value);

    lua_pushnumber(L, value);
    return 1;
}

static int lua_CGPDFDictionaryGetName(lua_State *L)
{
    const char* value;
    CGPDFDictionaryGetName(lua_touserdata(L, 1), lua_tostring(L, 2), &value);
    lua_pushstring(L, value);
    return 1;
}

static int lua_CGPDFDictionaryGetString(lua_State *L)
{
    CGPDFStringRef value;
    CGPDFDictionaryGetString(lua_touserdata(L, 1), lua_tostring(L, 2), &value);
    lua_pushlightuserdata(L, value);
    return 1;
}

static int lua_CGPDFDictionaryGetArray(lua_State *L)
{
    CGPDFArrayRef value;
    CGPDFDictionaryGetArray(lua_touserdata(L, 1), lua_tostring(L, 2), &value);
    lua_pushlightuserdata(L, value);
    return 1;
}

static int lua_CGPDFDictionaryGetDictionary(lua_State *L)
{
    CGPDFDictionaryRef value;
    CGPDFDictionaryGetDictionary(lua_touserdata(L, 1), lua_tostring(L, 2), &value);
    lua_pushlightuserdata(L, value);
    return 1;
}

static int lua_CGPDFDictionaryGetStream(lua_State *L)
{
    CGPDFStreamRef value;
    CGPDFDictionaryGetStream(lua_touserdata(L, 1), lua_tostring(L, 2), &value);
    lua_pushlightuserdata(L, value);
    return 1;
}

static int lua_CGPDFDictionaryApplyFunction(lua_State *L)
{
    CGPDFDictionaryApplyFunction(lua_touserdata(L, 1), lua_touserdata(L, 2), lua_touserdata(L, 3));
    return 0;
}

static const luaL_Reg __LuaCGPDFDictionaryAPIs[] = {
    {"CGPDFDictionaryGetCount", lua_CGPDFDictionaryGetCount},
    {"CGPDFDictionaryGetObject", lua_CGPDFDictionaryGetObject},
    {"CGPDFDictionaryGetBoolean", lua_CGPDFDictionaryGetBoolean},
    {"CGPDFDictionaryGetInteger", lua_CGPDFDictionaryGetInteger},
    {"CGPDFDictionaryGetNumber", lua_CGPDFDictionaryGetNumber},
    {"CGPDFDictionaryGetName", lua_CGPDFDictionaryGetName},
    {"CGPDFDictionaryGetString", lua_CGPDFDictionaryGetString},
    {"CGPDFDictionaryGetArray", lua_CGPDFDictionaryGetArray},
    {"CGPDFDictionaryGetDictionary", lua_CGPDFDictionaryGetDictionary},
    {"CGPDFDictionaryGetStream", lua_CGPDFDictionaryGetStream},
    {"CGPDFDictionaryApplyFunction", lua_CGPDFDictionaryApplyFunction},
    {NULL, NULL},
};

int LuaOpenCGPDFDictionary(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGPDFDictionaryAPIs);
    return 0;
}
