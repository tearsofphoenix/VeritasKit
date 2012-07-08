//
//  LuaMIDIServices.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMIDIServices.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MIDIServices_h__(lua_State *L)
{
    MIDIServices_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDIServices_h__(lua_State *L)
{
    MIDIServices_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDIServices_h__(lua_State *L)
{
    MIDIServices_h__(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMIDIServicesAPIs[] = {
    {"MIDIServices_h__", lua_MIDIServices_h__},
    {"MIDIServices_h__", lua_MIDIServices_h__},
    {"MIDIServices_h__", lua_MIDIServices_h__},
    {NULL, NULL},
};

int LuaOpenMIDIServices(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMIDIServicesAPIs);
    return 0;
}
