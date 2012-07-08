//
//  LuaMusicPlayer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMusicPlayer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MusicPlayerErrors(lua_State *L)
{
    MusicPlayerErrors(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerSetSequence(lua_State *L)
{
    MusicPlayerSetSequence(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerSetSequence(lua_State *L)
{
    MusicPlayerSetSequence(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerGetSequence(lua_State *L)
{
    MusicPlayerGetSequence(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerGetSequence(lua_State *L)
{
    MusicPlayerGetSequence(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerSetTime(lua_State *L)
{
    MusicPlayerSetTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerSetTime(lua_State *L)
{
    MusicPlayerSetTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerGetTime(lua_State *L)
{
    MusicPlayerGetTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerGetTime(lua_State *L)
{
    MusicPlayerGetTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerGetHostTimeForBeats(lua_State *L)
{
    MusicPlayerGetHostTimeForBeats(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerGetHostTimeForBeats(lua_State *L)
{
    MusicPlayerGetHostTimeForBeats(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerGetBeatsForHostTime(lua_State *L)
{
    MusicPlayerGetBeatsForHostTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerGetBeatsForHostTime(lua_State *L)
{
    MusicPlayerGetBeatsForHostTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerPreroll(lua_State *L)
{
    MusicPlayerPreroll(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerPreroll(lua_State *L)
{
    MusicPlayerPreroll(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerStart(lua_State *L)
{
    MusicPlayerStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerStart(lua_State *L)
{
    MusicPlayerStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerStop(lua_State *L)
{
    MusicPlayerStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerStop(lua_State *L)
{
    MusicPlayerStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerIsPlaying(lua_State *L)
{
    MusicPlayerIsPlaying(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerIsPlaying(lua_State *L)
{
    MusicPlayerIsPlaying(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerSetPlayRateScalar(lua_State *L)
{
    MusicPlayerSetPlayRateScalar(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerSetPlayRateScalar(lua_State *L)
{
    MusicPlayerSetPlayRateScalar(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerGetPlayRateScalar(lua_State *L)
{
    MusicPlayerGetPlayRateScalar(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerGetPlayRateScalar(lua_State *L)
{
    MusicPlayerGetPlayRateScalar(lua_touserdata(L, 1));
    return 1;
}

static int lua_MusicPlayerSetTime(lua_State *L)
{
    MusicPlayerSetTime(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMusicPlayerAPIs[] = {
    {"MusicPlayerErrors", lua_MusicPlayerErrors},
    {"MusicPlayerSetSequence", lua_MusicPlayerSetSequence},
    {"MusicPlayerSetSequence", lua_MusicPlayerSetSequence},
    {"MusicPlayerGetSequence", lua_MusicPlayerGetSequence},
    {"MusicPlayerGetSequence", lua_MusicPlayerGetSequence},
    {"MusicPlayerSetTime", lua_MusicPlayerSetTime},
    {"MusicPlayerSetTime", lua_MusicPlayerSetTime},
    {"MusicPlayerGetTime", lua_MusicPlayerGetTime},
    {"MusicPlayerGetTime", lua_MusicPlayerGetTime},
    {"MusicPlayerGetHostTimeForBeats", lua_MusicPlayerGetHostTimeForBeats},
    {"MusicPlayerGetHostTimeForBeats", lua_MusicPlayerGetHostTimeForBeats},
    {"MusicPlayerGetBeatsForHostTime", lua_MusicPlayerGetBeatsForHostTime},
    {"MusicPlayerGetBeatsForHostTime", lua_MusicPlayerGetBeatsForHostTime},
    {"MusicPlayerPreroll", lua_MusicPlayerPreroll},
    {"MusicPlayerPreroll", lua_MusicPlayerPreroll},
    {"MusicPlayerStart", lua_MusicPlayerStart},
    {"MusicPlayerStart", lua_MusicPlayerStart},
    {"MusicPlayerStop", lua_MusicPlayerStop},
    {"MusicPlayerStop", lua_MusicPlayerStop},
    {"MusicPlayerIsPlaying", lua_MusicPlayerIsPlaying},
    {"MusicPlayerIsPlaying", lua_MusicPlayerIsPlaying},
    {"MusicPlayerSetPlayRateScalar", lua_MusicPlayerSetPlayRateScalar},
    {"MusicPlayerSetPlayRateScalar", lua_MusicPlayerSetPlayRateScalar},
    {"MusicPlayerGetPlayRateScalar", lua_MusicPlayerGetPlayRateScalar},
    {"MusicPlayerGetPlayRateScalar", lua_MusicPlayerGetPlayRateScalar},
    {"MusicPlayerSetTime", lua_MusicPlayerSetTime},
    {NULL, NULL},
};

int LuaOpenMusicPlayer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMusicPlayerAPIs);
    return 0;
}
