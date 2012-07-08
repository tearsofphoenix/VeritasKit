//
//  LuaNSIncrementalStore.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSIncrementalStore.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_NSIncrementalStoreNode(lua_State *L)
{
    NSIncrementalStoreNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSIncrementalStoreNode(lua_State *L)
{
    NSIncrementalStoreNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSIncrementalStoreNode(lua_State *L)
{
    NSIncrementalStoreNode(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaNSIncrementalStoreAPIs[] = {
    {"NSIncrementalStoreNode", lua_NSIncrementalStoreNode},
    {"NSIncrementalStoreNode", lua_NSIncrementalStoreNode},
    {"NSIncrementalStoreNode", lua_NSIncrementalStoreNode},
    {NULL, NULL},
};

int LuaOpenNSIncrementalStore(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSIncrementalStoreAPIs);
    return 0;
}
