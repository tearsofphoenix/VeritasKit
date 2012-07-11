//
//  LuaNSUbiquitousKeyValueStore.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSUbiquitousKeyValueStore.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSUbiquitousKeyValueStoreConstants[] = {
    {"NSUbiquitousKeyValueStoreServerChange", NSUbiquitousKeyValueStoreServerChange},
    {"NSUbiquitousKeyValueStoreInitialSyncChange", NSUbiquitousKeyValueStoreInitialSyncChange},
    {"NSUbiquitousKeyValueStoreQuotaViolationChange", NSUbiquitousKeyValueStoreQuotaViolationChange},
    {NULL, 0},
};

int LuaOpenNSUbiquitousKeyValueStore(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSUbiquitousKeyValueStoreConstants);
    return 0;
}
