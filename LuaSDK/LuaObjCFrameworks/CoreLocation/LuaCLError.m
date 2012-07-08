//
//  LuaCLError.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCLError.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CLErrorLocationUnknown(lua_State *L)
{
    CLErrorLocationUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLErrorDenied(lua_State *L)
{
    CLErrorDenied(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLErrorNetwork(lua_State *L)
{
    CLErrorNetwork(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLErrorHeadingFailure(lua_State *L)
{
    CLErrorHeadingFailure(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLErrorRegionMonitoringDenied(lua_State *L)
{
    CLErrorRegionMonitoringDenied(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLErrorRegionMonitoringFailure(lua_State *L)
{
    CLErrorRegionMonitoringFailure(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLErrorRegionMonitoringSetupDelayed(lua_State *L)
{
    CLErrorRegionMonitoringSetupDelayed(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLErrorRegionMonitoringResponseDelayed(lua_State *L)
{
    CLErrorRegionMonitoringResponseDelayed(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLErrorGeocodeFoundNoResult(lua_State *L)
{
    CLErrorGeocodeFoundNoResult(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLErrorGeocodeFoundPartialResult(lua_State *L)
{
    CLErrorGeocodeFoundPartialResult(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLErrorGeocodeCanceled(lua_State *L)
{
    CLErrorGeocodeCanceled(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLErrorUserInfoAlternateRegionKey(lua_State *L)
{
    CLErrorUserInfoAlternateRegionKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLErrorRegionMonitoringResponseDelayed(lua_State *L)
{
    CLErrorRegionMonitoringResponseDelayed(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLErrorUserInfoAlternateRegionKey(lua_State *L)
{
    CLErrorUserInfoAlternateRegionKey(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCLErrorAPIs[] = {
    {"CLErrorLocationUnknown", lua_CLErrorLocationUnknown},
    {"CLErrorDenied", lua_CLErrorDenied},
    {"CLErrorNetwork", lua_CLErrorNetwork},
    {"CLErrorHeadingFailure", lua_CLErrorHeadingFailure},
    {"CLErrorRegionMonitoringDenied", lua_CLErrorRegionMonitoringDenied},
    {"CLErrorRegionMonitoringFailure", lua_CLErrorRegionMonitoringFailure},
    {"CLErrorRegionMonitoringSetupDelayed", lua_CLErrorRegionMonitoringSetupDelayed},
    {"CLErrorRegionMonitoringResponseDelayed", lua_CLErrorRegionMonitoringResponseDelayed},
    {"CLErrorGeocodeFoundNoResult", lua_CLErrorGeocodeFoundNoResult},
    {"CLErrorGeocodeFoundPartialResult", lua_CLErrorGeocodeFoundPartialResult},
    {"CLErrorGeocodeCanceled", lua_CLErrorGeocodeCanceled},
    {"CLErrorUserInfoAlternateRegionKey", lua_CLErrorUserInfoAlternateRegionKey},
    {"CLErrorRegionMonitoringResponseDelayed", lua_CLErrorRegionMonitoringResponseDelayed},
    {"CLErrorUserInfoAlternateRegionKey", lua_CLErrorUserInfoAlternateRegionKey},
    {NULL, NULL},
};

int LuaOpenCLError(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCLErrorAPIs);
    return 0;
}
