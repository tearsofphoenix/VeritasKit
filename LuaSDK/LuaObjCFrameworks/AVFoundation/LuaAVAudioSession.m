//
//  LuaAVAudioSession.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVAudioSession.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVAudioSessionDelegate(lua_State *L)
{
    AVAudioSessionDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionCategoryAmbient(lua_State *L)
{
    AVAudioSessionCategoryAmbient(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionCategorySoloAmbient(lua_State *L)
{
    AVAudioSessionCategorySoloAmbient(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionCategoryPlayback(lua_State *L)
{
    AVAudioSessionCategoryPlayback(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionCategoryRecord(lua_State *L)
{
    AVAudioSessionCategoryRecord(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionCategoryPlayAndRecord(lua_State *L)
{
    AVAudioSessionCategoryPlayAndRecord(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionCategoryAudioProcessing(lua_State *L)
{
    AVAudioSessionCategoryAudioProcessing(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionModeDefault(lua_State *L)
{
    AVAudioSessionModeDefault(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionModeVoiceChat(lua_State *L)
{
    AVAudioSessionModeVoiceChat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionModeGameChat(lua_State *L)
{
    AVAudioSessionModeGameChat(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionModeVideoRecording(lua_State *L)
{
    AVAudioSessionModeVideoRecording(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionModeMeasurement(lua_State *L)
{
    AVAudioSessionModeMeasurement(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionInterruptionFlags_ShouldResume(lua_State *L)
{
    AVAudioSessionInterruptionFlags_ShouldResume(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionSetActiveFlags_NotifyOthersOnDeactivation(lua_State *L)
{
    AVAudioSessionSetActiveFlags_NotifyOthersOnDeactivation(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionDelegate(lua_State *L)
{
    AVAudioSessionDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionDelegate(lua_State *L)
{
    AVAudioSessionDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAudioSessionInterruptionFlags_ShouldResume(lua_State *L)
{
    AVAudioSessionInterruptionFlags_ShouldResume(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVAudioSessionAPIs[] = {
    {"AVAudioSessionDelegate", lua_AVAudioSessionDelegate},
    {"AVAudioSessionCategoryAmbient", lua_AVAudioSessionCategoryAmbient},
    {"AVAudioSessionCategorySoloAmbient", lua_AVAudioSessionCategorySoloAmbient},
    {"AVAudioSessionCategoryPlayback", lua_AVAudioSessionCategoryPlayback},
    {"AVAudioSessionCategoryRecord", lua_AVAudioSessionCategoryRecord},
    {"AVAudioSessionCategoryPlayAndRecord", lua_AVAudioSessionCategoryPlayAndRecord},
    {"AVAudioSessionCategoryAudioProcessing", lua_AVAudioSessionCategoryAudioProcessing},
    {"AVAudioSessionModeDefault", lua_AVAudioSessionModeDefault},
    {"AVAudioSessionModeVoiceChat", lua_AVAudioSessionModeVoiceChat},
    {"AVAudioSessionModeGameChat", lua_AVAudioSessionModeGameChat},
    {"AVAudioSessionModeVideoRecording", lua_AVAudioSessionModeVideoRecording},
    {"AVAudioSessionModeMeasurement", lua_AVAudioSessionModeMeasurement},
    {"AVAudioSessionInterruptionFlags_ShouldResume", lua_AVAudioSessionInterruptionFlags_ShouldResume},
    {"AVAudioSessionSetActiveFlags_NotifyOthersOnDeactivation", lua_AVAudioSessionSetActiveFlags_NotifyOthersOnDeactivation},
    {"AVAudioSessionDelegate", lua_AVAudioSessionDelegate},
    {"AVAudioSessionDelegate", lua_AVAudioSessionDelegate},
    {"AVAudioSessionInterruptionFlags_ShouldResume", lua_AVAudioSessionInterruptionFlags_ShouldResume},
    {NULL, NULL},
};

int LuaOpenAVAudioSession(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVAudioSessionAPIs);
    return 0;
}
