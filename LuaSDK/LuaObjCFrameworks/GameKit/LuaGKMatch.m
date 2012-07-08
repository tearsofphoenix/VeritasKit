//
//  LuaGKMatch.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKMatch.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKMatchDelegate(lua_State *L)
{
    GKMatchDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKMatchSendDataReliable(lua_State *L)
{
    GKMatchSendDataReliable(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKMatchSendDataUnreliable(lua_State *L)
{
    GKMatchSendDataUnreliable(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKMatchSendDataMode(lua_State *L)
{
    GKMatchSendDataMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKMatchmaker(lua_State *L)
{
    GKMatchmaker(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKMatchDelegate(lua_State *L)
{
    GKMatchDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKMatchSendDataMode(lua_State *L)
{
    GKMatchSendDataMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKMatchSendDataMode(lua_State *L)
{
    GKMatchSendDataMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKMatchDelegate(lua_State *L)
{
    GKMatchDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKMatchAPIs[] = {
    {"GKMatchDelegate", lua_GKMatchDelegate},
    {"GKMatchSendDataReliable", lua_GKMatchSendDataReliable},
    {"GKMatchSendDataUnreliable", lua_GKMatchSendDataUnreliable},
    {"GKMatchSendDataMode", lua_GKMatchSendDataMode},
    {"GKMatchmaker", lua_GKMatchmaker},
    {"GKMatchDelegate", lua_GKMatchDelegate},
    {"GKMatchSendDataMode", lua_GKMatchSendDataMode},
    {"GKMatchSendDataMode", lua_GKMatchSendDataMode},
    {"GKMatchDelegate", lua_GKMatchDelegate},
    {NULL, NULL},
};

int LuaOpenGKMatch(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKMatchAPIs);
    return 0;
}
