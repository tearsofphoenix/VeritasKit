//
//  LuaAVSynchronizedLayer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVSynchronizedLayer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVSynchronizedLayers(lua_State *L)
{
    AVSynchronizedLayers(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVSynchronizedLayerInternal(lua_State *L)
{
    AVSynchronizedLayerInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVSynchronizedLayerInternal(lua_State *L)
{
    AVSynchronizedLayerInternal(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVSynchronizedLayerAPIs[] = {
    {"AVSynchronizedLayers", lua_AVSynchronizedLayers},
    {"AVSynchronizedLayerInternal", lua_AVSynchronizedLayerInternal},
    {"AVSynchronizedLayerInternal", lua_AVSynchronizedLayerInternal},
    {NULL, NULL},
};

int LuaOpenAVSynchronizedLayer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVSynchronizedLayerAPIs);
    return 0;
}
