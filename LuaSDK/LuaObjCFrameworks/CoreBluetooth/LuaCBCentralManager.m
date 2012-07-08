//
//  LuaCBCentralManager.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCBCentralManager.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CBCentralManagerState(lua_State *L)
{
    CBCentralManagerState(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerStateUnknown(lua_State *L)
{
    CBCentralManagerStateUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerStateResetting(lua_State *L)
{
    CBCentralManagerStateResetting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerStateUnsupported(lua_State *L)
{
    CBCentralManagerStateUnsupported(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerStateUnauthorized(lua_State *L)
{
    CBCentralManagerStateUnauthorized(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerStatePoweredOff(lua_State *L)
{
    CBCentralManagerStatePoweredOff(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerStatePoweredOn(lua_State *L)
{
    CBCentralManagerStatePoweredOn(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerState(lua_State *L)
{
    CBCentralManagerState(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerScanOption(lua_State *L)
{
    CBCentralManagerScanOption(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerScanOptionAllowDuplicatesKey(lua_State *L)
{
    CBCentralManagerScanOptionAllowDuplicatesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerDelegate(lua_State *L)
{
    CBCentralManagerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerDelegate(lua_State *L)
{
    CBCentralManagerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerState(lua_State *L)
{
    CBCentralManagerState(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerDelegate(lua_State *L)
{
    CBCentralManagerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerState(lua_State *L)
{
    CBCentralManagerState(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerDelegate(lua_State *L)
{
    CBCentralManagerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerScanOptionAllowDuplicatesKey(lua_State *L)
{
    CBCentralManagerScanOptionAllowDuplicatesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerScanOptionAllowDuplicatesKey(lua_State *L)
{
    CBCentralManagerScanOptionAllowDuplicatesKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerDelegate(lua_State *L)
{
    CBCentralManagerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCentralManagerDelegate(lua_State *L)
{
    CBCentralManagerDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCBCentralManagerAPIs[] = {
    {"CBCentralManagerState", lua_CBCentralManagerState},
    {"CBCentralManagerStateUnknown", lua_CBCentralManagerStateUnknown},
    {"CBCentralManagerStateResetting", lua_CBCentralManagerStateResetting},
    {"CBCentralManagerStateUnsupported", lua_CBCentralManagerStateUnsupported},
    {"CBCentralManagerStateUnauthorized", lua_CBCentralManagerStateUnauthorized},
    {"CBCentralManagerStatePoweredOff", lua_CBCentralManagerStatePoweredOff},
    {"CBCentralManagerStatePoweredOn", lua_CBCentralManagerStatePoweredOn},
    {"CBCentralManagerState", lua_CBCentralManagerState},
    {"CBCentralManagerScanOption", lua_CBCentralManagerScanOption},
    {"CBCentralManagerScanOptionAllowDuplicatesKey", lua_CBCentralManagerScanOptionAllowDuplicatesKey},
    {"CBCentralManagerDelegate", lua_CBCentralManagerDelegate},
    {"CBCentralManagerDelegate", lua_CBCentralManagerDelegate},
    {"CBCentralManagerState", lua_CBCentralManagerState},
    {"CBCentralManagerDelegate", lua_CBCentralManagerDelegate},
    {"CBCentralManagerState", lua_CBCentralManagerState},
    {"CBCentralManagerDelegate", lua_CBCentralManagerDelegate},
    {"CBCentralManagerScanOptionAllowDuplicatesKey", lua_CBCentralManagerScanOptionAllowDuplicatesKey},
    {"CBCentralManagerScanOptionAllowDuplicatesKey", lua_CBCentralManagerScanOptionAllowDuplicatesKey},
    {"CBCentralManagerDelegate", lua_CBCentralManagerDelegate},
    {"CBCentralManagerDelegate", lua_CBCentralManagerDelegate},
    {NULL, NULL},
};

int LuaOpenCBCentralManager(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCBCentralManagerAPIs);
    return 0;
}
