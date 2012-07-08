//
//  LuaAVPlayerItemTrack.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVPlayerItemTrack.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVPlayerItemTrackInternal(lua_State *L)
{
    AVPlayerItemTrackInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemTrackInternal(lua_State *L)
{
    AVPlayerItemTrackInternal(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVPlayerItemTrackAPIs[] = {
    {"AVPlayerItemTrackInternal", lua_AVPlayerItemTrackInternal},
    {"AVPlayerItemTrackInternal", lua_AVPlayerItemTrackInternal},
    {NULL, NULL},
};

int LuaOpenAVPlayerItemTrack(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVPlayerItemTrackAPIs);
    return 0;
}
