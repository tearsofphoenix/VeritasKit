//
//  LuaStoreKit.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaStoreKit.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_StoreKitDefines(lua_State *L)
{
    StoreKitDefines(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaStoreKitAPIs[] = {
    {"StoreKitDefines", lua_StoreKitDefines},
    {NULL, NULL},
};

int LuaOpenStoreKit(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaStoreKitAPIs);
    return 0;
}
