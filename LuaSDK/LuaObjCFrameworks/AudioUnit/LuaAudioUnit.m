//
//  LuaAudioUnit.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAudioUnit.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AudioUnitProperties(lua_State *L)
{
    AudioUnitProperties(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioUnitParameters(lua_State *L)
{
    AudioUnitParameters(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioUnitProperties(lua_State *L)
{
    AudioUnitProperties(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioUnitParameters(lua_State *L)
{
    AudioUnitParameters(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAudioUnitAPIs[] = {
    {"AudioUnitProperties", lua_AudioUnitProperties},
    {"AudioUnitParameters", lua_AudioUnitParameters},
    {"AudioUnitProperties", lua_AudioUnitProperties},
    {"AudioUnitParameters", lua_AudioUnitParameters},
    {NULL, NULL},
};

int LuaOpenAudioUnit(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAudioUnitAPIs);
    return 0;
}
