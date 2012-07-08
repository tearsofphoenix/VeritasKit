//
//  LuaAVAssetWriter.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVAssetWriter.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVAssetWriterInput(lua_State *L)
{
    AVAssetWriterInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatus(lua_State *L)
{
    AVAssetWriterStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusUnknown(lua_State *L)
{
    AVAssetWriterStatusUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusWriting(lua_State *L)
{
    AVAssetWriterStatusWriting(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusCompleted(lua_State *L)
{
    AVAssetWriterStatusCompleted(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusFailed(lua_State *L)
{
    AVAssetWriterStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusCancelled(lua_State *L)
{
    AVAssetWriterStatusCancelled(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusUnknown(lua_State *L)
{
    AVAssetWriterStatusUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusWriting(lua_State *L)
{
    AVAssetWriterStatusWriting(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusCompleted(lua_State *L)
{
    AVAssetWriterStatusCompleted(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusFailed(lua_State *L)
{
    AVAssetWriterStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusCancelled(lua_State *L)
{
    AVAssetWriterStatusCancelled(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatus(lua_State *L)
{
    AVAssetWriterStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterInternal(lua_State *L)
{
    AVAssetWriterInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterInternal(lua_State *L)
{
    AVAssetWriterInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatus(lua_State *L)
{
    AVAssetWriterStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterInput(lua_State *L)
{
    AVAssetWriterInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatus(lua_State *L)
{
    AVAssetWriterStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusFailed(lua_State *L)
{
    AVAssetWriterStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusFailed(lua_State *L)
{
    AVAssetWriterStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterInput(lua_State *L)
{
    AVAssetWriterInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterInput(lua_State *L)
{
    AVAssetWriterInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterInput(lua_State *L)
{
    AVAssetWriterInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterInput(lua_State *L)
{
    AVAssetWriterInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterInput(lua_State *L)
{
    AVAssetWriterInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusWriting(lua_State *L)
{
    AVAssetWriterStatusWriting(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterStatusFailed(lua_State *L)
{
    AVAssetWriterStatusFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterInput(lua_State *L)
{
    AVAssetWriterInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterInputPixelBufferAdaptor(lua_State *L)
{
    AVAssetWriterInputPixelBufferAdaptor(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterInput(lua_State *L)
{
    AVAssetWriterInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterInputPixelBufferAdaptor(lua_State *L)
{
    AVAssetWriterInputPixelBufferAdaptor(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetWriterFileTypeSpecificProperties(lua_State *L)
{
    AVAssetWriterFileTypeSpecificProperties(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVAssetWriterAPIs[] = {
    {"AVAssetWriterInput", lua_AVAssetWriterInput},
    {"AVAssetWriterStatus", lua_AVAssetWriterStatus},
    {"AVAssetWriterStatusUnknown", lua_AVAssetWriterStatusUnknown},
    {"AVAssetWriterStatusWriting", lua_AVAssetWriterStatusWriting},
    {"AVAssetWriterStatusCompleted", lua_AVAssetWriterStatusCompleted},
    {"AVAssetWriterStatusFailed", lua_AVAssetWriterStatusFailed},
    {"AVAssetWriterStatusCancelled", lua_AVAssetWriterStatusCancelled},
    {"AVAssetWriterStatusUnknown", lua_AVAssetWriterStatusUnknown},
    {"AVAssetWriterStatusWriting", lua_AVAssetWriterStatusWriting},
    {"AVAssetWriterStatusCompleted", lua_AVAssetWriterStatusCompleted},
    {"AVAssetWriterStatusFailed", lua_AVAssetWriterStatusFailed},
    {"AVAssetWriterStatusCancelled", lua_AVAssetWriterStatusCancelled},
    {"AVAssetWriterStatus", lua_AVAssetWriterStatus},
    {"AVAssetWriterInternal", lua_AVAssetWriterInternal},
    {"AVAssetWriterInternal", lua_AVAssetWriterInternal},
    {"AVAssetWriterStatus", lua_AVAssetWriterStatus},
    {"AVAssetWriterInput", lua_AVAssetWriterInput},
    {"AVAssetWriterStatus", lua_AVAssetWriterStatus},
    {"AVAssetWriterStatusFailed", lua_AVAssetWriterStatusFailed},
    {"AVAssetWriterStatusFailed", lua_AVAssetWriterStatusFailed},
    {"AVAssetWriterInput", lua_AVAssetWriterInput},
    {"AVAssetWriterInput", lua_AVAssetWriterInput},
    {"AVAssetWriterInput", lua_AVAssetWriterInput},
    {"AVAssetWriterInput", lua_AVAssetWriterInput},
    {"AVAssetWriterInput", lua_AVAssetWriterInput},
    {"AVAssetWriterStatusWriting", lua_AVAssetWriterStatusWriting},
    {"AVAssetWriterStatusFailed", lua_AVAssetWriterStatusFailed},
    {"AVAssetWriterInput", lua_AVAssetWriterInput},
    {"AVAssetWriterInputPixelBufferAdaptor", lua_AVAssetWriterInputPixelBufferAdaptor},
    {"AVAssetWriterInput", lua_AVAssetWriterInput},
    {"AVAssetWriterInputPixelBufferAdaptor", lua_AVAssetWriterInputPixelBufferAdaptor},
    {"AVAssetWriterFileTypeSpecificProperties", lua_AVAssetWriterFileTypeSpecificProperties},
    {NULL, NULL},
};

int LuaOpenAVAssetWriter(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVAssetWriterAPIs);
    return 0;
}
