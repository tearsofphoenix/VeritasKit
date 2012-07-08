//
//  LuaEKEventStore.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaEKEventStore.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_EKEventStoreChangedNotification(lua_State *L)
{
    EKEventStoreChangedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKEventStoreChangedNotification(lua_State *L)
{
    EKEventStoreChangedNotification(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaEKEventStoreAPIs[] = {
    {"EKEventStoreChangedNotification", lua_EKEventStoreChangedNotification},
    {"EKEventStoreChangedNotification", lua_EKEventStoreChangedNotification},
    {NULL, NULL},
};

int LuaOpenEKEventStore(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaEKEventStoreAPIs);
    return 0;
}
