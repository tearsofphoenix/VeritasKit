//
//  LuaGKLeaderboard.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKLeaderboard.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKLeaderboardTimeScopeToday(lua_State *L)
{
    GKLeaderboardTimeScopeToday(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKLeaderboardTimeScopeWeek(lua_State *L)
{
    GKLeaderboardTimeScopeWeek(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKLeaderboardTimeScopeAllTime(lua_State *L)
{
    GKLeaderboardTimeScopeAllTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKLeaderboardTimeScope(lua_State *L)
{
    GKLeaderboardTimeScope(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKLeaderboardPlayerScopeGlobal(lua_State *L)
{
    GKLeaderboardPlayerScopeGlobal(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKLeaderboardPlayerScopeFriendsOnly(lua_State *L)
{
    GKLeaderboardPlayerScopeFriendsOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKLeaderboardPlayerScope(lua_State *L)
{
    GKLeaderboardPlayerScope(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKLeaderboardTimeScope(lua_State *L)
{
    GKLeaderboardTimeScope(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKLeaderboardPlayerScope(lua_State *L)
{
    GKLeaderboardPlayerScope(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKLeaderboardAPIs[] = {
    {"GKLeaderboardTimeScopeToday", lua_GKLeaderboardTimeScopeToday},
    {"GKLeaderboardTimeScopeWeek", lua_GKLeaderboardTimeScopeWeek},
    {"GKLeaderboardTimeScopeAllTime", lua_GKLeaderboardTimeScopeAllTime},
    {"GKLeaderboardTimeScope", lua_GKLeaderboardTimeScope},
    {"GKLeaderboardPlayerScopeGlobal", lua_GKLeaderboardPlayerScopeGlobal},
    {"GKLeaderboardPlayerScopeFriendsOnly", lua_GKLeaderboardPlayerScopeFriendsOnly},
    {"GKLeaderboardPlayerScope", lua_GKLeaderboardPlayerScope},
    {"GKLeaderboardTimeScope", lua_GKLeaderboardTimeScope},
    {"GKLeaderboardPlayerScope", lua_GKLeaderboardPlayerScope},
    {NULL, NULL},
};

int LuaOpenGKLeaderboard(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKLeaderboardAPIs);
    return 0;
}
