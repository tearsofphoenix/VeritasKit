//
//  LuaTWRequest.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaTWRequest.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_TWRequestMethod(lua_State *L)
{
    TWRequestMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_TWRequestMethodGET(lua_State *L)
{
    TWRequestMethodGET(lua_touserdata(L, 1));
    return 1;
}

static int lua_TWRequestMethodPOST(lua_State *L)
{
    TWRequestMethodPOST(lua_touserdata(L, 1));
    return 1;
}

static int lua_TWRequestMethodDELETE(lua_State *L)
{
    TWRequestMethodDELETE(lua_touserdata(L, 1));
    return 1;
}

static int lua_TWRequestMethod(lua_State *L)
{
    TWRequestMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_TWRequestHandler(lua_State *L)
{
    TWRequestHandler(lua_touserdata(L, 1));
    return 1;
}

static int lua_TWRequestMethod(lua_State *L)
{
    TWRequestMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_TWRequestMethod(lua_State *L)
{
    TWRequestMethod(lua_touserdata(L, 1));
    return 1;
}

static int lua_TWRequestHandler(lua_State *L)
{
    TWRequestHandler(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaTWRequestAPIs[] = {
    {"TWRequestMethod", lua_TWRequestMethod},
    {"TWRequestMethodGET", lua_TWRequestMethodGET},
    {"TWRequestMethodPOST", lua_TWRequestMethodPOST},
    {"TWRequestMethodDELETE", lua_TWRequestMethodDELETE},
    {"TWRequestMethod", lua_TWRequestMethod},
    {"TWRequestHandler", lua_TWRequestHandler},
    {"TWRequestMethod", lua_TWRequestMethod},
    {"TWRequestMethod", lua_TWRequestMethod},
    {"TWRequestHandler", lua_TWRequestHandler},
    {NULL, NULL},
};

int LuaOpenTWRequest(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaTWRequestAPIs);
    return 0;
}
