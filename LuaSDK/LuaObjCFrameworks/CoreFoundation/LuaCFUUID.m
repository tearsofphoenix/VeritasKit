//
//  LuaCFUUID.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFUUID.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFUUID__(lua_State *L)
{
    CFUUID__(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUID__(lua_State *L)
{
    CFUUID__(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDRef(lua_State *L)
{
    CFUUIDRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDBytes(lua_State *L)
{
    CFUUIDBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDBytes(lua_State *L)
{
    CFUUIDBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDRef(lua_State *L)
{
    CFUUIDRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDGetUUIDBytes(lua_State *L)
{
    CFUUIDGetUUIDBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDGetTypeID(lua_State *L)
{
    CFUUIDGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDRef(lua_State *L)
{
    CFUUIDRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDRef(lua_State *L)
{
    CFUUIDRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDRef(lua_State *L)
{
    CFUUIDRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDCreateString(lua_State *L)
{
    CFUUIDCreateString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDRef(lua_State *L)
{
    CFUUIDRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDRef(lua_State *L)
{
    CFUUIDRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDBytes(lua_State *L)
{
    CFUUIDBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUIDRef(lua_State *L)
{
    CFUUIDRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFUUID__(lua_State *L)
{
    CFUUID__(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFUUIDAPIs[] = {
    {"CFUUID__", lua_CFUUID__},
    {"CFUUID__", lua_CFUUID__},
    {"CFUUIDRef", lua_CFUUIDRef},
    {"CFUUIDBytes", lua_CFUUIDBytes},
    {"CFUUIDBytes", lua_CFUUIDBytes},
    {"CFUUIDRef", lua_CFUUIDRef},
    {"CFUUIDGetUUIDBytes", lua_CFUUIDGetUUIDBytes},
    {"CFUUIDGetTypeID", lua_CFUUIDGetTypeID},
    {"CFUUIDRef", lua_CFUUIDRef},
    {"CFUUIDRef", lua_CFUUIDRef},
    {"CFUUIDRef", lua_CFUUIDRef},
    {"CFUUIDCreateString", lua_CFUUIDCreateString},
    {"CFUUIDRef", lua_CFUUIDRef},
    {"CFUUIDRef", lua_CFUUIDRef},
    {"CFUUIDBytes", lua_CFUUIDBytes},
    {"CFUUIDRef", lua_CFUUIDRef},
    {"CFUUID__", lua_CFUUID__},
    {NULL, NULL},
};

int LuaOpenCFUUID(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFUUIDAPIs);
    return 0;
}
