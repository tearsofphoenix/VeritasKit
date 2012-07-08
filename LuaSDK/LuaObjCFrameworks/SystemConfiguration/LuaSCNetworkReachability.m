//
//  LuaSCNetworkReachability.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSCNetworkReachability.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityContext(lua_State *L)
{
    SCNetworkReachabilityContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityContext(lua_State *L)
{
    SCNetworkReachabilityContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlags(lua_State *L)
{
    SCNetworkReachabilityFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsTransientConnection(lua_State *L)
{
    SCNetworkReachabilityFlagsTransientConnection(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsReachable(lua_State *L)
{
    SCNetworkReachabilityFlagsReachable(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsConnectionRequired(lua_State *L)
{
    SCNetworkReachabilityFlagsConnectionRequired(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsConnectionOnTraffic(lua_State *L)
{
    SCNetworkReachabilityFlagsConnectionOnTraffic(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsConnectionAutomatic(lua_State *L)
{
    SCNetworkReachabilityFlagsConnectionAutomatic(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsInterventionRequired(lua_State *L)
{
    SCNetworkReachabilityFlagsInterventionRequired(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsConnectionOnDemand(lua_State *L)
{
    SCNetworkReachabilityFlagsConnectionOnDemand(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsIsLocalAddress(lua_State *L)
{
    SCNetworkReachabilityFlagsIsLocalAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsIsDirect(lua_State *L)
{
    SCNetworkReachabilityFlagsIsDirect(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsIsWWAN(lua_State *L)
{
    SCNetworkReachabilityFlagsIsWWAN(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsTransientConnection(lua_State *L)
{
    SCNetworkReachabilityFlagsTransientConnection(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsReachable(lua_State *L)
{
    SCNetworkReachabilityFlagsReachable(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsConnectionRequired(lua_State *L)
{
    SCNetworkReachabilityFlagsConnectionRequired(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsConnectionOnTraffic(lua_State *L)
{
    SCNetworkReachabilityFlagsConnectionOnTraffic(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsInterventionRequired(lua_State *L)
{
    SCNetworkReachabilityFlagsInterventionRequired(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsConnectionOnDemand(lua_State *L)
{
    SCNetworkReachabilityFlagsConnectionOnDemand(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsIsLocalAddress(lua_State *L)
{
    SCNetworkReachabilityFlagsIsLocalAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsIsDirect(lua_State *L)
{
    SCNetworkReachabilityFlagsIsDirect(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsIsWWAN(lua_State *L)
{
    SCNetworkReachabilityFlagsIsWWAN(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlagsConnectionAutomatic(lua_State *L)
{
    SCNetworkReachabilityFlagsConnectionAutomatic(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlags(lua_State *L)
{
    SCNetworkReachabilityFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityCallBack(lua_State *L)
{
    SCNetworkReachabilityCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlags(lua_State *L)
{
    SCNetworkReachabilityFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityCallBack(lua_State *L)
{
    SCNetworkReachabilityCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlags(lua_State *L)
{
    SCNetworkReachabilityFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityCreateWithAddress(lua_State *L)
{
    SCNetworkReachabilityCreateWithAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityCreateWithAddress(lua_State *L)
{
    SCNetworkReachabilityCreateWithAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityCreateWithAddressPair(lua_State *L)
{
    SCNetworkReachabilityCreateWithAddressPair(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityCreateWithAddressPair(lua_State *L)
{
    SCNetworkReachabilityCreateWithAddressPair(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityCreateWithName(lua_State *L)
{
    SCNetworkReachabilityCreateWithName(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityCreateWithName(lua_State *L)
{
    SCNetworkReachabilityCreateWithName(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityGetTypeID(lua_State *L)
{
    SCNetworkReachabilityGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityGetTypeID(lua_State *L)
{
    SCNetworkReachabilityGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityGetFlags(lua_State *L)
{
    SCNetworkReachabilityGetFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlags(lua_State *L)
{
    SCNetworkReachabilityFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityGetFlags(lua_State *L)
{
    SCNetworkReachabilityGetFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityFlags(lua_State *L)
{
    SCNetworkReachabilityFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilitySetCallback(lua_State *L)
{
    SCNetworkReachabilitySetCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityContext(lua_State *L)
{
    SCNetworkReachabilityContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilitySetCallback(lua_State *L)
{
    SCNetworkReachabilitySetCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityCallBack(lua_State *L)
{
    SCNetworkReachabilityCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityContext(lua_State *L)
{
    SCNetworkReachabilityContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityScheduleWithRunLoop(lua_State *L)
{
    SCNetworkReachabilityScheduleWithRunLoop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityScheduleWithRunLoop(lua_State *L)
{
    SCNetworkReachabilityScheduleWithRunLoop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityUnscheduleFromRunLoop(lua_State *L)
{
    SCNetworkReachabilityUnscheduleFromRunLoop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityUnscheduleFromRunLoop(lua_State *L)
{
    SCNetworkReachabilityUnscheduleFromRunLoop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilitySetDispatchQueue(lua_State *L)
{
    SCNetworkReachabilitySetDispatchQueue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilitySetDispatchQueue(lua_State *L)
{
    SCNetworkReachabilitySetDispatchQueue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityRef(lua_State *L)
{
    SCNetworkReachabilityRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSCNetworkReachabilityAPIs[] = {
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilityContext", lua_SCNetworkReachabilityContext},
    {"SCNetworkReachabilityContext", lua_SCNetworkReachabilityContext},
    {"SCNetworkReachabilityFlags", lua_SCNetworkReachabilityFlags},
    {"SCNetworkReachabilityFlagsTransientConnection", lua_SCNetworkReachabilityFlagsTransientConnection},
    {"SCNetworkReachabilityFlagsReachable", lua_SCNetworkReachabilityFlagsReachable},
    {"SCNetworkReachabilityFlagsConnectionRequired", lua_SCNetworkReachabilityFlagsConnectionRequired},
    {"SCNetworkReachabilityFlagsConnectionOnTraffic", lua_SCNetworkReachabilityFlagsConnectionOnTraffic},
    {"SCNetworkReachabilityFlagsConnectionAutomatic", lua_SCNetworkReachabilityFlagsConnectionAutomatic},
    {"SCNetworkReachabilityFlagsInterventionRequired", lua_SCNetworkReachabilityFlagsInterventionRequired},
    {"SCNetworkReachabilityFlagsConnectionOnDemand", lua_SCNetworkReachabilityFlagsConnectionOnDemand},
    {"SCNetworkReachabilityFlagsIsLocalAddress", lua_SCNetworkReachabilityFlagsIsLocalAddress},
    {"SCNetworkReachabilityFlagsIsDirect", lua_SCNetworkReachabilityFlagsIsDirect},
    {"SCNetworkReachabilityFlagsIsWWAN", lua_SCNetworkReachabilityFlagsIsWWAN},
    {"SCNetworkReachabilityFlagsTransientConnection", lua_SCNetworkReachabilityFlagsTransientConnection},
    {"SCNetworkReachabilityFlagsReachable", lua_SCNetworkReachabilityFlagsReachable},
    {"SCNetworkReachabilityFlagsConnectionRequired", lua_SCNetworkReachabilityFlagsConnectionRequired},
    {"SCNetworkReachabilityFlagsConnectionOnTraffic", lua_SCNetworkReachabilityFlagsConnectionOnTraffic},
    {"SCNetworkReachabilityFlagsInterventionRequired", lua_SCNetworkReachabilityFlagsInterventionRequired},
    {"SCNetworkReachabilityFlagsConnectionOnDemand", lua_SCNetworkReachabilityFlagsConnectionOnDemand},
    {"SCNetworkReachabilityFlagsIsLocalAddress", lua_SCNetworkReachabilityFlagsIsLocalAddress},
    {"SCNetworkReachabilityFlagsIsDirect", lua_SCNetworkReachabilityFlagsIsDirect},
    {"SCNetworkReachabilityFlagsIsWWAN", lua_SCNetworkReachabilityFlagsIsWWAN},
    {"SCNetworkReachabilityFlagsConnectionAutomatic", lua_SCNetworkReachabilityFlagsConnectionAutomatic},
    {"SCNetworkReachabilityFlags", lua_SCNetworkReachabilityFlags},
    {"SCNetworkReachabilityCallBack", lua_SCNetworkReachabilityCallBack},
    {"SCNetworkReachabilityFlags", lua_SCNetworkReachabilityFlags},
    {"SCNetworkReachabilityCallBack", lua_SCNetworkReachabilityCallBack},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilityFlags", lua_SCNetworkReachabilityFlags},
    {"SCNetworkReachabilityCreateWithAddress", lua_SCNetworkReachabilityCreateWithAddress},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilityCreateWithAddress", lua_SCNetworkReachabilityCreateWithAddress},
    {"SCNetworkReachabilityCreateWithAddressPair", lua_SCNetworkReachabilityCreateWithAddressPair},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilityCreateWithAddressPair", lua_SCNetworkReachabilityCreateWithAddressPair},
    {"SCNetworkReachabilityCreateWithName", lua_SCNetworkReachabilityCreateWithName},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilityCreateWithName", lua_SCNetworkReachabilityCreateWithName},
    {"SCNetworkReachabilityGetTypeID", lua_SCNetworkReachabilityGetTypeID},
    {"SCNetworkReachabilityGetTypeID", lua_SCNetworkReachabilityGetTypeID},
    {"SCNetworkReachabilityGetFlags", lua_SCNetworkReachabilityGetFlags},
    {"SCNetworkReachabilityFlags", lua_SCNetworkReachabilityFlags},
    {"SCNetworkReachabilityGetFlags", lua_SCNetworkReachabilityGetFlags},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilityFlags", lua_SCNetworkReachabilityFlags},
    {"SCNetworkReachabilitySetCallback", lua_SCNetworkReachabilitySetCallback},
    {"SCNetworkReachabilityContext", lua_SCNetworkReachabilityContext},
    {"SCNetworkReachabilitySetCallback", lua_SCNetworkReachabilitySetCallback},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilityCallBack", lua_SCNetworkReachabilityCallBack},
    {"SCNetworkReachabilityContext", lua_SCNetworkReachabilityContext},
    {"SCNetworkReachabilityScheduleWithRunLoop", lua_SCNetworkReachabilityScheduleWithRunLoop},
    {"SCNetworkReachabilityScheduleWithRunLoop", lua_SCNetworkReachabilityScheduleWithRunLoop},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilityUnscheduleFromRunLoop", lua_SCNetworkReachabilityUnscheduleFromRunLoop},
    {"SCNetworkReachabilityUnscheduleFromRunLoop", lua_SCNetworkReachabilityUnscheduleFromRunLoop},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilitySetDispatchQueue", lua_SCNetworkReachabilitySetDispatchQueue},
    {"SCNetworkReachabilitySetDispatchQueue", lua_SCNetworkReachabilitySetDispatchQueue},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {NULL, NULL},
};

int LuaOpenSCNetworkReachability(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSCNetworkReachabilityAPIs);
    return 0;
}
