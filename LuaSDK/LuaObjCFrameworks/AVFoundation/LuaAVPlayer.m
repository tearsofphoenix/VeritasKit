//
//  LuaAVPlayer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVPlayer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVPlayerLayer(lua_State *L)
{
    AVPlayerLayer(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerInternal(lua_State *L)
{
    AVPlayerInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerStatus(lua_State *L)
{
    AVPlayerStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerStatusUnknown(lua_State *L)
{
    AVPlayerStatusUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerStatusReadyToPlay(lua_State *L)
{
    AVPlayerStatusReadyToPlay(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerStatusFailed(lua_State *L)
{
    AVPlayerStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerStatusUnknown(lua_State *L)
{
    AVPlayerStatusUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerStatusReadyToPlay(lua_State *L)
{
    AVPlayerStatusReadyToPlay(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerStatusFailed(lua_State *L)
{
    AVPlayerStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerStatus(lua_State *L)
{
    AVPlayerStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerInternal(lua_State *L)
{
    AVPlayerInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerStatus(lua_State *L)
{
    AVPlayerStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerStatusFailed(lua_State *L)
{
    AVPlayerStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerStatus(lua_State *L)
{
    AVPlayerStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerStatusFailed(lua_State *L)
{
    AVPlayerStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatusFailed(lua_State *L)
{
    AVPlayerItemStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerPlaybackControl(lua_State *L)
{
    AVPlayerPlaybackControl(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemControl(lua_State *L)
{
    AVPlayerItemControl(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerActionAtItemEnd(lua_State *L)
{
    AVPlayerActionAtItemEnd(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerActionAtItemEndAdvance(lua_State *L)
{
    AVPlayerActionAtItemEndAdvance(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerActionAtItemEndAdvance(lua_State *L)
{
    AVPlayerActionAtItemEndAdvance(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerActionAtItemEndPause(lua_State *L)
{
    AVPlayerActionAtItemEndPause(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerActionAtItemEndNone(lua_State *L)
{
    AVPlayerActionAtItemEndNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerActionAtItemEndNone(lua_State *L)
{
    AVPlayerActionAtItemEndNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerActionAtItemEndAdvance(lua_State *L)
{
    AVPlayerActionAtItemEndAdvance(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerActionAtItemEndPause(lua_State *L)
{
    AVPlayerActionAtItemEndPause(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerActionAtItemEndNone(lua_State *L)
{
    AVPlayerActionAtItemEndNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerActionAtItemEnd(lua_State *L)
{
    AVPlayerActionAtItemEnd(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerActionAtItemEnd(lua_State *L)
{
    AVPlayerActionAtItemEnd(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerTimeControl(lua_State *L)
{
    AVPlayerTimeControl(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerTimeObservation(lua_State *L)
{
    AVPlayerTimeObservation(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerMediaControl(lua_State *L)
{
    AVPlayerMediaControl(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerAirPlaySupport(lua_State *L)
{
    AVPlayerAirPlaySupport(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItems(lua_State *L)
{
    AVPlayerItems(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItems(lua_State *L)
{
    AVPlayerItems(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItems(lua_State *L)
{
    AVPlayerItems(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItems(lua_State *L)
{
    AVPlayerItems(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItems(lua_State *L)
{
    AVPlayerItems(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItems(lua_State *L)
{
    AVPlayerItems(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItem(lua_State *L)
{
    AVPlayerItem(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVPlayerAPIs[] = {
    {"AVPlayerLayer", lua_AVPlayerLayer},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerInternal", lua_AVPlayerInternal},
    {"AVPlayerStatus", lua_AVPlayerStatus},
    {"AVPlayerStatusUnknown", lua_AVPlayerStatusUnknown},
    {"AVPlayerStatusReadyToPlay", lua_AVPlayerStatusReadyToPlay},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerStatusFailed", lua_AVPlayerStatusFailed},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerStatusUnknown", lua_AVPlayerStatusUnknown},
    {"AVPlayerStatusReadyToPlay", lua_AVPlayerStatusReadyToPlay},
    {"AVPlayerStatusFailed", lua_AVPlayerStatusFailed},
    {"AVPlayerStatus", lua_AVPlayerStatus},
    {"AVPlayerInternal", lua_AVPlayerInternal},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerStatus", lua_AVPlayerStatus},
    {"AVPlayerStatusFailed", lua_AVPlayerStatusFailed},
    {"AVPlayerStatus", lua_AVPlayerStatus},
    {"AVPlayerStatusFailed", lua_AVPlayerStatusFailed},
    {"AVPlayerItemStatusFailed", lua_AVPlayerItemStatusFailed},
    {"AVPlayerPlaybackControl", lua_AVPlayerPlaybackControl},
    {"AVPlayerItemControl", lua_AVPlayerItemControl},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerActionAtItemEnd", lua_AVPlayerActionAtItemEnd},
    {"AVPlayerActionAtItemEndAdvance", lua_AVPlayerActionAtItemEndAdvance},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerActionAtItemEndAdvance", lua_AVPlayerActionAtItemEndAdvance},
    {"AVPlayerActionAtItemEndPause", lua_AVPlayerActionAtItemEndPause},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerActionAtItemEndNone", lua_AVPlayerActionAtItemEndNone},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerActionAtItemEndNone", lua_AVPlayerActionAtItemEndNone},
    {"AVPlayerActionAtItemEndAdvance", lua_AVPlayerActionAtItemEndAdvance},
    {"AVPlayerActionAtItemEndPause", lua_AVPlayerActionAtItemEndPause},
    {"AVPlayerActionAtItemEndNone", lua_AVPlayerActionAtItemEndNone},
    {"AVPlayerActionAtItemEnd", lua_AVPlayerActionAtItemEnd},
    {"AVPlayerActionAtItemEnd", lua_AVPlayerActionAtItemEnd},
    {"AVPlayerTimeControl", lua_AVPlayerTimeControl},
    {"AVPlayerTimeObservation", lua_AVPlayerTimeObservation},
    {"AVPlayerMediaControl", lua_AVPlayerMediaControl},
    {"AVPlayerAirPlaySupport", lua_AVPlayerAirPlaySupport},
    {"AVPlayerItems", lua_AVPlayerItems},
    {"AVPlayerItems", lua_AVPlayerItems},
    {"AVPlayerItems", lua_AVPlayerItems},
    {"AVPlayerItems", lua_AVPlayerItems},
    {"AVPlayerItems", lua_AVPlayerItems},
    {"AVPlayerItems", lua_AVPlayerItems},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {"AVPlayerItem", lua_AVPlayerItem},
    {NULL, NULL},
};

int LuaOpenAVPlayer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVPlayerAPIs);
    return 0;
}
