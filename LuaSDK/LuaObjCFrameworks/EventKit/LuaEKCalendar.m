//
//  LuaEKCalendar.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaEKCalendar.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_EKCalendarType(lua_State *L)
{
    EKCalendarType(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarType(lua_State *L)
{
    EKCalendarType(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarEventAvailabilityNone(lua_State *L)
{
    EKCalendarEventAvailabilityNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarEventAvailabilityMask(lua_State *L)
{
    EKCalendarEventAvailabilityMask(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaEKCalendarAPIs[] = {
    {"EKCalendarType", lua_EKCalendarType},
    {"EKCalendarType", lua_EKCalendarType},
    {"EKCalendarEventAvailabilityNone", lua_EKCalendarEventAvailabilityNone},
    {"EKCalendarEventAvailabilityMask", lua_EKCalendarEventAvailabilityMask},
    {NULL, NULL},
};

int LuaOpenEKCalendar(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaEKCalendarAPIs);
    return 0;
}
