//
//  LuaCTTextTab.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTTextTab.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTTextTabRef(lua_State *L)
{
    CTTextTabRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTextTabGetTypeID(lua_State *L)
{
    CTTextTabGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTextTabCreate(lua_State *L)
{
    CTTextTabCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTextTabRef(lua_State *L)
{
    CTTextTabRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTextTabGetAlignment(lua_State *L)
{
    CTTextTabGetAlignment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTextTabGetAlignment(lua_State *L)
{
    CTTextTabGetAlignment(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTextTabRef(lua_State *L)
{
    CTTextTabRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTextTabGetLocation(lua_State *L)
{
    CTTextTabGetLocation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTextTabGetLocation(lua_State *L)
{
    CTTextTabGetLocation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTextTabRef(lua_State *L)
{
    CTTextTabRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTextTabGetOptions(lua_State *L)
{
    CTTextTabGetOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTextTabGetOptions(lua_State *L)
{
    CTTextTabGetOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTextTabRef(lua_State *L)
{
    CTTextTabRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTTextTabAPIs[] = {
    {"CTTextTabRef", lua_CTTextTabRef},
    {"CTTextTabGetTypeID", lua_CTTextTabGetTypeID},
    {"CTTextTabCreate", lua_CTTextTabCreate},
    {"CTTextTabRef", lua_CTTextTabRef},
    {"CTTextTabGetAlignment", lua_CTTextTabGetAlignment},
    {"CTTextTabGetAlignment", lua_CTTextTabGetAlignment},
    {"CTTextTabRef", lua_CTTextTabRef},
    {"CTTextTabGetLocation", lua_CTTextTabGetLocation},
    {"CTTextTabGetLocation", lua_CTTextTabGetLocation},
    {"CTTextTabRef", lua_CTTextTabRef},
    {"CTTextTabGetOptions", lua_CTTextTabGetOptions},
    {"CTTextTabGetOptions", lua_CTTextTabGetOptions},
    {"CTTextTabRef", lua_CTTextTabRef},
    {NULL, NULL},
};

int LuaOpenCTTextTab(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTTextTabAPIs);
    return 0;
}
