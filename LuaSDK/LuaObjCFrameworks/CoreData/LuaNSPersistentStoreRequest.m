//
//  LuaNSPersistentStoreRequest.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSPersistentStoreRequest.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_NSPersistentStoreRequestType(lua_State *L)
{
    NSPersistentStoreRequestType(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSPersistentStoreRequestType(lua_State *L)
{
    NSPersistentStoreRequestType(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaNSPersistentStoreRequestAPIs[] = {
    {"NSPersistentStoreRequestType", lua_NSPersistentStoreRequestType},
    {"NSPersistentStoreRequestType", lua_NSPersistentStoreRequestType},
    {NULL, NULL},
};

int LuaOpenNSPersistentStoreRequest(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSPersistentStoreRequestAPIs);
    return 0;
}
