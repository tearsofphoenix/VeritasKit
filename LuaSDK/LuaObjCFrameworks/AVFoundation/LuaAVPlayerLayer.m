//
//  LuaAVPlayerLayer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVPlayerLayer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVPlayerLayers(lua_State *L)
{
    AVPlayerLayers(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerLayerInternal(lua_State *L)
{
    AVPlayerLayerInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVPlayerLayerInternal(lua_State *L)
{
    AVPlayerLayerInternal(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVPlayerLayerAPIs[] = {
    {"AVPlayerLayers", lua_AVPlayerLayers},
    {"AVPlayerLayerInternal", lua_AVPlayerLayerInternal},
    {"AVPlayerLayerInternal", lua_AVPlayerLayerInternal},
    {NULL, NULL},
};

int LuaOpenAVPlayerLayer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVPlayerLayerAPIs);
    return 0;
}
