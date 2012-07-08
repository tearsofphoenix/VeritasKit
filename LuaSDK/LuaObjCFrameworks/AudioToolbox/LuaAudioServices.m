//
//  LuaAudioServices.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAudioServices.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AudioServices_h__(lua_State *L)
{
    AudioServices_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServices_h__(lua_State *L)
{
    AudioServices_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesNoError(lua_State *L)
{
    AudioServicesNoError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesUnsupportedPropertyError(lua_State *L)
{
    AudioServicesUnsupportedPropertyError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesBadPropertySizeError(lua_State *L)
{
    AudioServicesBadPropertySizeError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesBadSpecifierSizeError(lua_State *L)
{
    AudioServicesBadSpecifierSizeError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesSystemSoundUnspecifiedError(lua_State *L)
{
    AudioServicesSystemSoundUnspecifiedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesSystemSoundClientTimedOutError(lua_State *L)
{
    AudioServicesSystemSoundClientTimedOutError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesNoError(lua_State *L)
{
    AudioServicesNoError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesUnsupportedPropertyError(lua_State *L)
{
    AudioServicesUnsupportedPropertyError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesBadPropertySizeError(lua_State *L)
{
    AudioServicesBadPropertySizeError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesBadSpecifierSizeError(lua_State *L)
{
    AudioServicesBadSpecifierSizeError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesSystemSoundUnspecifiedError(lua_State *L)
{
    AudioServicesSystemSoundUnspecifiedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesSystemSoundClientTimedOutError(lua_State *L)
{
    AudioServicesSystemSoundClientTimedOutError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPropertyID(lua_State *L)
{
    AudioServicesPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPropertyID(lua_State *L)
{
    AudioServicesPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesSystemSoundCompletionProc(lua_State *L)
{
    AudioServicesSystemSoundCompletionProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesSystemSoundCompletionProc(lua_State *L)
{
    AudioServicesSystemSoundCompletionProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesSystemSoundCompletionProc(lua_State *L)
{
    AudioServicesSystemSoundCompletionProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPropertyIsUISound(lua_State *L)
{
    AudioServicesPropertyIsUISound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPlaySystemSound(lua_State *L)
{
    AudioServicesPlaySystemSound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPropertyCompletePlaybackIfAppDies(lua_State *L)
{
    AudioServicesPropertyCompletePlaybackIfAppDies(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPropertyIsUISound(lua_State *L)
{
    AudioServicesPropertyIsUISound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPropertyCompletePlaybackIfAppDies(lua_State *L)
{
    AudioServicesPropertyCompletePlaybackIfAppDies(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPlayAlertSound(lua_State *L)
{
    AudioServicesPlayAlertSound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPlayAlertSound(lua_State *L)
{
    AudioServicesPlayAlertSound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPlaySystemSound(lua_State *L)
{
    AudioServicesPlaySystemSound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPlaySystemSound(lua_State *L)
{
    AudioServicesPlaySystemSound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesCreateSystemSoundID(lua_State *L)
{
    AudioServicesCreateSystemSoundID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPlayAlertSound(lua_State *L)
{
    AudioServicesPlayAlertSound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesCreateSystemSoundID(lua_State *L)
{
    AudioServicesCreateSystemSoundID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesDisposeSystemSoundID(lua_State *L)
{
    AudioServicesDisposeSystemSoundID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesDisposeSystemSoundID(lua_State *L)
{
    AudioServicesDisposeSystemSoundID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesAddSystemSoundCompletion(lua_State *L)
{
    AudioServicesAddSystemSoundCompletion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesSystemSoundCompletionProc(lua_State *L)
{
    AudioServicesSystemSoundCompletionProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesAddSystemSoundCompletion(lua_State *L)
{
    AudioServicesAddSystemSoundCompletion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesSystemSoundCompletionProc(lua_State *L)
{
    AudioServicesSystemSoundCompletionProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesRemoveSystemSoundCompletion(lua_State *L)
{
    AudioServicesRemoveSystemSoundCompletion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesRemoveSystemSoundCompletion(lua_State *L)
{
    AudioServicesRemoveSystemSoundCompletion(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesGetPropertyInfo(lua_State *L)
{
    AudioServicesGetPropertyInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPropertyID(lua_State *L)
{
    AudioServicesPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesNoError(lua_State *L)
{
    AudioServicesNoError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesGetPropertyInfo(lua_State *L)
{
    AudioServicesGetPropertyInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesGetProperty(lua_State *L)
{
    AudioServicesGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPropertyID(lua_State *L)
{
    AudioServicesPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesNoError(lua_State *L)
{
    AudioServicesNoError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesGetProperty(lua_State *L)
{
    AudioServicesGetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesSetProperty(lua_State *L)
{
    AudioServicesSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesPropertyID(lua_State *L)
{
    AudioServicesPropertyID(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesNoError(lua_State *L)
{
    AudioServicesNoError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesSetProperty(lua_State *L)
{
    AudioServicesSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServicesNoHardwareError(lua_State *L)
{
    AudioServicesNoHardwareError(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioServices_h__(lua_State *L)
{
    AudioServices_h__(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAudioServicesAPIs[] = {
    {"AudioServices_h__", lua_AudioServices_h__},
    {"AudioServices_h__", lua_AudioServices_h__},
    {"AudioServicesNoError", lua_AudioServicesNoError},
    {"AudioServicesUnsupportedPropertyError", lua_AudioServicesUnsupportedPropertyError},
    {"AudioServicesBadPropertySizeError", lua_AudioServicesBadPropertySizeError},
    {"AudioServicesBadSpecifierSizeError", lua_AudioServicesBadSpecifierSizeError},
    {"AudioServicesSystemSoundUnspecifiedError", lua_AudioServicesSystemSoundUnspecifiedError},
    {"AudioServicesSystemSoundClientTimedOutError", lua_AudioServicesSystemSoundClientTimedOutError},
    {"AudioServicesNoError", lua_AudioServicesNoError},
    {"AudioServicesUnsupportedPropertyError", lua_AudioServicesUnsupportedPropertyError},
    {"AudioServicesBadPropertySizeError", lua_AudioServicesBadPropertySizeError},
    {"AudioServicesBadSpecifierSizeError", lua_AudioServicesBadSpecifierSizeError},
    {"AudioServicesSystemSoundUnspecifiedError", lua_AudioServicesSystemSoundUnspecifiedError},
    {"AudioServicesSystemSoundClientTimedOutError", lua_AudioServicesSystemSoundClientTimedOutError},
    {"AudioServicesPropertyID", lua_AudioServicesPropertyID},
    {"AudioServicesPropertyID", lua_AudioServicesPropertyID},
    {"AudioServicesSystemSoundCompletionProc", lua_AudioServicesSystemSoundCompletionProc},
    {"AudioServicesSystemSoundCompletionProc", lua_AudioServicesSystemSoundCompletionProc},
    {"AudioServicesSystemSoundCompletionProc", lua_AudioServicesSystemSoundCompletionProc},
    {"AudioServicesPropertyIsUISound", lua_AudioServicesPropertyIsUISound},
    {"AudioServicesPlaySystemSound", lua_AudioServicesPlaySystemSound},
    {"AudioServicesPropertyCompletePlaybackIfAppDies", lua_AudioServicesPropertyCompletePlaybackIfAppDies},
    {"AudioServicesPropertyIsUISound", lua_AudioServicesPropertyIsUISound},
    {"AudioServicesPropertyCompletePlaybackIfAppDies", lua_AudioServicesPropertyCompletePlaybackIfAppDies},
    {"AudioServicesPlayAlertSound", lua_AudioServicesPlayAlertSound},
    {"AudioServicesPlayAlertSound", lua_AudioServicesPlayAlertSound},
    {"AudioServicesPlaySystemSound", lua_AudioServicesPlaySystemSound},
    {"AudioServicesPlaySystemSound", lua_AudioServicesPlaySystemSound},
    {"AudioServicesCreateSystemSoundID", lua_AudioServicesCreateSystemSoundID},
    {"AudioServicesPlayAlertSound", lua_AudioServicesPlayAlertSound},
    {"AudioServicesCreateSystemSoundID", lua_AudioServicesCreateSystemSoundID},
    {"AudioServicesDisposeSystemSoundID", lua_AudioServicesDisposeSystemSoundID},
    {"AudioServicesDisposeSystemSoundID", lua_AudioServicesDisposeSystemSoundID},
    {"AudioServicesAddSystemSoundCompletion", lua_AudioServicesAddSystemSoundCompletion},
    {"AudioServicesSystemSoundCompletionProc", lua_AudioServicesSystemSoundCompletionProc},
    {"AudioServicesAddSystemSoundCompletion", lua_AudioServicesAddSystemSoundCompletion},
    {"AudioServicesSystemSoundCompletionProc", lua_AudioServicesSystemSoundCompletionProc},
    {"AudioServicesRemoveSystemSoundCompletion", lua_AudioServicesRemoveSystemSoundCompletion},
    {"AudioServicesRemoveSystemSoundCompletion", lua_AudioServicesRemoveSystemSoundCompletion},
    {"AudioServicesGetPropertyInfo", lua_AudioServicesGetPropertyInfo},
    {"AudioServicesPropertyID", lua_AudioServicesPropertyID},
    {"AudioServicesNoError", lua_AudioServicesNoError},
    {"AudioServicesGetPropertyInfo", lua_AudioServicesGetPropertyInfo},
    {"AudioServicesGetProperty", lua_AudioServicesGetProperty},
    {"AudioServicesPropertyID", lua_AudioServicesPropertyID},
    {"AudioServicesNoError", lua_AudioServicesNoError},
    {"AudioServicesGetProperty", lua_AudioServicesGetProperty},
    {"AudioServicesSetProperty", lua_AudioServicesSetProperty},
    {"AudioServicesPropertyID", lua_AudioServicesPropertyID},
    {"AudioServicesNoError", lua_AudioServicesNoError},
    {"AudioServicesSetProperty", lua_AudioServicesSetProperty},
    {"AudioServicesNoHardwareError", lua_AudioServicesNoHardwareError},
    {"AudioServices_h__", lua_AudioServices_h__},
    {NULL, NULL},
};

int LuaOpenAudioServices(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAudioServicesAPIs);
    return 0;
}
