//
//  LuaAVCompositionTrack.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVCompositionTrack.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVCompositionTrackSegments(lua_State *L)
{
    AVCompositionTrackSegments(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackInternal(lua_State *L)
{
    AVCompositionTrackInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackInternal(lua_State *L)
{
    AVCompositionTrackInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackSegment(lua_State *L)
{
    AVCompositionTrackSegment(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackSegment(lua_State *L)
{
    AVCompositionTrackSegment(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackSegment(lua_State *L)
{
    AVCompositionTrackSegment(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackSegment(lua_State *L)
{
    AVCompositionTrackSegment(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackSegments(lua_State *L)
{
    AVCompositionTrackSegments(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackSegment(lua_State *L)
{
    AVCompositionTrackSegment(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackSegment(lua_State *L)
{
    AVCompositionTrackSegment(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackSegment(lua_State *L)
{
    AVCompositionTrackSegment(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackSegment(lua_State *L)
{
    AVCompositionTrackSegment(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackSegments(lua_State *L)
{
    AVCompositionTrackSegments(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackSegments(lua_State *L)
{
    AVCompositionTrackSegments(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackSegments(lua_State *L)
{
    AVCompositionTrackSegments(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVCompositionTrackAPIs[] = {
    {"AVCompositionTrackSegments", lua_AVCompositionTrackSegments},
    {"AVCompositionTrackInternal", lua_AVCompositionTrackInternal},
    {"AVCompositionTrackInternal", lua_AVCompositionTrackInternal},
    {"AVCompositionTrackSegment", lua_AVCompositionTrackSegment},
    {"AVCompositionTrackSegment", lua_AVCompositionTrackSegment},
    {"AVCompositionTrackSegment", lua_AVCompositionTrackSegment},
    {"AVCompositionTrackSegment", lua_AVCompositionTrackSegment},
    {"AVCompositionTrackSegments", lua_AVCompositionTrackSegments},
    {"AVCompositionTrackSegment", lua_AVCompositionTrackSegment},
    {"AVCompositionTrackSegment", lua_AVCompositionTrackSegment},
    {"AVCompositionTrackSegment", lua_AVCompositionTrackSegment},
    {"AVCompositionTrackSegment", lua_AVCompositionTrackSegment},
    {"AVCompositionTrackSegments", lua_AVCompositionTrackSegments},
    {"AVCompositionTrackSegments", lua_AVCompositionTrackSegments},
    {"AVCompositionTrackSegments", lua_AVCompositionTrackSegments},
    {NULL, NULL},
};

int LuaOpenAVCompositionTrack(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVCompositionTrackAPIs);
    return 0;
}
