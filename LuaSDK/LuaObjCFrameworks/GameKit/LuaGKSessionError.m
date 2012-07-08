//
//  LuaGKSessionError.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKSessionError.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKSessionErrorDomain(lua_State *L)
{
    GKSessionErrorDomain(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKSessionErrorAPIs[] = {
    {"GKSessionErrorDomain", lua_GKSessionErrorDomain},
    {NULL, NULL},
};

int LuaOpenGKSessionError(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKSessionErrorAPIs);
    return 0;
}
