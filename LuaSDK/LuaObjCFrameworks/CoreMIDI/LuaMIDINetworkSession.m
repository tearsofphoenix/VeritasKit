//
//  LuaMIDINetworkSession.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMIDINetworkSession.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MIDINetworkSession_h__(lua_State *L)
{
    MIDINetworkSession_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDINetworkSession_h__(lua_State *L)
{
    MIDINetworkSession_h__(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDINetworkSessionImpl(lua_State *L)
{
    MIDINetworkSessionImpl(lua_touserdata(L, 1));
    return 1;
}

static int lua_MIDINetworkSession_h__(lua_State *L)
{
    MIDINetworkSession_h__(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMIDINetworkSessionAPIs[] = {
    {"MIDINetworkSession_h__", lua_MIDINetworkSession_h__},
    {"MIDINetworkSession_h__", lua_MIDINetworkSession_h__},
    {"MIDINetworkSessionImpl", lua_MIDINetworkSessionImpl},
    {"MIDINetworkSession_h__", lua_MIDINetworkSession_h__},
    {NULL, NULL},
};

int LuaOpenMIDINetworkSession(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMIDINetworkSessionAPIs);
    return 0;
}
