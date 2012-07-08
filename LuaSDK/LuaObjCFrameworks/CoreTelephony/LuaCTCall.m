//
//  LuaCTCall.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTCall.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTCallStateDialing(lua_State *L)
{
    CTCallStateDialing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTCallStateIncoming(lua_State *L)
{
    CTCallStateIncoming(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTCallStateConnected(lua_State *L)
{
    CTCallStateConnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTCallStateDisconnected(lua_State *L)
{
    CTCallStateDisconnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTCallStateDialing(lua_State *L)
{
    CTCallStateDialing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTCallStateConnected(lua_State *L)
{
    CTCallStateConnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTCallStateDisconnected(lua_State *L)
{
    CTCallStateDisconnected(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTCallAPIs[] = {
    {"CTCallStateDialing", lua_CTCallStateDialing},
    {"CTCallStateIncoming", lua_CTCallStateIncoming},
    {"CTCallStateConnected", lua_CTCallStateConnected},
    {"CTCallStateDisconnected", lua_CTCallStateDisconnected},
    {"CTCallStateDialing", lua_CTCallStateDialing},
    {"CTCallStateConnected", lua_CTCallStateConnected},
    {"CTCallStateDisconnected", lua_CTCallStateDisconnected},
    {NULL, NULL},
};

int LuaOpenCTCall(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTCallAPIs);
    return 0;
}
