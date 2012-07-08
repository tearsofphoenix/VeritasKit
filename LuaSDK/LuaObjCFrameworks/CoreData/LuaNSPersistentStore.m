//
//  LuaNSPersistentStore.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSPersistentStore.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_NSPersistentStoreCoordinator(lua_State *L)
{
    NSPersistentStoreCoordinator(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSPersistentStoreCoordinator(lua_State *L)
{
    NSPersistentStoreCoordinator(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSPersistentStoreCoordinator(lua_State *L)
{
    NSPersistentStoreCoordinator(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSPersistentStoreCoordinator(lua_State *L)
{
    NSPersistentStoreCoordinator(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSPersistentStoreCoordinator(lua_State *L)
{
    NSPersistentStoreCoordinator(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSPersistentStoreCoordinator(lua_State *L)
{
    NSPersistentStoreCoordinator(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaNSPersistentStoreAPIs[] = {
    {"NSPersistentStoreCoordinator", lua_NSPersistentStoreCoordinator},
    {"NSPersistentStoreCoordinator", lua_NSPersistentStoreCoordinator},
    {"NSPersistentStoreCoordinator", lua_NSPersistentStoreCoordinator},
    {"NSPersistentStoreCoordinator", lua_NSPersistentStoreCoordinator},
    {"NSPersistentStoreCoordinator", lua_NSPersistentStoreCoordinator},
    {"NSPersistentStoreCoordinator", lua_NSPersistentStoreCoordinator},
    {NULL, NULL},
};

int LuaOpenNSPersistentStore(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSPersistentStoreAPIs);
    return 0;
}
