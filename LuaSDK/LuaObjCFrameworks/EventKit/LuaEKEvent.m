//
//  LuaEKEvent.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaEKEvent.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_EKEventStore(lua_State *L)
{
    EKEventStore(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventAvailabilityNotSupported(lua_State *L)
{
    EKEventAvailabilityNotSupported(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventAvailabilityBusy(lua_State *L)
{
    EKEventAvailabilityBusy(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventAvailabilityFree(lua_State *L)
{
    EKEventAvailabilityFree(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventAvailabilityTentative(lua_State *L)
{
    EKEventAvailabilityTentative(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventAvailabilityUnavailable(lua_State *L)
{
    EKEventAvailabilityUnavailable(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventAvailability(lua_State *L)
{
    EKEventAvailability(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventStatusNone(lua_State *L)
{
    EKEventStatusNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventStatusConfirmed(lua_State *L)
{
    EKEventStatusConfirmed(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventStatusTentative(lua_State *L)
{
    EKEventStatusTentative(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventStatusCanceled(lua_State *L)
{
    EKEventStatusCanceled(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventStatus(lua_State *L)
{
    EKEventStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventStore(lua_State *L)
{
    EKEventStore(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventStore(lua_State *L)
{
    EKEventStore(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventStore(lua_State *L)
{
    EKEventStore(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEvents(lua_State *L)
{
    EKEvents(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventAvailabilityNotSupported(lua_State *L)
{
    EKEventAvailabilityNotSupported(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventAvailability(lua_State *L)
{
    EKEventAvailability(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventStatus(lua_State *L)
{
    EKEventStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventStatus(lua_State *L)
{
    EKEventStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventStoreChangedNotification(lua_State *L)
{
    EKEventStoreChangedNotification(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaEKEventAPIs[] = {
    {"EKEventStore", lua_EKEventStore},
    {"EKEventAvailabilityNotSupported", lua_EKEventAvailabilityNotSupported},
    {"EKEventAvailabilityBusy", lua_EKEventAvailabilityBusy},
    {"EKEventAvailabilityFree", lua_EKEventAvailabilityFree},
    {"EKEventAvailabilityTentative", lua_EKEventAvailabilityTentative},
    {"EKEventAvailabilityUnavailable", lua_EKEventAvailabilityUnavailable},
    {"EKEventAvailability", lua_EKEventAvailability},
    {"EKEventStatusNone", lua_EKEventStatusNone},
    {"EKEventStatusConfirmed", lua_EKEventStatusConfirmed},
    {"EKEventStatusTentative", lua_EKEventStatusTentative},
    {"EKEventStatusCanceled", lua_EKEventStatusCanceled},
    {"EKEventStatus", lua_EKEventStatus},
    {"EKEventStore", lua_EKEventStore},
    {"EKEventStore", lua_EKEventStore},
    {"EKEventStore", lua_EKEventStore},
    {"EKEvents", lua_EKEvents},
    {"EKEventAvailabilityNotSupported", lua_EKEventAvailabilityNotSupported},
    {"EKEventAvailability", lua_EKEventAvailability},
    {"EKEventStatus", lua_EKEventStatus},
    {"EKEventStatus", lua_EKEventStatus},
    {"EKEventStoreChangedNotification", lua_EKEventStoreChangedNotification},
    {NULL, NULL},
};

int LuaOpenEKEvent(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaEKEventAPIs);
    return 0;
}
