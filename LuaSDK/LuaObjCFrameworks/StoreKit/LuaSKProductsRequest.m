//
//  LuaSKProductsRequest.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSKProductsRequest.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SKProductsRequestDelegate(lua_State *L)
{
    SKProductsRequestDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKProductsRequestDelegate(lua_State *L)
{
    SKProductsRequestDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSKProductsRequestAPIs[] = {
    {"SKProductsRequestDelegate", lua_SKProductsRequestDelegate},
    {"SKProductsRequestDelegate", lua_SKProductsRequestDelegate},
    {NULL, NULL},
};

int LuaOpenSKProductsRequest(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSKProductsRequestAPIs);
    return 0;
}
