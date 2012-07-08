//
//  LuaAVPlayerItem.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVPlayerItem.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVPlayerItemTimeJumpedNotification(lua_State *L)
{
    AVPlayerItemTimeJumpedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemDidPlayToEndTimeNotification(lua_State *L)
{
    AVPlayerItemDidPlayToEndTimeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemFailedToPlayToEndTimeNotification(lua_State *L)
{
    AVPlayerItemFailedToPlayToEndTimeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemFailedToPlayToEndTimeErrorKey(lua_State *L)
{
    AVPlayerItemFailedToPlayToEndTimeErrorKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatus(lua_State *L)
{
    AVPlayerItemStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatusUnknown(lua_State *L)
{
    AVPlayerItemStatusUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatusReadyToPlay(lua_State *L)
{
    AVPlayerItemStatusReadyToPlay(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatusFailed(lua_State *L)
{
    AVPlayerItemStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatusUnknown(lua_State *L)
{
    AVPlayerItemStatusUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatusReadyToPlay(lua_State *L)
{
    AVPlayerItemStatusReadyToPlay(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatusFailed(lua_State *L)
{
    AVPlayerItemStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatus(lua_State *L)
{
    AVPlayerItemStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemInternal(lua_State *L)
{
    AVPlayerItemInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemInternal(lua_State *L)
{
    AVPlayerItemInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatus(lua_State *L)
{
    AVPlayerItemStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatusFailed(lua_State *L)
{
    AVPlayerItemStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatus(lua_State *L)
{
    AVPlayerItemStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatusFailed(lua_State *L)
{
    AVPlayerItemStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemStatusFailed(lua_State *L)
{
    AVPlayerItemStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemInspection(lua_State *L)
{
    AVPlayerItemInspection(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemTimeControl(lua_State *L)
{
    AVPlayerItemTimeControl(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemDidPlayToEndTimeNotification(lua_State *L)
{
    AVPlayerItemDidPlayToEndTimeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemDidPlayToEndTimeNotification(lua_State *L)
{
    AVPlayerItemDidPlayToEndTimeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemTracks(lua_State *L)
{
    AVPlayerItemTracks(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemPresentation(lua_State *L)
{
    AVPlayerItemPresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemPlayability(lua_State *L)
{
    AVPlayerItemPlayability(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemMediaSelection(lua_State *L)
{
    AVPlayerItemMediaSelection(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLog(lua_State *L)
{
    AVPlayerItemAccessLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLog(lua_State *L)
{
    AVPlayerItemErrorLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLogInternal(lua_State *L)
{
    AVPlayerItemAccessLogInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLogInternal(lua_State *L)
{
    AVPlayerItemErrorLogInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLogEventInternal(lua_State *L)
{
    AVPlayerItemAccessLogEventInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLogEventInternal(lua_State *L)
{
    AVPlayerItemErrorLogEventInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemLogging(lua_State *L)
{
    AVPlayerItemLogging(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLog(lua_State *L)
{
    AVPlayerItemAccessLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLog(lua_State *L)
{
    AVPlayerItemAccessLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLog(lua_State *L)
{
    AVPlayerItemAccessLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLog(lua_State *L)
{
    AVPlayerItemErrorLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLog(lua_State *L)
{
    AVPlayerItemErrorLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLog(lua_State *L)
{
    AVPlayerItemErrorLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLog(lua_State *L)
{
    AVPlayerItemAccessLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLog(lua_State *L)
{
    AVPlayerItemAccessLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLog(lua_State *L)
{
    AVPlayerItemAccessLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLogEvent(lua_State *L)
{
    AVPlayerItemAccessLogEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLog(lua_State *L)
{
    AVPlayerItemAccessLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLogInternal(lua_State *L)
{
    AVPlayerItemAccessLogInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLog(lua_State *L)
{
    AVPlayerItemAccessLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLogEvent(lua_State *L)
{
    AVPlayerItemAccessLogEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLogEvent(lua_State *L)
{
    AVPlayerItemAccessLogEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLog(lua_State *L)
{
    AVPlayerItemErrorLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLog(lua_State *L)
{
    AVPlayerItemErrorLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLog(lua_State *L)
{
    AVPlayerItemErrorLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLog(lua_State *L)
{
    AVPlayerItemErrorLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLogInternal(lua_State *L)
{
    AVPlayerItemErrorLogInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLog(lua_State *L)
{
    AVPlayerItemErrorLog(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLogEvent(lua_State *L)
{
    AVPlayerItemErrorLogEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLogEvent(lua_State *L)
{
    AVPlayerItemErrorLogEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLogEvent(lua_State *L)
{
    AVPlayerItemAccessLogEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLogEvent(lua_State *L)
{
    AVPlayerItemAccessLogEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLogEvent(lua_State *L)
{
    AVPlayerItemAccessLogEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLogEvent(lua_State *L)
{
    AVPlayerItemAccessLogEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemAccessLogEventInternal(lua_State *L)
{
    AVPlayerItemAccessLogEventInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLogEvent(lua_State *L)
{
    AVPlayerItemErrorLogEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLogEvent(lua_State *L)
{
    AVPlayerItemErrorLogEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLogEvent(lua_State *L)
{
    AVPlayerItemErrorLogEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLogEvent(lua_State *L)
{
    AVPlayerItemErrorLogEvent(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerItemErrorLogEventInternal(lua_State *L)
{
    AVPlayerItemErrorLogEventInternal(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVPlayerItemAPIs[] = {
    {"AVPlayerItemTimeJumpedNotification", lua_AVPlayerItemTimeJumpedNotification},
    {"AVPlayerItemDidPlayToEndTimeNotification", lua_AVPlayerItemDidPlayToEndTimeNotification},
    {"AVPlayerItemFailedToPlayToEndTimeNotification", lua_AVPlayerItemFailedToPlayToEndTimeNotification},
    {"AVPlayerItemFailedToPlayToEndTimeErrorKey", lua_AVPlayerItemFailedToPlayToEndTimeErrorKey},
    {"AVPlayerItemStatus", lua_AVPlayerItemStatus},
    {"AVPlayerItemStatusUnknown", lua_AVPlayerItemStatusUnknown},
    {"AVPlayerItemStatusReadyToPlay", lua_AVPlayerItemStatusReadyToPlay},
    {"AVPlayerItemStatusFailed", lua_AVPlayerItemStatusFailed},
    {"AVPlayerItemStatusUnknown", lua_AVPlayerItemStatusUnknown},
    {"AVPlayerItemStatusReadyToPlay", lua_AVPlayerItemStatusReadyToPlay},
    {"AVPlayerItemStatusFailed", lua_AVPlayerItemStatusFailed},
    {"AVPlayerItemStatus", lua_AVPlayerItemStatus},
    {"AVPlayerItemInternal", lua_AVPlayerItemInternal},
    {"AVPlayerItemInternal", lua_AVPlayerItemInternal},
    {"AVPlayerItemStatus", lua_AVPlayerItemStatus},
    {"AVPlayerItemStatusFailed", lua_AVPlayerItemStatusFailed},
    {"AVPlayerItemStatus", lua_AVPlayerItemStatus},
    {"AVPlayerItemStatusFailed", lua_AVPlayerItemStatusFailed},
    {"AVPlayerItemStatusFailed", lua_AVPlayerItemStatusFailed},
    {"AVPlayerItemInspection", lua_AVPlayerItemInspection},
    {"AVPlayerItemTimeControl", lua_AVPlayerItemTimeControl},
    {"AVPlayerItemDidPlayToEndTimeNotification", lua_AVPlayerItemDidPlayToEndTimeNotification},
    {"AVPlayerItemDidPlayToEndTimeNotification", lua_AVPlayerItemDidPlayToEndTimeNotification},
    {"AVPlayerItemTracks", lua_AVPlayerItemTracks},
    {"AVPlayerItemPresentation", lua_AVPlayerItemPresentation},
    {"AVPlayerItemPlayability", lua_AVPlayerItemPlayability},
    {"AVPlayerItemMediaSelection", lua_AVPlayerItemMediaSelection},
    {"AVPlayerItemAccessLog", lua_AVPlayerItemAccessLog},
    {"AVPlayerItemErrorLog", lua_AVPlayerItemErrorLog},
    {"AVPlayerItemAccessLogInternal", lua_AVPlayerItemAccessLogInternal},
    {"AVPlayerItemErrorLogInternal", lua_AVPlayerItemErrorLogInternal},
    {"AVPlayerItemAccessLogEventInternal", lua_AVPlayerItemAccessLogEventInternal},
    {"AVPlayerItemErrorLogEventInternal", lua_AVPlayerItemErrorLogEventInternal},
    {"AVPlayerItemLogging", lua_AVPlayerItemLogging},
    {"AVPlayerItemAccessLog", lua_AVPlayerItemAccessLog},
    {"AVPlayerItemAccessLog", lua_AVPlayerItemAccessLog},
    {"AVPlayerItemAccessLog", lua_AVPlayerItemAccessLog},
    {"AVPlayerItemErrorLog", lua_AVPlayerItemErrorLog},
    {"AVPlayerItemErrorLog", lua_AVPlayerItemErrorLog},
    {"AVPlayerItemErrorLog", lua_AVPlayerItemErrorLog},
    {"AVPlayerItemAccessLog", lua_AVPlayerItemAccessLog},
    {"AVPlayerItemAccessLog", lua_AVPlayerItemAccessLog},
    {"AVPlayerItemAccessLog", lua_AVPlayerItemAccessLog},
    {"AVPlayerItemAccessLogEvent", lua_AVPlayerItemAccessLogEvent},
    {"AVPlayerItemAccessLog", lua_AVPlayerItemAccessLog},
    {"AVPlayerItemAccessLogInternal", lua_AVPlayerItemAccessLogInternal},
    {"AVPlayerItemAccessLog", lua_AVPlayerItemAccessLog},
    {"AVPlayerItemAccessLogEvent", lua_AVPlayerItemAccessLogEvent},
    {"AVPlayerItemAccessLogEvent", lua_AVPlayerItemAccessLogEvent},
    {"AVPlayerItemErrorLog", lua_AVPlayerItemErrorLog},
    {"AVPlayerItemErrorLog", lua_AVPlayerItemErrorLog},
    {"AVPlayerItemErrorLog", lua_AVPlayerItemErrorLog},
    {"AVPlayerItemErrorLog", lua_AVPlayerItemErrorLog},
    {"AVPlayerItemErrorLogInternal", lua_AVPlayerItemErrorLogInternal},
    {"AVPlayerItemErrorLog", lua_AVPlayerItemErrorLog},
    {"AVPlayerItemErrorLogEvent", lua_AVPlayerItemErrorLogEvent},
    {"AVPlayerItemErrorLogEvent", lua_AVPlayerItemErrorLogEvent},
    {"AVPlayerItemAccessLogEvent", lua_AVPlayerItemAccessLogEvent},
    {"AVPlayerItemAccessLogEvent", lua_AVPlayerItemAccessLogEvent},
    {"AVPlayerItemAccessLogEvent", lua_AVPlayerItemAccessLogEvent},
    {"AVPlayerItemAccessLogEvent", lua_AVPlayerItemAccessLogEvent},
    {"AVPlayerItemAccessLogEventInternal", lua_AVPlayerItemAccessLogEventInternal},
    {"AVPlayerItemErrorLogEvent", lua_AVPlayerItemErrorLogEvent},
    {"AVPlayerItemErrorLogEvent", lua_AVPlayerItemErrorLogEvent},
    {"AVPlayerItemErrorLogEvent", lua_AVPlayerItemErrorLogEvent},
    {"AVPlayerItemErrorLogEvent", lua_AVPlayerItemErrorLogEvent},
    {"AVPlayerItemErrorLogEventInternal", lua_AVPlayerItemErrorLogEventInternal},
    {NULL, NULL},
};

int LuaOpenAVPlayerItem(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVPlayerItemAPIs);
    return 0;
}
