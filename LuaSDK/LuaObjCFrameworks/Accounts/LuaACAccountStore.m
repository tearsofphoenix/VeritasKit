//
//  LuaACAccountStore.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaACAccountStore.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_ACAccountStoreSaveCompletionHandler(lua_State *L)
{
    ACAccountStoreSaveCompletionHandler(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACAccountStoreRequestAccessCompletionHandler(lua_State *L)
{
    ACAccountStoreRequestAccessCompletionHandler(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACAccountStoreSaveCompletionHandler(lua_State *L)
{
    ACAccountStoreSaveCompletionHandler(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACAccountStoreRequestAccessCompletionHandler(lua_State *L)
{
    ACAccountStoreRequestAccessCompletionHandler(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACAccountStoreDidChangeNotification(lua_State *L)
{
    ACAccountStoreDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaACAccountStoreAPIs[] = {
    {"ACAccountStoreSaveCompletionHandler", lua_ACAccountStoreSaveCompletionHandler},
    {"ACAccountStoreRequestAccessCompletionHandler", lua_ACAccountStoreRequestAccessCompletionHandler},
    {"ACAccountStoreSaveCompletionHandler", lua_ACAccountStoreSaveCompletionHandler},
    {"ACAccountStoreRequestAccessCompletionHandler", lua_ACAccountStoreRequestAccessCompletionHandler},
    {"ACAccountStoreDidChangeNotification", lua_ACAccountStoreDidChangeNotification},
    {NULL, NULL},
};

int LuaOpenACAccountStore(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaACAccountStoreAPIs);
    return 0;
}
