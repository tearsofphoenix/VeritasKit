//
//  LuaGKTurnBasedMatch.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKTurnBasedMatch.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKTurnBasedMatchStatusUnknown(lua_State *L)
{
    GKTurnBasedMatchStatusUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchStatusOpen(lua_State *L)
{
    GKTurnBasedMatchStatusOpen(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchStatusEnded(lua_State *L)
{
    GKTurnBasedMatchStatusEnded(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchStatusMatching(lua_State *L)
{
    GKTurnBasedMatchStatusMatching(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchStatus(lua_State *L)
{
    GKTurnBasedMatchStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcomeNone(lua_State *L)
{
    GKTurnBasedMatchOutcomeNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcomeQuit(lua_State *L)
{
    GKTurnBasedMatchOutcomeQuit(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcomeWon(lua_State *L)
{
    GKTurnBasedMatchOutcomeWon(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcomeLost(lua_State *L)
{
    GKTurnBasedMatchOutcomeLost(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcomeTied(lua_State *L)
{
    GKTurnBasedMatchOutcomeTied(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcomeTimeExpired(lua_State *L)
{
    GKTurnBasedMatchOutcomeTimeExpired(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcomeFirst(lua_State *L)
{
    GKTurnBasedMatchOutcomeFirst(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcomeSecond(lua_State *L)
{
    GKTurnBasedMatchOutcomeSecond(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcomeThird(lua_State *L)
{
    GKTurnBasedMatchOutcomeThird(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcomeFourth(lua_State *L)
{
    GKTurnBasedMatchOutcomeFourth(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcomeCustomRange(lua_State *L)
{
    GKTurnBasedMatchOutcomeCustomRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcome(lua_State *L)
{
    GKTurnBasedMatchOutcome(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchmakerViewController(lua_State *L)
{
    GKTurnBasedMatchmakerViewController(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcome(lua_State *L)
{
    GKTurnBasedMatchOutcome(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchStatus(lua_State *L)
{
    GKTurnBasedMatchStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchmakerViewController(lua_State *L)
{
    GKTurnBasedMatchmakerViewController(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatches(lua_State *L)
{
    GKTurnBasedMatches(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchmakerViewController(lua_State *L)
{
    GKTurnBasedMatchmakerViewController(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcome(lua_State *L)
{
    GKTurnBasedMatchOutcome(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKTurnBasedMatchOutcome(lua_State *L)
{
    GKTurnBasedMatchOutcome(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKTurnBasedMatchAPIs[] = {
    {"GKTurnBasedMatchStatusUnknown", lua_GKTurnBasedMatchStatusUnknown},
    {"GKTurnBasedMatchStatusOpen", lua_GKTurnBasedMatchStatusOpen},
    {"GKTurnBasedMatchStatusEnded", lua_GKTurnBasedMatchStatusEnded},
    {"GKTurnBasedMatchStatusMatching", lua_GKTurnBasedMatchStatusMatching},
    {"GKTurnBasedMatchStatus", lua_GKTurnBasedMatchStatus},
    {"GKTurnBasedMatchOutcomeNone", lua_GKTurnBasedMatchOutcomeNone},
    {"GKTurnBasedMatchOutcomeQuit", lua_GKTurnBasedMatchOutcomeQuit},
    {"GKTurnBasedMatchOutcomeWon", lua_GKTurnBasedMatchOutcomeWon},
    {"GKTurnBasedMatchOutcomeLost", lua_GKTurnBasedMatchOutcomeLost},
    {"GKTurnBasedMatchOutcomeTied", lua_GKTurnBasedMatchOutcomeTied},
    {"GKTurnBasedMatchOutcomeTimeExpired", lua_GKTurnBasedMatchOutcomeTimeExpired},
    {"GKTurnBasedMatchOutcomeFirst", lua_GKTurnBasedMatchOutcomeFirst},
    {"GKTurnBasedMatchOutcomeSecond", lua_GKTurnBasedMatchOutcomeSecond},
    {"GKTurnBasedMatchOutcomeThird", lua_GKTurnBasedMatchOutcomeThird},
    {"GKTurnBasedMatchOutcomeFourth", lua_GKTurnBasedMatchOutcomeFourth},
    {"GKTurnBasedMatchOutcomeCustomRange", lua_GKTurnBasedMatchOutcomeCustomRange},
    {"GKTurnBasedMatchOutcome", lua_GKTurnBasedMatchOutcome},
    {"GKTurnBasedMatchmakerViewController", lua_GKTurnBasedMatchmakerViewController},
    {"GKTurnBasedMatchOutcome", lua_GKTurnBasedMatchOutcome},
    {"GKTurnBasedMatchStatus", lua_GKTurnBasedMatchStatus},
    {"GKTurnBasedMatchmakerViewController", lua_GKTurnBasedMatchmakerViewController},
    {"GKTurnBasedMatches", lua_GKTurnBasedMatches},
    {"GKTurnBasedMatchmakerViewController", lua_GKTurnBasedMatchmakerViewController},
    {"GKTurnBasedMatchOutcome", lua_GKTurnBasedMatchOutcome},
    {"GKTurnBasedMatchOutcome", lua_GKTurnBasedMatchOutcome},
    {NULL, NULL},
};

int LuaOpenGKTurnBasedMatch(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKTurnBasedMatchAPIs);
    return 0;
}
