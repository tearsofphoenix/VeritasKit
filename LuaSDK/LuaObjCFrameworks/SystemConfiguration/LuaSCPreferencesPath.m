//
//  LuaSCPreferencesPath.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSCPreferencesPath.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SCPreferencesPathGetValue(lua_State *L)
{
    SCPreferencesPathGetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesPathCreateUniqueChild(lua_State *L)
{
    SCPreferencesPathCreateUniqueChild(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesPathCreateUniqueChild(lua_State *L)
{
    SCPreferencesPathCreateUniqueChild(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesPathGetValue(lua_State *L)
{
    SCPreferencesPathGetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesPathGetValue(lua_State *L)
{
    SCPreferencesPathGetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesPathGetLink(lua_State *L)
{
    SCPreferencesPathGetLink(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesPathGetLink(lua_State *L)
{
    SCPreferencesPathGetLink(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesPathSetValue(lua_State *L)
{
    SCPreferencesPathSetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesPathSetValue(lua_State *L)
{
    SCPreferencesPathSetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesPathSetLink(lua_State *L)
{
    SCPreferencesPathSetLink(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesPathSetLink(lua_State *L)
{
    SCPreferencesPathSetLink(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesPathRemoveValue(lua_State *L)
{
    SCPreferencesPathRemoveValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesPathRemoveValue(lua_State *L)
{
    SCPreferencesPathRemoveValue(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSCPreferencesPathAPIs[] = {
    {"SCPreferencesPathGetValue", lua_SCPreferencesPathGetValue},
    {"SCPreferencesPathCreateUniqueChild", lua_SCPreferencesPathCreateUniqueChild},
    {"SCPreferencesPathCreateUniqueChild", lua_SCPreferencesPathCreateUniqueChild},
    {"SCPreferencesPathGetValue", lua_SCPreferencesPathGetValue},
    {"SCPreferencesPathGetValue", lua_SCPreferencesPathGetValue},
    {"SCPreferencesPathGetLink", lua_SCPreferencesPathGetLink},
    {"SCPreferencesPathGetLink", lua_SCPreferencesPathGetLink},
    {"SCPreferencesPathSetValue", lua_SCPreferencesPathSetValue},
    {"SCPreferencesPathSetValue", lua_SCPreferencesPathSetValue},
    {"SCPreferencesPathSetLink", lua_SCPreferencesPathSetLink},
    {"SCPreferencesPathSetLink", lua_SCPreferencesPathSetLink},
    {"SCPreferencesPathRemoveValue", lua_SCPreferencesPathRemoveValue},
    {"SCPreferencesPathRemoveValue", lua_SCPreferencesPathRemoveValue},
    {NULL, NULL},
};

int LuaOpenSCPreferencesPath(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSCPreferencesPathAPIs);
    return 0;
}
