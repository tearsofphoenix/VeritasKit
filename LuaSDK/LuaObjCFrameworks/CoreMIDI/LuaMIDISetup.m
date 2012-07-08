//
//  LuaMIDISetup.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMIDISetup.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MIDISetup_h__(lua_State *L)
{
    MIDISetup_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetup_h__(lua_State *L)
{
    MIDISetup_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupRef(lua_State *L)
{
    MIDISetupRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupRef(lua_State *L)
{
    MIDISetupRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupRef(lua_State *L)
{
    MIDISetupRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupRef(lua_State *L)
{
    MIDISetupRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupCreate(lua_State *L)
{
    MIDISetupCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupInstall(lua_State *L)
{
    MIDISetupInstall(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupCreate(lua_State *L)
{
    MIDISetupCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupDispose(lua_State *L)
{
    MIDISetupDispose(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupDispose(lua_State *L)
{
    MIDISetupDispose(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupInstall(lua_State *L)
{
    MIDISetupInstall(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupCreate(lua_State *L)
{
    MIDISetupCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupInstall(lua_State *L)
{
    MIDISetupInstall(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupGetCurrent(lua_State *L)
{
    MIDISetupGetCurrent(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupGetCurrent(lua_State *L)
{
    MIDISetupGetCurrent(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupToData(lua_State *L)
{
    MIDISetupToData(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupToData(lua_State *L)
{
    MIDISetupToData(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupFromData(lua_State *L)
{
    MIDISetupFromData(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupInstall(lua_State *L)
{
    MIDISetupInstall(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupFromData(lua_State *L)
{
    MIDISetupFromData(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupRef(lua_State *L)
{
    MIDISetupRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupAddDevice(lua_State *L)
{
    MIDISetupAddDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupRemoveDevice(lua_State *L)
{
    MIDISetupRemoveDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupAddDevice(lua_State *L)
{
    MIDISetupAddDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupRemoveDevice(lua_State *L)
{
    MIDISetupRemoveDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupRemoveDevice(lua_State *L)
{
    MIDISetupRemoveDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupAddExternalDevice(lua_State *L)
{
    MIDISetupAddExternalDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupAddExternalDevice(lua_State *L)
{
    MIDISetupAddExternalDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupRemoveExternalDevice(lua_State *L)
{
    MIDISetupRemoveExternalDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupRemoveExternalDevice(lua_State *L)
{
    MIDISetupRemoveExternalDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupRef(lua_State *L)
{
    MIDISetupRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetupAddExternalDevice(lua_State *L)
{
    MIDISetupAddExternalDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDISetup_h__(lua_State *L)
{
    MIDISetup_h__(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMIDISetupAPIs[] = {
    {"MIDISetup_h__", lua_MIDISetup_h__},
    {"MIDISetup_h__", lua_MIDISetup_h__},
    {"MIDISetupRef", lua_MIDISetupRef},
    {"MIDISetupRef", lua_MIDISetupRef},
    {"MIDISetupRef", lua_MIDISetupRef},
    {"MIDISetupRef", lua_MIDISetupRef},
    {"MIDISetupCreate", lua_MIDISetupCreate},
    {"MIDISetupInstall", lua_MIDISetupInstall},
    {"MIDISetupCreate", lua_MIDISetupCreate},
    {"MIDISetupDispose", lua_MIDISetupDispose},
    {"MIDISetupDispose", lua_MIDISetupDispose},
    {"MIDISetupInstall", lua_MIDISetupInstall},
    {"MIDISetupCreate", lua_MIDISetupCreate},
    {"MIDISetupInstall", lua_MIDISetupInstall},
    {"MIDISetupGetCurrent", lua_MIDISetupGetCurrent},
    {"MIDISetupGetCurrent", lua_MIDISetupGetCurrent},
    {"MIDISetupToData", lua_MIDISetupToData},
    {"MIDISetupToData", lua_MIDISetupToData},
    {"MIDISetupFromData", lua_MIDISetupFromData},
    {"MIDISetupInstall", lua_MIDISetupInstall},
    {"MIDISetupFromData", lua_MIDISetupFromData},
    {"MIDISetupRef", lua_MIDISetupRef},
    {"MIDISetupAddDevice", lua_MIDISetupAddDevice},
    {"MIDISetupRemoveDevice", lua_MIDISetupRemoveDevice},
    {"MIDISetupAddDevice", lua_MIDISetupAddDevice},
    {"MIDISetupRemoveDevice", lua_MIDISetupRemoveDevice},
    {"MIDISetupRemoveDevice", lua_MIDISetupRemoveDevice},
    {"MIDISetupAddExternalDevice", lua_MIDISetupAddExternalDevice},
    {"MIDISetupAddExternalDevice", lua_MIDISetupAddExternalDevice},
    {"MIDISetupRemoveExternalDevice", lua_MIDISetupRemoveExternalDevice},
    {"MIDISetupRemoveExternalDevice", lua_MIDISetupRemoveExternalDevice},
    {"MIDISetupRef", lua_MIDISetupRef},
    {"MIDISetupAddExternalDevice", lua_MIDISetupAddExternalDevice},
    {"MIDISetup_h__", lua_MIDISetup_h__},
    {NULL, NULL},
};

int LuaOpenMIDISetup(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMIDISetupAPIs);
    return 0;
}
