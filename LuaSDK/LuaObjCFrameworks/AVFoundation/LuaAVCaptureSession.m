//
//  LuaAVCaptureSession.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVCaptureSession.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVCaptureSessionRuntimeErrorNotification(lua_State *L)
{
    AVCaptureSessionRuntimeErrorNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionErrorKey(lua_State *L)
{
    AVCaptureSessionErrorKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionRuntimeErrorNotification(lua_State *L)
{
    AVCaptureSessionRuntimeErrorNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionErrorKey(lua_State *L)
{
    AVCaptureSessionErrorKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionRuntimeErrorNotification(lua_State *L)
{
    AVCaptureSessionRuntimeErrorNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionErrorKey(lua_State *L)
{
    AVCaptureSessionErrorKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionRuntimeErrorNotification(lua_State *L)
{
    AVCaptureSessionRuntimeErrorNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionErrorKey(lua_State *L)
{
    AVCaptureSessionErrorKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionDidStartRunningNotification(lua_State *L)
{
    AVCaptureSessionDidStartRunningNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionDidStartRunningNotification(lua_State *L)
{
    AVCaptureSessionDidStartRunningNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionDidStartRunningNotification(lua_State *L)
{
    AVCaptureSessionDidStartRunningNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionDidStopRunningNotification(lua_State *L)
{
    AVCaptureSessionDidStopRunningNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionDidStopRunningNotification(lua_State *L)
{
    AVCaptureSessionDidStopRunningNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionDidStopRunningNotification(lua_State *L)
{
    AVCaptureSessionDidStopRunningNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionWasInterruptedNotification(lua_State *L)
{
    AVCaptureSessionWasInterruptedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionWasInterruptedNotification(lua_State *L)
{
    AVCaptureSessionWasInterruptedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionWasInterruptedNotification(lua_State *L)
{
    AVCaptureSessionWasInterruptedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionInterruptionEndedNotification(lua_State *L)
{
    AVCaptureSessionInterruptionEndedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionInterruptionEndedNotification(lua_State *L)
{
    AVCaptureSessionInterruptionEndedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionInterruptionEndedNotification(lua_State *L)
{
    AVCaptureSessionInterruptionEndedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetPhoto(lua_State *L)
{
    AVCaptureSessionPresetPhoto(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetPhoto(lua_State *L)
{
    AVCaptureSessionPresetPhoto(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetPhoto(lua_State *L)
{
    AVCaptureSessionPresetPhoto(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetHigh(lua_State *L)
{
    AVCaptureSessionPresetHigh(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetHigh(lua_State *L)
{
    AVCaptureSessionPresetHigh(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetHigh(lua_State *L)
{
    AVCaptureSessionPresetHigh(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetHigh(lua_State *L)
{
    AVCaptureSessionPresetHigh(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetMedium(lua_State *L)
{
    AVCaptureSessionPresetMedium(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetMedium(lua_State *L)
{
    AVCaptureSessionPresetMedium(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetMedium(lua_State *L)
{
    AVCaptureSessionPresetMedium(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetLow(lua_State *L)
{
    AVCaptureSessionPresetLow(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetLow(lua_State *L)
{
    AVCaptureSessionPresetLow(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetLow(lua_State *L)
{
    AVCaptureSessionPresetLow(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPreset352x288(lua_State *L)
{
    AVCaptureSessionPreset352x288(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPreset352x288(lua_State *L)
{
    AVCaptureSessionPreset352x288(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPreset352x288(lua_State *L)
{
    AVCaptureSessionPreset352x288(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPreset640x480(lua_State *L)
{
    AVCaptureSessionPreset640x480(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPreset640x480(lua_State *L)
{
    AVCaptureSessionPreset640x480(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPreset640x480(lua_State *L)
{
    AVCaptureSessionPreset640x480(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPreset1280x720(lua_State *L)
{
    AVCaptureSessionPreset1280x720(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPreset1280x720(lua_State *L)
{
    AVCaptureSessionPreset1280x720(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPreset1280x720(lua_State *L)
{
    AVCaptureSessionPreset1280x720(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPreset1920x1080(lua_State *L)
{
    AVCaptureSessionPreset1920x1080(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPreset1920x1080(lua_State *L)
{
    AVCaptureSessionPreset1920x1080(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPreset1920x1080(lua_State *L)
{
    AVCaptureSessionPreset1920x1080(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetiFrame960x540(lua_State *L)
{
    AVCaptureSessionPresetiFrame960x540(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetiFrame960x540(lua_State *L)
{
    AVCaptureSessionPresetiFrame960x540(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetiFrame960x540(lua_State *L)
{
    AVCaptureSessionPresetiFrame960x540(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetiFrame1280x720(lua_State *L)
{
    AVCaptureSessionPresetiFrame1280x720(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetiFrame1280x720(lua_State *L)
{
    AVCaptureSessionPresetiFrame1280x720(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPresetiFrame1280x720(lua_State *L)
{
    AVCaptureSessionPresetiFrame1280x720(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionInternal(lua_State *L)
{
    AVCaptureSessionInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionInternal(lua_State *L)
{
    AVCaptureSessionInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionPreset(lua_State *L)
{
    AVCaptureSessionPreset(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureSessionRuntimeErrorNotification(lua_State *L)
{
    AVCaptureSessionRuntimeErrorNotification(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVCaptureSessionAPIs[] = {
    {"AVCaptureSessionRuntimeErrorNotification", lua_AVCaptureSessionRuntimeErrorNotification},
    {"AVCaptureSessionErrorKey", lua_AVCaptureSessionErrorKey},
    {"AVCaptureSessionRuntimeErrorNotification", lua_AVCaptureSessionRuntimeErrorNotification},
    {"AVCaptureSessionErrorKey", lua_AVCaptureSessionErrorKey},
    {"AVCaptureSessionRuntimeErrorNotification", lua_AVCaptureSessionRuntimeErrorNotification},
    {"AVCaptureSessionErrorKey", lua_AVCaptureSessionErrorKey},
    {"AVCaptureSessionRuntimeErrorNotification", lua_AVCaptureSessionRuntimeErrorNotification},
    {"AVCaptureSessionErrorKey", lua_AVCaptureSessionErrorKey},
    {"AVCaptureSessionDidStartRunningNotification", lua_AVCaptureSessionDidStartRunningNotification},
    {"AVCaptureSessionDidStartRunningNotification", lua_AVCaptureSessionDidStartRunningNotification},
    {"AVCaptureSessionDidStartRunningNotification", lua_AVCaptureSessionDidStartRunningNotification},
    {"AVCaptureSessionDidStopRunningNotification", lua_AVCaptureSessionDidStopRunningNotification},
    {"AVCaptureSessionDidStopRunningNotification", lua_AVCaptureSessionDidStopRunningNotification},
    {"AVCaptureSessionDidStopRunningNotification", lua_AVCaptureSessionDidStopRunningNotification},
    {"AVCaptureSessionWasInterruptedNotification", lua_AVCaptureSessionWasInterruptedNotification},
    {"AVCaptureSessionWasInterruptedNotification", lua_AVCaptureSessionWasInterruptedNotification},
    {"AVCaptureSessionWasInterruptedNotification", lua_AVCaptureSessionWasInterruptedNotification},
    {"AVCaptureSessionInterruptionEndedNotification", lua_AVCaptureSessionInterruptionEndedNotification},
    {"AVCaptureSessionInterruptionEndedNotification", lua_AVCaptureSessionInterruptionEndedNotification},
    {"AVCaptureSessionInterruptionEndedNotification", lua_AVCaptureSessionInterruptionEndedNotification},
    {"AVCaptureSessionPresetPhoto", lua_AVCaptureSessionPresetPhoto},
    {"AVCaptureSessionPresetPhoto", lua_AVCaptureSessionPresetPhoto},
    {"AVCaptureSessionPresetPhoto", lua_AVCaptureSessionPresetPhoto},
    {"AVCaptureSessionPresetHigh", lua_AVCaptureSessionPresetHigh},
    {"AVCaptureSessionPresetHigh", lua_AVCaptureSessionPresetHigh},
    {"AVCaptureSessionPresetHigh", lua_AVCaptureSessionPresetHigh},
    {"AVCaptureSessionPresetHigh", lua_AVCaptureSessionPresetHigh},
    {"AVCaptureSessionPresetMedium", lua_AVCaptureSessionPresetMedium},
    {"AVCaptureSessionPresetMedium", lua_AVCaptureSessionPresetMedium},
    {"AVCaptureSessionPresetMedium", lua_AVCaptureSessionPresetMedium},
    {"AVCaptureSessionPresetLow", lua_AVCaptureSessionPresetLow},
    {"AVCaptureSessionPresetLow", lua_AVCaptureSessionPresetLow},
    {"AVCaptureSessionPresetLow", lua_AVCaptureSessionPresetLow},
    {"AVCaptureSessionPreset352x288", lua_AVCaptureSessionPreset352x288},
    {"AVCaptureSessionPreset352x288", lua_AVCaptureSessionPreset352x288},
    {"AVCaptureSessionPreset352x288", lua_AVCaptureSessionPreset352x288},
    {"AVCaptureSessionPreset640x480", lua_AVCaptureSessionPreset640x480},
    {"AVCaptureSessionPreset640x480", lua_AVCaptureSessionPreset640x480},
    {"AVCaptureSessionPreset640x480", lua_AVCaptureSessionPreset640x480},
    {"AVCaptureSessionPreset1280x720", lua_AVCaptureSessionPreset1280x720},
    {"AVCaptureSessionPreset1280x720", lua_AVCaptureSessionPreset1280x720},
    {"AVCaptureSessionPreset1280x720", lua_AVCaptureSessionPreset1280x720},
    {"AVCaptureSessionPreset1920x1080", lua_AVCaptureSessionPreset1920x1080},
    {"AVCaptureSessionPreset1920x1080", lua_AVCaptureSessionPreset1920x1080},
    {"AVCaptureSessionPreset1920x1080", lua_AVCaptureSessionPreset1920x1080},
    {"AVCaptureSessionPresetiFrame960x540", lua_AVCaptureSessionPresetiFrame960x540},
    {"AVCaptureSessionPresetiFrame960x540", lua_AVCaptureSessionPresetiFrame960x540},
    {"AVCaptureSessionPresetiFrame960x540", lua_AVCaptureSessionPresetiFrame960x540},
    {"AVCaptureSessionPresetiFrame1280x720", lua_AVCaptureSessionPresetiFrame1280x720},
    {"AVCaptureSessionPresetiFrame1280x720", lua_AVCaptureSessionPresetiFrame1280x720},
    {"AVCaptureSessionPresetiFrame1280x720", lua_AVCaptureSessionPresetiFrame1280x720},
    {"AVCaptureSessionInternal", lua_AVCaptureSessionInternal},
    {"AVCaptureSessionInternal", lua_AVCaptureSessionInternal},
    {"AVCaptureSessionPreset", lua_AVCaptureSessionPreset},
    {"AVCaptureSessionRuntimeErrorNotification", lua_AVCaptureSessionRuntimeErrorNotification},
    {NULL, NULL},
};

int LuaOpenAVCaptureSession(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVCaptureSessionAPIs);
    return 0;
}
