//
//  LuaEKSource.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaEKSource.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_EKSourceType(lua_State *L)
{
    EKSourceType(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaEKSourceAPIs[] = {
    {"EKSourceType", lua_EKSourceType},
    {NULL, NULL},
};

int LuaOpenEKSource(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaEKSourceAPIs);
    return 0;
}
