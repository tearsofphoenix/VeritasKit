//
//  LuaGKSession.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKSession.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKSessionMode(lua_State *L)
{
    GKSessionMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKSessionDelegate(lua_State *L)
{
    GKSessionDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKSessionMode(lua_State *L)
{
    GKSessionMode(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKSessionAPIs[] = {
    {"GKSessionMode", lua_GKSessionMode},
    {"GKSessionDelegate", lua_GKSessionDelegate},
    {"GKSessionMode", lua_GKSessionMode},
    {NULL, NULL},
};

int LuaOpenGKSession(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKSessionAPIs);
    return 0;
}
