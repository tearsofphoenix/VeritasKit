//
//  LuaCFNetwork.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFNetwork.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFNetworkDefs(lua_State *L)
{
    CFNetworkDefs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNetworkErrors(lua_State *L)
{
    CFNetworkErrors(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFNetworkAPIs[] = {
    {"CFNetworkDefs", lua_CFNetworkDefs},
    {"CFNetworkErrors", lua_CFNetworkErrors},
    {NULL, NULL},
};

int LuaOpenCFNetwork(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFNetworkAPIs);
    return 0;
}
