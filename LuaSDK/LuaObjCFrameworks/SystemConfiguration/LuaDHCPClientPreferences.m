//
//  LuaDHCPClientPreferences.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaDHCPClientPreferences.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_DHCPClientPreferencesSetApplicationOptions(lua_State *L)
{
    DHCPClientPreferencesSetApplicationOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_DHCPClientPreferencesSetApplicationOptions(lua_State *L)
{
    DHCPClientPreferencesSetApplicationOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_DHCPClientPreferencesCopyApplicationOptions(lua_State *L)
{
    DHCPClientPreferencesCopyApplicationOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_DHCPClientPreferencesCopyApplicationOptions(lua_State *L)
{
    DHCPClientPreferencesCopyApplicationOptions(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaDHCPClientPreferencesAPIs[] = {
    {"DHCPClientPreferencesSetApplicationOptions", lua_DHCPClientPreferencesSetApplicationOptions},
    {"DHCPClientPreferencesSetApplicationOptions", lua_DHCPClientPreferencesSetApplicationOptions},
    {"DHCPClientPreferencesCopyApplicationOptions", lua_DHCPClientPreferencesCopyApplicationOptions},
    {"DHCPClientPreferencesCopyApplicationOptions", lua_DHCPClientPreferencesCopyApplicationOptions},
    {NULL, NULL},
};

int LuaOpenDHCPClientPreferences(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaDHCPClientPreferencesAPIs);
    return 0;
}
