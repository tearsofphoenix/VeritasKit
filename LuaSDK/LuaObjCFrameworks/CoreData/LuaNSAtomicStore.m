//
//  LuaNSAtomicStore.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSAtomicStore.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_NSAtomicStoreCacheNode(lua_State *L)
{
    NSAtomicStoreCacheNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSAtomicStoreCacheNode(lua_State *L)
{
    NSAtomicStoreCacheNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSAtomicStoreCacheNode(lua_State *L)
{
    NSAtomicStoreCacheNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSAtomicStoreCacheNode(lua_State *L)
{
    NSAtomicStoreCacheNode(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaNSAtomicStoreAPIs[] = {
    {"NSAtomicStoreCacheNode", lua_NSAtomicStoreCacheNode},
    {"NSAtomicStoreCacheNode", lua_NSAtomicStoreCacheNode},
    {"NSAtomicStoreCacheNode", lua_NSAtomicStoreCacheNode},
    {"NSAtomicStoreCacheNode", lua_NSAtomicStoreCacheNode},
    {NULL, NULL},
};

int LuaOpenNSAtomicStore(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSAtomicStoreAPIs);
    return 0;
}
