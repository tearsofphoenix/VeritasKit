//
//  LuaAudioToolbox.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAudioToolbox.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AudioToolbox_H(lua_State *L)
{
    AudioToolbox_H(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioToolbox_H(lua_State *L)
{
    AudioToolbox_H(lua_touserdata(L, 1));
    return 1;
}

static int lua_AudioToolbox_H(lua_State *L)
{
    AudioToolbox_H(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAudioToolboxAPIs[] = {
    {"AudioToolbox_H", lua_AudioToolbox_H},
    {"AudioToolbox_H", lua_AudioToolbox_H},
    {"AudioToolbox_H", lua_AudioToolbox_H},
    {NULL, NULL},
};

int LuaOpenAudioToolbox(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAudioToolboxAPIs);
    return 0;
}
