//
//  LuaGKVoiceChat.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKVoiceChat.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKVoiceChatPlayerConnected(lua_State *L)
{
    GKVoiceChatPlayerConnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKVoiceChatPlayerDisconnected(lua_State *L)
{
    GKVoiceChatPlayerDisconnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKVoiceChatPlayerSpeaking(lua_State *L)
{
    GKVoiceChatPlayerSpeaking(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKVoiceChatPlayerSilent(lua_State *L)
{
    GKVoiceChatPlayerSilent(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKVoiceChatPlayerState(lua_State *L)
{
    GKVoiceChatPlayerState(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKVoiceChatPlayerState(lua_State *L)
{
    GKVoiceChatPlayerState(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKVoiceChatAPIs[] = {
    {"GKVoiceChatPlayerConnected", lua_GKVoiceChatPlayerConnected},
    {"GKVoiceChatPlayerDisconnected", lua_GKVoiceChatPlayerDisconnected},
    {"GKVoiceChatPlayerSpeaking", lua_GKVoiceChatPlayerSpeaking},
    {"GKVoiceChatPlayerSilent", lua_GKVoiceChatPlayerSilent},
    {"GKVoiceChatPlayerState", lua_GKVoiceChatPlayerState},
    {"GKVoiceChatPlayerState", lua_GKVoiceChatPlayerState},
    {NULL, NULL},
};

int LuaOpenGKVoiceChat(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKVoiceChatAPIs);
    return 0;
}
