//
//  LuaCoreMIDI.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCoreMIDI.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CoreMIDI_h__(lua_State *L)
{
    CoreMIDI_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_CoreMIDI_h__(lua_State *L)
{
    CoreMIDI_h__(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCoreMIDIAPIs[] = {
    {"CoreMIDI_h__", lua_CoreMIDI_h__},
    {"CoreMIDI_h__", lua_CoreMIDI_h__},
    {NULL, NULL},
};

int LuaOpenCoreMIDI(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCoreMIDIAPIs);
    return 0;
}
