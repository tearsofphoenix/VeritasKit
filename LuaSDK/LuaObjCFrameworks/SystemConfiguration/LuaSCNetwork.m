//
//  LuaSCNetwork.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSCNetwork.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SCNetworkCheckReachability(lua_State *L)
{
    SCNetworkCheckReachability(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionFlags(lua_State *L)
{
    SCNetworkConnectionFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnection(lua_State *L)
{
    SCNetworkConnection(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachability(lua_State *L)
{
    SCNetworkReachability(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachability(lua_State *L)
{
    SCNetworkReachability(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsTransientConnection(lua_State *L)
{
    SCNetworkFlagsTransientConnection(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsReachable(lua_State *L)
{
    SCNetworkFlagsReachable(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsConnectionRequired(lua_State *L)
{
    SCNetworkFlagsConnectionRequired(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsConnectionAutomatic(lua_State *L)
{
    SCNetworkFlagsConnectionAutomatic(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsInterventionRequired(lua_State *L)
{
    SCNetworkFlagsInterventionRequired(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsIsLocalAddress(lua_State *L)
{
    SCNetworkFlagsIsLocalAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsIsDirect(lua_State *L)
{
    SCNetworkFlagsIsDirect(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsTransientConnection(lua_State *L)
{
    SCNetworkFlagsTransientConnection(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsReachable(lua_State *L)
{
    SCNetworkFlagsReachable(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsConnectionRequired(lua_State *L)
{
    SCNetworkFlagsConnectionRequired(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsConnectionAutomatic(lua_State *L)
{
    SCNetworkFlagsConnectionAutomatic(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsInterventionRequired(lua_State *L)
{
    SCNetworkFlagsInterventionRequired(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsIsLocalAddress(lua_State *L)
{
    SCNetworkFlagsIsLocalAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkFlagsIsDirect(lua_State *L)
{
    SCNetworkFlagsIsDirect(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionFlags(lua_State *L)
{
    SCNetworkConnectionFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkCheckReachabilityByAddress(lua_State *L)
{
    SCNetworkCheckReachabilityByAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabiltyRef(lua_State *L)
{
    SCNetworkReachabiltyRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabiltyFlags(lua_State *L)
{
    SCNetworkReachabiltyFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityCreateWithAddress(lua_State *L)
{
    SCNetworkReachabilityCreateWithAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityGetFlags(lua_State *L)
{
    SCNetworkReachabilityGetFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionFlags(lua_State *L)
{
    SCNetworkConnectionFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkCheckReachabilityByAddress(lua_State *L)
{
    SCNetworkCheckReachabilityByAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionFlags(lua_State *L)
{
    SCNetworkConnectionFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkCheckReachabilityByName(lua_State *L)
{
    SCNetworkCheckReachabilityByName(lua_touserdata(L, 1));
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

static int lua_SCNetworkReachabilityCreateWithName(lua_State *L)
{
    SCNetworkReachabilityCreateWithName(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkReachabilityGetFlags(lua_State *L)
{
    SCNetworkReachabilityGetFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionFlags(lua_State *L)
{
    SCNetworkConnectionFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkCheckReachabilityByName(lua_State *L)
{
    SCNetworkCheckReachabilityByName(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionFlags(lua_State *L)
{
    SCNetworkConnectionFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkInterfaceRefreshConfiguration(lua_State *L)
{
    SCNetworkInterfaceRefreshConfiguration(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkInterfaceForceConfigurationRefresh(lua_State *L)
{
    SCNetworkInterfaceForceConfigurationRefresh(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkInterfaceRefreshConfiguration(lua_State *L)
{
    SCNetworkInterfaceRefreshConfiguration(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSCNetworkAPIs[] = {
    {"SCNetworkCheckReachability", lua_SCNetworkCheckReachability},
    {"SCNetworkConnectionFlags", lua_SCNetworkConnectionFlags},
    {"SCNetworkConnection", lua_SCNetworkConnection},
    {"SCNetworkReachability", lua_SCNetworkReachability},
    {"SCNetworkReachability", lua_SCNetworkReachability},
    {"SCNetworkFlagsTransientConnection", lua_SCNetworkFlagsTransientConnection},
    {"SCNetworkFlagsReachable", lua_SCNetworkFlagsReachable},
    {"SCNetworkFlagsConnectionRequired", lua_SCNetworkFlagsConnectionRequired},
    {"SCNetworkFlagsConnectionAutomatic", lua_SCNetworkFlagsConnectionAutomatic},
    {"SCNetworkFlagsInterventionRequired", lua_SCNetworkFlagsInterventionRequired},
    {"SCNetworkFlagsIsLocalAddress", lua_SCNetworkFlagsIsLocalAddress},
    {"SCNetworkFlagsIsDirect", lua_SCNetworkFlagsIsDirect},
    {"SCNetworkFlagsTransientConnection", lua_SCNetworkFlagsTransientConnection},
    {"SCNetworkFlagsReachable", lua_SCNetworkFlagsReachable},
    {"SCNetworkFlagsConnectionRequired", lua_SCNetworkFlagsConnectionRequired},
    {"SCNetworkFlagsConnectionAutomatic", lua_SCNetworkFlagsConnectionAutomatic},
    {"SCNetworkFlagsInterventionRequired", lua_SCNetworkFlagsInterventionRequired},
    {"SCNetworkFlagsIsLocalAddress", lua_SCNetworkFlagsIsLocalAddress},
    {"SCNetworkFlagsIsDirect", lua_SCNetworkFlagsIsDirect},
    {"SCNetworkConnectionFlags", lua_SCNetworkConnectionFlags},
    {"SCNetworkCheckReachabilityByAddress", lua_SCNetworkCheckReachabilityByAddress},
    {"SCNetworkReachabiltyRef", lua_SCNetworkReachabiltyRef},
    {"SCNetworkReachabiltyFlags", lua_SCNetworkReachabiltyFlags},
    {"SCNetworkReachabilityCreateWithAddress", lua_SCNetworkReachabilityCreateWithAddress},
    {"SCNetworkReachabilityGetFlags", lua_SCNetworkReachabilityGetFlags},
    {"SCNetworkConnectionFlags", lua_SCNetworkConnectionFlags},
    {"SCNetworkCheckReachabilityByAddress", lua_SCNetworkCheckReachabilityByAddress},
    {"SCNetworkConnectionFlags", lua_SCNetworkConnectionFlags},
    {"SCNetworkCheckReachabilityByName", lua_SCNetworkCheckReachabilityByName},
    {"SCNetworkReachabilityRef", lua_SCNetworkReachabilityRef},
    {"SCNetworkReachabilityFlags", lua_SCNetworkReachabilityFlags},
    {"SCNetworkReachabilityCreateWithName", lua_SCNetworkReachabilityCreateWithName},
    {"SCNetworkReachabilityGetFlags", lua_SCNetworkReachabilityGetFlags},
    {"SCNetworkConnectionFlags", lua_SCNetworkConnectionFlags},
    {"SCNetworkCheckReachabilityByName", lua_SCNetworkCheckReachabilityByName},
    {"SCNetworkConnectionFlags", lua_SCNetworkConnectionFlags},
    {"SCNetworkInterfaceRefreshConfiguration", lua_SCNetworkInterfaceRefreshConfiguration},
    {"SCNetworkInterfaceForceConfigurationRefresh", lua_SCNetworkInterfaceForceConfigurationRefresh},
    {"SCNetworkInterfaceRefreshConfiguration", lua_SCNetworkInterfaceRefreshConfiguration},
    {NULL, NULL},
};

int LuaOpenSCNetwork(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSCNetworkAPIs);
    return 0;
}
