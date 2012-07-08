//
//  Luaal.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "Luaal.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alse(lua_State *L)
{
    alse(lua_touserdata(L, 1));
    return 1;
}

static int lua_always(lua_State *L)
{
    always(lua_touserdata(L, 1));
    return 1;
}

static int lua_alid(lua_State *L)
{
    alid(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_als(lua_State *L)
{
    als(lua_touserdata(L, 1));
    return 1;
}

static int lua_als(lua_State *L)
{
    als(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_ale(lua_State *L)
{
    ale(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourceQueueBuffers(lua_State *L)
{
    alSourceQueueBuffers(lua_touserdata(L, 1));
    return 1;
}

static int lua_alf(lua_State *L)
{
    alf(lua_touserdata(L, 1));
    return 1;
}

static int lua_alid(lua_State *L)
{
    alid(lua_touserdata(L, 1));
    return 1;
}

static int lua_alid(lua_State *L)
{
    alid(lua_touserdata(L, 1));
    return 1;
}

static int lua_alid(lua_State *L)
{
    alid(lua_touserdata(L, 1));
    return 1;
}

static int lua_all(lua_State *L)
{
    all(lua_touserdata(L, 1));
    return 1;
}

static int lua_ale(lua_State *L)
{
    ale(lua_touserdata(L, 1));
    return 1;
}

static int lua_alEnable(lua_State *L)
{
    alEnable(lua_touserdata(L, 1));
    return 1;
}

static int lua_alDisable(lua_State *L)
{
    alDisable(lua_touserdata(L, 1));
    return 1;
}

static int lua_alIsEnabled(lua_State *L)
{
    alIsEnabled(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetString(lua_State *L)
{
    alGetString(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetBooleanv(lua_State *L)
{
    alGetBooleanv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetIntegerv(lua_State *L)
{
    alGetIntegerv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetFloatv(lua_State *L)
{
    alGetFloatv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetDoublev(lua_State *L)
{
    alGetDoublev(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetBoolean(lua_State *L)
{
    alGetBoolean(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetInteger(lua_State *L)
{
    alGetInteger(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetFloat(lua_State *L)
{
    alGetFloat(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetDouble(lua_State *L)
{
    alGetDouble(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetError(lua_State *L)
{
    alGetError(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alIsExtensionPresent(lua_State *L)
{
    alIsExtensionPresent(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetProcAddress(lua_State *L)
{
    alGetProcAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetEnumValue(lua_State *L)
{
    alGetEnumValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alListenerf(lua_State *L)
{
    alListenerf(lua_touserdata(L, 1));
    return 1;
}

static int lua_alListener3f(lua_State *L)
{
    alListener3f(lua_touserdata(L, 1));
    return 1;
}

static int lua_alListenerfv(lua_State *L)
{
    alListenerfv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alListeneri(lua_State *L)
{
    alListeneri(lua_touserdata(L, 1));
    return 1;
}

static int lua_alListener3i(lua_State *L)
{
    alListener3i(lua_touserdata(L, 1));
    return 1;
}

static int lua_alListeneriv(lua_State *L)
{
    alListeneriv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetListenerf(lua_State *L)
{
    alGetListenerf(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetListener3f(lua_State *L)
{
    alGetListener3f(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetListenerfv(lua_State *L)
{
    alGetListenerfv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetListeneri(lua_State *L)
{
    alGetListeneri(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetListener3i(lua_State *L)
{
    alGetListener3i(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetListeneriv(lua_State *L)
{
    alGetListeneriv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGenSources(lua_State *L)
{
    alGenSources(lua_touserdata(L, 1));
    return 1;
}

static int lua_alDeleteSources(lua_State *L)
{
    alDeleteSources(lua_touserdata(L, 1));
    return 1;
}

static int lua_alid(lua_State *L)
{
    alid(lua_touserdata(L, 1));
    return 1;
}

static int lua_alIsSource(lua_State *L)
{
    alIsSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourcef(lua_State *L)
{
    alSourcef(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSource3f(lua_State *L)
{
    alSource3f(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourcefv(lua_State *L)
{
    alSourcefv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourcei(lua_State *L)
{
    alSourcei(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSource3i(lua_State *L)
{
    alSource3i(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourceiv(lua_State *L)
{
    alSourceiv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetSourcef(lua_State *L)
{
    alGetSourcef(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetSource3f(lua_State *L)
{
    alGetSource3f(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetSourcefv(lua_State *L)
{
    alGetSourcefv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetSourcei(lua_State *L)
{
    alGetSourcei(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetSource3i(lua_State *L)
{
    alGetSource3i(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetSourceiv(lua_State *L)
{
    alGetSourceiv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alls(lua_State *L)
{
    alls(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourcePlayv(lua_State *L)
{
    alSourcePlayv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourceStopv(lua_State *L)
{
    alSourceStopv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourceRewindv(lua_State *L)
{
    alSourceRewindv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourcePausev(lua_State *L)
{
    alSourcePausev(lua_touserdata(L, 1));
    return 1;
}

static int lua_alls(lua_State *L)
{
    alls(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourcePlay(lua_State *L)
{
    alSourcePlay(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourceStop(lua_State *L)
{
    alSourceStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourceRewind(lua_State *L)
{
    alSourceRewind(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourcePause(lua_State *L)
{
    alSourcePause(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourceQueueBuffers(lua_State *L)
{
    alSourceQueueBuffers(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSourceUnqueueBuffers(lua_State *L)
{
    alSourceUnqueueBuffers(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGenBuffers(lua_State *L)
{
    alGenBuffers(lua_touserdata(L, 1));
    return 1;
}

static int lua_alDeleteBuffers(lua_State *L)
{
    alDeleteBuffers(lua_touserdata(L, 1));
    return 1;
}

static int lua_alid(lua_State *L)
{
    alid(lua_touserdata(L, 1));
    return 1;
}

static int lua_alIsBuffer(lua_State *L)
{
    alIsBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_alBufferData(lua_State *L)
{
    alBufferData(lua_touserdata(L, 1));
    return 1;
}

static int lua_alBufferf(lua_State *L)
{
    alBufferf(lua_touserdata(L, 1));
    return 1;
}

static int lua_alBuffer3f(lua_State *L)
{
    alBuffer3f(lua_touserdata(L, 1));
    return 1;
}

static int lua_alBufferfv(lua_State *L)
{
    alBufferfv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alBufferi(lua_State *L)
{
    alBufferi(lua_touserdata(L, 1));
    return 1;
}

static int lua_alBuffer3i(lua_State *L)
{
    alBuffer3i(lua_touserdata(L, 1));
    return 1;
}

static int lua_alBufferiv(lua_State *L)
{
    alBufferiv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetBufferf(lua_State *L)
{
    alGetBufferf(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetBuffer3f(lua_State *L)
{
    alGetBuffer3f(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetBufferfv(lua_State *L)
{
    alGetBufferfv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetBufferi(lua_State *L)
{
    alGetBufferi(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetBuffer3i(lua_State *L)
{
    alGetBuffer3i(lua_touserdata(L, 1));
    return 1;
}

static int lua_alGetBufferiv(lua_State *L)
{
    alGetBufferiv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alDopplerFactor(lua_State *L)
{
    alDopplerFactor(lua_touserdata(L, 1));
    return 1;
}

static int lua_alDopplerVelocity(lua_State *L)
{
    alDopplerVelocity(lua_touserdata(L, 1));
    return 1;
}

static int lua_alSpeedOfSound(lua_State *L)
{
    alSpeedOfSound(lua_touserdata(L, 1));
    return 1;
}

static int lua_alDistanceModel(lua_State *L)
{
    alDistanceModel(lua_touserdata(L, 1));
    return 1;
}

static int lua_ally(lua_State *L)
{
    ally(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue1(lua_State *L)
{
    alue1(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue1(lua_State *L)
{
    alue1(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue1(lua_State *L)
{
    alue1(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue1(lua_State *L)
{
    alue1(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue1(lua_State *L)
{
    alue1(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue1(lua_State *L)
{
    alue1(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue1(lua_State *L)
{
    alue1(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue1(lua_State *L)
{
    alue1(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue1(lua_State *L)
{
    alue1(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue1(lua_State *L)
{
    alue1(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue1(lua_State *L)
{
    alue1(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue1(lua_State *L)
{
    alue1(lua_touserdata(L, 1));
    return 1;
}

static int lua_alues(lua_State *L)
{
    alues(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alue(lua_State *L)
{
    alue(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaalAPIs[] = {
    {"alue", lua_alue},
    {"alues", lua_alues},
    {"alse", lua_alse},
    {"always", lua_always},
    {"alid", lua_alid},
    {"alue", lua_alue},
    {"als", lua_als},
    {"als", lua_als},
    {"alue", lua_alue},
    {"ale", lua_ale},
    {"alSourceQueueBuffers", lua_alSourceQueueBuffers},
    {"alf", lua_alf},
    {"alid", lua_alid},
    {"alid", lua_alid},
    {"alid", lua_alid},
    {"all", lua_all},
    {"ale", lua_ale},
    {"alEnable", lua_alEnable},
    {"alDisable", lua_alDisable},
    {"alIsEnabled", lua_alIsEnabled},
    {"alGetString", lua_alGetString},
    {"alGetBooleanv", lua_alGetBooleanv},
    {"alGetIntegerv", lua_alGetIntegerv},
    {"alGetFloatv", lua_alGetFloatv},
    {"alGetDoublev", lua_alGetDoublev},
    {"alGetBoolean", lua_alGetBoolean},
    {"alGetInteger", lua_alGetInteger},
    {"alGetFloat", lua_alGetFloat},
    {"alGetDouble", lua_alGetDouble},
    {"alGetError", lua_alGetError},
    {"alues", lua_alues},
    {"alIsExtensionPresent", lua_alIsExtensionPresent},
    {"alGetProcAddress", lua_alGetProcAddress},
    {"alGetEnumValue", lua_alGetEnumValue},
    {"alListenerf", lua_alListenerf},
    {"alListener3f", lua_alListener3f},
    {"alListenerfv", lua_alListenerfv},
    {"alListeneri", lua_alListeneri},
    {"alListener3i", lua_alListener3i},
    {"alListeneriv", lua_alListeneriv},
    {"alGetListenerf", lua_alGetListenerf},
    {"alGetListener3f", lua_alGetListener3f},
    {"alGetListenerfv", lua_alGetListenerfv},
    {"alGetListeneri", lua_alGetListeneri},
    {"alGetListener3i", lua_alGetListener3i},
    {"alGetListeneriv", lua_alGetListeneriv},
    {"alGenSources", lua_alGenSources},
    {"alDeleteSources", lua_alDeleteSources},
    {"alid", lua_alid},
    {"alIsSource", lua_alIsSource},
    {"alSourcef", lua_alSourcef},
    {"alSource3f", lua_alSource3f},
    {"alSourcefv", lua_alSourcefv},
    {"alSourcei", lua_alSourcei},
    {"alSource3i", lua_alSource3i},
    {"alSourceiv", lua_alSourceiv},
    {"alGetSourcef", lua_alGetSourcef},
    {"alGetSource3f", lua_alGetSource3f},
    {"alGetSourcefv", lua_alGetSourcefv},
    {"alGetSourcei", lua_alGetSourcei},
    {"alGetSource3i", lua_alGetSource3i},
    {"alGetSourceiv", lua_alGetSourceiv},
    {"alls", lua_alls},
    {"alSourcePlayv", lua_alSourcePlayv},
    {"alSourceStopv", lua_alSourceStopv},
    {"alSourceRewindv", lua_alSourceRewindv},
    {"alSourcePausev", lua_alSourcePausev},
    {"alls", lua_alls},
    {"alSourcePlay", lua_alSourcePlay},
    {"alSourceStop", lua_alSourceStop},
    {"alSourceRewind", lua_alSourceRewind},
    {"alSourcePause", lua_alSourcePause},
    {"alSourceQueueBuffers", lua_alSourceQueueBuffers},
    {"alSourceUnqueueBuffers", lua_alSourceUnqueueBuffers},
    {"alGenBuffers", lua_alGenBuffers},
    {"alDeleteBuffers", lua_alDeleteBuffers},
    {"alid", lua_alid},
    {"alIsBuffer", lua_alIsBuffer},
    {"alBufferData", lua_alBufferData},
    {"alBufferf", lua_alBufferf},
    {"alBuffer3f", lua_alBuffer3f},
    {"alBufferfv", lua_alBufferfv},
    {"alBufferi", lua_alBufferi},
    {"alBuffer3i", lua_alBuffer3i},
    {"alBufferiv", lua_alBufferiv},
    {"alGetBufferf", lua_alGetBufferf},
    {"alGetBuffer3f", lua_alGetBuffer3f},
    {"alGetBufferfv", lua_alGetBufferfv},
    {"alGetBufferi", lua_alGetBufferi},
    {"alGetBuffer3i", lua_alGetBuffer3i},
    {"alGetBufferiv", lua_alGetBufferiv},
    {"alDopplerFactor", lua_alDopplerFactor},
    {"alDopplerVelocity", lua_alDopplerVelocity},
    {"alSpeedOfSound", lua_alSpeedOfSound},
    {"alDistanceModel", lua_alDistanceModel},
    {"ally", lua_ally},
    {"alue", lua_alue},
    {"alue1", lua_alue1},
    {"alues", lua_alues},
    {"alue", lua_alue},
    {"alue1", lua_alue1},
    {"alues", lua_alues},
    {"alue", lua_alue},
    {"alue1", lua_alue1},
    {"alues", lua_alues},
    {"alue", lua_alue},
    {"alue1", lua_alue1},
    {"alues", lua_alues},
    {"alue", lua_alue},
    {"alue1", lua_alue1},
    {"alues", lua_alues},
    {"alue", lua_alue},
    {"alue1", lua_alue1},
    {"alues", lua_alues},
    {"alue", lua_alue},
    {"alue1", lua_alue1},
    {"alues", lua_alues},
    {"alue", lua_alue},
    {"alue1", lua_alue1},
    {"alues", lua_alues},
    {"alue", lua_alue},
    {"alue1", lua_alue1},
    {"alues", lua_alues},
    {"alue", lua_alue},
    {"alue1", lua_alue1},
    {"alues", lua_alues},
    {"alue", lua_alue},
    {"alue1", lua_alue1},
    {"alues", lua_alues},
    {"alue", lua_alue},
    {"alue1", lua_alue1},
    {"alues", lua_alues},
    {"alue", lua_alue},
    {"alue", lua_alue},
    {"alue", lua_alue},
    {NULL, NULL},
};

int LuaOpenal(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaalAPIs);
    return 0;
}
