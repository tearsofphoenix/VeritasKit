//
//  LuaMKUserLocation.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMKUserLocation.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MKUserLocationInternal(lua_State *L)
{
    MKUserLocationInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKUserLocationInternal(lua_State *L)
{
    MKUserLocationInternal(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMKUserLocationAPIs[] = {
    {"MKUserLocationInternal", lua_MKUserLocationInternal},
    {"MKUserLocationInternal", lua_MKUserLocationInternal},
    {NULL, NULL},
};

int LuaOpenMKUserLocation(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMKUserLocationAPIs);
    return 0;
}
