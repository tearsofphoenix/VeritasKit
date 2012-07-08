//
//  LuaAVAssetExportSession.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVAssetExportSession.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVAssetExportSessionInternal(lua_State *L)
{
    AVAssetExportSessionInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetExportSessionStatusUnknown(lua_State *L)
{
    AVAssetExportSessionStatusUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetExportSessionStatusWaiting(lua_State *L)
{
    AVAssetExportSessionStatusWaiting(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetExportSessionStatusExporting(lua_State *L)
{
    AVAssetExportSessionStatusExporting(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetExportSessionStatusCompleted(lua_State *L)
{
    AVAssetExportSessionStatusCompleted(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetExportSessionStatusFailed(lua_State *L)
{
    AVAssetExportSessionStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetExportSessionStatusCancelled(lua_State *L)
{
    AVAssetExportSessionStatusCancelled(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetExportSessionStatus(lua_State *L)
{
    AVAssetExportSessionStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetExportSessionInternal(lua_State *L)
{
    AVAssetExportSessionInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetExportSessionStatus(lua_State *L)
{
    AVAssetExportSessionStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetExportSessionStatusFailed(lua_State *L)
{
    AVAssetExportSessionStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVAssetExportSessionAPIs[] = {
    {"AVAssetExportSessionInternal", lua_AVAssetExportSessionInternal},
    {"AVAssetExportSessionStatusUnknown", lua_AVAssetExportSessionStatusUnknown},
    {"AVAssetExportSessionStatusWaiting", lua_AVAssetExportSessionStatusWaiting},
    {"AVAssetExportSessionStatusExporting", lua_AVAssetExportSessionStatusExporting},
    {"AVAssetExportSessionStatusCompleted", lua_AVAssetExportSessionStatusCompleted},
    {"AVAssetExportSessionStatusFailed", lua_AVAssetExportSessionStatusFailed},
    {"AVAssetExportSessionStatusCancelled", lua_AVAssetExportSessionStatusCancelled},
    {"AVAssetExportSessionStatus", lua_AVAssetExportSessionStatus},
    {"AVAssetExportSessionInternal", lua_AVAssetExportSessionInternal},
    {"AVAssetExportSessionStatus", lua_AVAssetExportSessionStatus},
    {"AVAssetExportSessionStatusFailed", lua_AVAssetExportSessionStatusFailed},
    {NULL, NULL},
};

int LuaOpenAVAssetExportSession(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVAssetExportSessionAPIs);
    return 0;
}
