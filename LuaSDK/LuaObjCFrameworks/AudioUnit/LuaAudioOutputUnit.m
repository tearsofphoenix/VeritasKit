//
//  LuaAudioOutputUnit.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAudioOutputUnit.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AudioOutputUnitStart(lua_State *L)
{
    AudioOutputUnitStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioOutputUnitStop(lua_State *L)
{
    AudioOutputUnitStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioOutputUnitRange(lua_State *L)
{
    AudioOutputUnitRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioOutputUnitStartSelect(lua_State *L)
{
    AudioOutputUnitStartSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioOutputUnitStopSelect(lua_State *L)
{
    AudioOutputUnitStopSelect(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioOutputUnitStartProc(lua_State *L)
{
    AudioOutputUnitStartProc(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioOutputUnitStopProc(lua_State *L)
{
    AudioOutputUnitStopProc(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAudioOutputUnitAPIs[] = {
    {"AudioOutputUnitStart", lua_AudioOutputUnitStart},
    {"AudioOutputUnitStop", lua_AudioOutputUnitStop},
    {"AudioOutputUnitRange", lua_AudioOutputUnitRange},
    {"AudioOutputUnitStartSelect", lua_AudioOutputUnitStartSelect},
    {"AudioOutputUnitStopSelect", lua_AudioOutputUnitStopSelect},
    {"AudioOutputUnitStartProc", lua_AudioOutputUnitStartProc},
    {"AudioOutputUnitStopProc", lua_AudioOutputUnitStopProc},
    {NULL, NULL},
};

int LuaOpenAudioOutputUnit(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAudioOutputUnitAPIs);
    return 0;
}
