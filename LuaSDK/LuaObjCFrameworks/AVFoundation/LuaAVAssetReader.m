//
//  LuaAVAssetReader.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVAssetReader.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVAssetReaderOutput(lua_State *L)
{
    AVAssetReaderOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderInternal(lua_State *L)
{
    AVAssetReaderInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatus(lua_State *L)
{
    AVAssetReaderStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatusUnknown(lua_State *L)
{
    AVAssetReaderStatusUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatusReading(lua_State *L)
{
    AVAssetReaderStatusReading(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatusCompleted(lua_State *L)
{
    AVAssetReaderStatusCompleted(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatusFailed(lua_State *L)
{
    AVAssetReaderStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatusCancelled(lua_State *L)
{
    AVAssetReaderStatusCancelled(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatusUnknown(lua_State *L)
{
    AVAssetReaderStatusUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatusReading(lua_State *L)
{
    AVAssetReaderStatusReading(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatusCompleted(lua_State *L)
{
    AVAssetReaderStatusCompleted(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatusFailed(lua_State *L)
{
    AVAssetReaderStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatusCancelled(lua_State *L)
{
    AVAssetReaderStatusCancelled(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatus(lua_State *L)
{
    AVAssetReaderStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderOutput(lua_State *L)
{
    AVAssetReaderOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderTrackOutput(lua_State *L)
{
    AVAssetReaderTrackOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderAudioMixOutput(lua_State *L)
{
    AVAssetReaderAudioMixOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderVideoCompositionOutput(lua_State *L)
{
    AVAssetReaderVideoCompositionOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderInternal(lua_State *L)
{
    AVAssetReaderInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatus(lua_State *L)
{
    AVAssetReaderStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderOutput(lua_State *L)
{
    AVAssetReaderOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderOutput(lua_State *L)
{
    AVAssetReaderOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatus(lua_State *L)
{
    AVAssetReaderStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatusFailed(lua_State *L)
{
    AVAssetReaderStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderStatusFailed(lua_State *L)
{
    AVAssetReaderStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderOutput(lua_State *L)
{
    AVAssetReaderOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderOutput(lua_State *L)
{
    AVAssetReaderOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderOutput(lua_State *L)
{
    AVAssetReaderOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderOutput(lua_State *L)
{
    AVAssetReaderOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderOutput(lua_State *L)
{
    AVAssetReaderOutput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetReaderOutput(lua_State *L)
{
    AVAssetReaderOutput(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVAssetReaderAPIs[] = {
    {"AVAssetReaderOutput", lua_AVAssetReaderOutput},
    {"AVAssetReaderInternal", lua_AVAssetReaderInternal},
    {"AVAssetReaderStatus", lua_AVAssetReaderStatus},
    {"AVAssetReaderStatusUnknown", lua_AVAssetReaderStatusUnknown},
    {"AVAssetReaderStatusReading", lua_AVAssetReaderStatusReading},
    {"AVAssetReaderStatusCompleted", lua_AVAssetReaderStatusCompleted},
    {"AVAssetReaderStatusFailed", lua_AVAssetReaderStatusFailed},
    {"AVAssetReaderStatusCancelled", lua_AVAssetReaderStatusCancelled},
    {"AVAssetReaderStatusUnknown", lua_AVAssetReaderStatusUnknown},
    {"AVAssetReaderStatusReading", lua_AVAssetReaderStatusReading},
    {"AVAssetReaderStatusCompleted", lua_AVAssetReaderStatusCompleted},
    {"AVAssetReaderStatusFailed", lua_AVAssetReaderStatusFailed},
    {"AVAssetReaderStatusCancelled", lua_AVAssetReaderStatusCancelled},
    {"AVAssetReaderStatus", lua_AVAssetReaderStatus},
    {"AVAssetReaderOutput", lua_AVAssetReaderOutput},
    {"AVAssetReaderTrackOutput", lua_AVAssetReaderTrackOutput},
    {"AVAssetReaderAudioMixOutput", lua_AVAssetReaderAudioMixOutput},
    {"AVAssetReaderVideoCompositionOutput", lua_AVAssetReaderVideoCompositionOutput},
    {"AVAssetReaderInternal", lua_AVAssetReaderInternal},
    {"AVAssetReaderStatus", lua_AVAssetReaderStatus},
    {"AVAssetReaderOutput", lua_AVAssetReaderOutput},
    {"AVAssetReaderOutput", lua_AVAssetReaderOutput},
    {"AVAssetReaderStatus", lua_AVAssetReaderStatus},
    {"AVAssetReaderStatusFailed", lua_AVAssetReaderStatusFailed},
    {"AVAssetReaderStatusFailed", lua_AVAssetReaderStatusFailed},
    {"AVAssetReaderOutput", lua_AVAssetReaderOutput},
    {"AVAssetReaderOutput", lua_AVAssetReaderOutput},
    {"AVAssetReaderOutput", lua_AVAssetReaderOutput},
    {"AVAssetReaderOutput", lua_AVAssetReaderOutput},
    {"AVAssetReaderOutput", lua_AVAssetReaderOutput},
    {"AVAssetReaderOutput", lua_AVAssetReaderOutput},
    {NULL, NULL},
};

int LuaOpenAVAssetReader(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVAssetReaderAPIs);
    return 0;
}
