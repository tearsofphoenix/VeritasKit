//
//  LuaCaptiveNetwork.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCaptiveNetwork.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CaptiveNetworkSupport(lua_State *L)
{
    CaptiveNetworkSupport(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCaptiveNetworkAPIs[] = {
    {"CaptiveNetworkSupport", lua_CaptiveNetworkSupport},
    {NULL, NULL},
};

int LuaOpenCaptiveNetwork(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCaptiveNetworkAPIs);
    return 0;
}
