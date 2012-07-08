//
//  Luaalc.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "Luaalc.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_alcCreateContext(lua_State *L)
{
    alcCreateContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcMakeContextCurrent(lua_State *L)
{
    alcMakeContextCurrent(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcProcessContext(lua_State *L)
{
    alcProcessContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcSuspendContext(lua_State *L)
{
    alcSuspendContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcDestroyContext(lua_State *L)
{
    alcDestroyContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcGetCurrentContext(lua_State *L)
{
    alcGetCurrentContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcGetContextsDevice(lua_State *L)
{
    alcGetContextsDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcOpenDevice(lua_State *L)
{
    alcOpenDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcCloseDevice(lua_State *L)
{
    alcCloseDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcGetError(lua_State *L)
{
    alcGetError(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcIsExtensionPresent(lua_State *L)
{
    alcIsExtensionPresent(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcGetProcAddress(lua_State *L)
{
    alcGetProcAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcGetEnumValue(lua_State *L)
{
    alcGetEnumValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcGetString(lua_State *L)
{
    alcGetString(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcGetIntegerv(lua_State *L)
{
    alcGetIntegerv(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcCaptureOpenDevice(lua_State *L)
{
    alcCaptureOpenDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcCaptureCloseDevice(lua_State *L)
{
    alcCaptureCloseDevice(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcCaptureStart(lua_State *L)
{
    alcCaptureStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcCaptureStop(lua_State *L)
{
    alcCaptureStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_alcCaptureSamples(lua_State *L)
{
    alcCaptureSamples(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaalcAPIs[] = {
    {"alcCreateContext", lua_alcCreateContext},
    {"alcMakeContextCurrent", lua_alcMakeContextCurrent},
    {"alcProcessContext", lua_alcProcessContext},
    {"alcSuspendContext", lua_alcSuspendContext},
    {"alcDestroyContext", lua_alcDestroyContext},
    {"alcGetCurrentContext", lua_alcGetCurrentContext},
    {"alcGetContextsDevice", lua_alcGetContextsDevice},
    {"alcOpenDevice", lua_alcOpenDevice},
    {"alcCloseDevice", lua_alcCloseDevice},
    {"alcGetError", lua_alcGetError},
    {"alcIsExtensionPresent", lua_alcIsExtensionPresent},
    {"alcGetProcAddress", lua_alcGetProcAddress},
    {"alcGetEnumValue", lua_alcGetEnumValue},
    {"alcGetString", lua_alcGetString},
    {"alcGetIntegerv", lua_alcGetIntegerv},
    {"alcCaptureOpenDevice", lua_alcCaptureOpenDevice},
    {"alcCaptureCloseDevice", lua_alcCaptureCloseDevice},
    {"alcCaptureStart", lua_alcCaptureStart},
    {"alcCaptureStop", lua_alcCaptureStop},
    {"alcCaptureSamples", lua_alcCaptureSamples},
    {NULL, NULL},
};

int LuaOpenalc(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaalcAPIs);
    return 0;
}
