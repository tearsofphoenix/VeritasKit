//
//  LuaMPVolumeSettings.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMPVolumeSettings.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MPVolumeSettingsAlertShow(lua_State *L)
{
    MPVolumeSettingsAlertShow(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPVolumeSettingsAlertHide(lua_State *L)
{
    MPVolumeSettingsAlertHide(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPVolumeSettingsAlertIsVisible(lua_State *L)
{
    MPVolumeSettingsAlertIsVisible(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMPVolumeSettingsAPIs[] = {
    {"MPVolumeSettingsAlertShow", lua_MPVolumeSettingsAlertShow},
    {"MPVolumeSettingsAlertHide", lua_MPVolumeSettingsAlertHide},
    {"MPVolumeSettingsAlertIsVisible", lua_MPVolumeSettingsAlertIsVisible},
    {NULL, NULL},
};

int LuaOpenMPVolumeSettings(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMPVolumeSettingsAPIs);
    return 0;
}
