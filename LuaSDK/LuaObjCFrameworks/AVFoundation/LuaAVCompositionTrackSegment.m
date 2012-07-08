//
//  LuaAVCompositionTrackSegment.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVCompositionTrackSegment.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVCompositionTrackSegmentInternal(lua_State *L)
{
    AVCompositionTrackSegmentInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCompositionTrackSegmentInternal(lua_State *L)
{
    AVCompositionTrackSegmentInternal(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVCompositionTrackSegmentAPIs[] = {
    {"AVCompositionTrackSegmentInternal", lua_AVCompositionTrackSegmentInternal},
    {"AVCompositionTrackSegmentInternal", lua_AVCompositionTrackSegmentInternal},
    {NULL, NULL},
};

int LuaOpenAVCompositionTrackSegment(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVCompositionTrackSegmentAPIs);
    return 0;
}
