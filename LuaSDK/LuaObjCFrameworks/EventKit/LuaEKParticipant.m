//
//  LuaEKParticipant.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaEKParticipant.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_EKParticipantStatus(lua_State *L)
{
    EKParticipantStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKParticipantStatus(lua_State *L)
{
    EKParticipantStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKParticipantRole(lua_State *L)
{
    EKParticipantRole(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKParticipantRole(lua_State *L)
{
    EKParticipantRole(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKParticipantType(lua_State *L)
{
    EKParticipantType(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKParticipantType(lua_State *L)
{
    EKParticipantType(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaEKParticipantAPIs[] = {
    {"EKParticipantStatus", lua_EKParticipantStatus},
    {"EKParticipantStatus", lua_EKParticipantStatus},
    {"EKParticipantRole", lua_EKParticipantRole},
    {"EKParticipantRole", lua_EKParticipantRole},
    {"EKParticipantType", lua_EKParticipantType},
    {"EKParticipantType", lua_EKParticipantType},
    {NULL, NULL},
};

int LuaOpenEKParticipant(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaEKParticipantAPIs);
    return 0;
}
