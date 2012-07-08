//
//  LuaCFPreferences.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFPreferences.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFPreferencesAnyApplication(lua_State *L)
{
    CFPreferencesAnyApplication(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesCurrentApplication(lua_State *L)
{
    CFPreferencesCurrentApplication(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesAnyHost(lua_State *L)
{
    CFPreferencesAnyHost(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesCurrentHost(lua_State *L)
{
    CFPreferencesCurrentHost(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesAnyUser(lua_State *L)
{
    CFPreferencesAnyUser(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesCurrentUser(lua_State *L)
{
    CFPreferencesCurrentUser(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesAnyApplication(lua_State *L)
{
    CFPreferencesAnyApplication(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesCopyAppValue(lua_State *L)
{
    CFPreferencesCopyAppValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesGetAppBooleanValue(lua_State *L)
{
    CFPreferencesGetAppBooleanValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesGetAppIntegerValue(lua_State *L)
{
    CFPreferencesGetAppIntegerValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesSetAppValue(lua_State *L)
{
    CFPreferencesSetAppValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesSetValue(lua_State *L)
{
    CFPreferencesSetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesAddSuitePreferencesToApp(lua_State *L)
{
    CFPreferencesAddSuitePreferencesToApp(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesRemoveSuitePreferencesFromApp(lua_State *L)
{
    CFPreferencesRemoveSuitePreferencesFromApp(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesAppSynchronize(lua_State *L)
{
    CFPreferencesAppSynchronize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesCopyValue(lua_State *L)
{
    CFPreferencesCopyValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesCopyMultiple(lua_State *L)
{
    CFPreferencesCopyMultiple(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesSetValue(lua_State *L)
{
    CFPreferencesSetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesSetMultiple(lua_State *L)
{
    CFPreferencesSetMultiple(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesSynchronize(lua_State *L)
{
    CFPreferencesSynchronize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesCopyApplicationList(lua_State *L)
{
    CFPreferencesCopyApplicationList(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesCopyKeyList(lua_State *L)
{
    CFPreferencesCopyKeyList(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFPreferencesAppValueIsForced(lua_State *L)
{
    CFPreferencesAppValueIsForced(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFPreferencesAPIs[] = {
    {"CFPreferencesAnyApplication", lua_CFPreferencesAnyApplication},
    {"CFPreferencesCurrentApplication", lua_CFPreferencesCurrentApplication},
    {"CFPreferencesAnyHost", lua_CFPreferencesAnyHost},
    {"CFPreferencesCurrentHost", lua_CFPreferencesCurrentHost},
    {"CFPreferencesAnyUser", lua_CFPreferencesAnyUser},
    {"CFPreferencesCurrentUser", lua_CFPreferencesCurrentUser},
    {"CFPreferencesAnyApplication", lua_CFPreferencesAnyApplication},
    {"CFPreferencesCopyAppValue", lua_CFPreferencesCopyAppValue},
    {"CFPreferencesGetAppBooleanValue", lua_CFPreferencesGetAppBooleanValue},
    {"CFPreferencesGetAppIntegerValue", lua_CFPreferencesGetAppIntegerValue},
    {"CFPreferencesSetAppValue", lua_CFPreferencesSetAppValue},
    {"CFPreferencesSetValue", lua_CFPreferencesSetValue},
    {"CFPreferencesAddSuitePreferencesToApp", lua_CFPreferencesAddSuitePreferencesToApp},
    {"CFPreferencesRemoveSuitePreferencesFromApp", lua_CFPreferencesRemoveSuitePreferencesFromApp},
    {"CFPreferencesAppSynchronize", lua_CFPreferencesAppSynchronize},
    {"CFPreferencesCopyValue", lua_CFPreferencesCopyValue},
    {"CFPreferencesCopyMultiple", lua_CFPreferencesCopyMultiple},
    {"CFPreferencesSetValue", lua_CFPreferencesSetValue},
    {"CFPreferencesSetMultiple", lua_CFPreferencesSetMultiple},
    {"CFPreferencesSynchronize", lua_CFPreferencesSynchronize},
    {"CFPreferencesCopyApplicationList", lua_CFPreferencesCopyApplicationList},
    {"CFPreferencesCopyKeyList", lua_CFPreferencesCopyKeyList},
    {"CFPreferencesAppValueIsForced", lua_CFPreferencesAppValueIsForced},
    {NULL, NULL},
};

int LuaOpenCFPreferences(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFPreferencesAPIs);
    return 0;
}
