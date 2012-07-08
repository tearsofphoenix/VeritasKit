//
//  LuaEKRecurrenceRule.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaEKRecurrenceRule.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_EKRecurrenceRules(lua_State *L)
{
    EKRecurrenceRules(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKRecurrenceRules(lua_State *L)
{
    EKRecurrenceRules(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKRecurrenceRules(lua_State *L)
{
    EKRecurrenceRules(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKRecurrenceRules(lua_State *L)
{
    EKRecurrenceRules(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKRecurrenceRules(lua_State *L)
{
    EKRecurrenceRules(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKRecurrenceRules(lua_State *L)
{
    EKRecurrenceRules(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKRecurrenceRules(lua_State *L)
{
    EKRecurrenceRules(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKRecurrenceRules(lua_State *L)
{
    EKRecurrenceRules(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaEKRecurrenceRuleAPIs[] = {
    {"EKRecurrenceRules", lua_EKRecurrenceRules},
    {"EKRecurrenceRules", lua_EKRecurrenceRules},
    {"EKRecurrenceRules", lua_EKRecurrenceRules},
    {"EKRecurrenceRules", lua_EKRecurrenceRules},
    {"EKRecurrenceRules", lua_EKRecurrenceRules},
    {"EKRecurrenceRules", lua_EKRecurrenceRules},
    {"EKRecurrenceRules", lua_EKRecurrenceRules},
    {"EKRecurrenceRules", lua_EKRecurrenceRules},
    {NULL, NULL},
};

int LuaOpenEKRecurrenceRule(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaEKRecurrenceRuleAPIs);
    return 0;
}
