//
//  LuaSKRequest.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSKRequest.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SKRequestDelegate(lua_State *L)
{
    SKRequestDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKRequestDelegate(lua_State *L)
{
    SKRequestDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKRequestDelegate(lua_State *L)
{
    SKRequestDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSKRequestAPIs[] = {
    {"SKRequestDelegate", lua_SKRequestDelegate},
    {"SKRequestDelegate", lua_SKRequestDelegate},
    {"SKRequestDelegate", lua_SKRequestDelegate},
    {NULL, NULL},
};

int LuaOpenSKRequest(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSKRequestAPIs);
    return 0;
}
