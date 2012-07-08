//
//  LuaNSIncrementalStoreNode.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSIncrementalStoreNode.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luaNSIncrementalStoreNodeAPIs[] = {
    {NULL, NULL},
};

int LuaOpenNSIncrementalStoreNode(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSIncrementalStoreNodeAPIs);
    return 0;
}
