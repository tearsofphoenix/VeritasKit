//
//  LuaCGDataConsumer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGDataConsumer.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CGDataConsumerGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGDataConsumerGetTypeID());
    return 1;
}

static int lua_CGDataConsumerCreate(lua_State *L)
{
    lua_pushlightuserdata(L, CGDataConsumerCreate(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGDataConsumerCreateWithURL(lua_State *L)
{
    lua_pushlightuserdata(L, CGDataConsumerCreateWithURL(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGDataConsumerCreateWithCFData(lua_State *L)
{
    lua_pushlightuserdata(L, CGDataConsumerCreateWithCFData(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGDataConsumerRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGDataConsumerRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGDataConsumerRelease(lua_State *L)
{
    CGDataConsumerRelease(lua_touserdata(L, 1));
    return 0;
}

static const luaL_Reg __LuaCGDataConsumerAPIs[] = 
{
    {"CGDataConsumerGetTypeID", lua_CGDataConsumerGetTypeID},
    {"CGDataConsumerCreate", lua_CGDataConsumerCreate},
    {"CGDataConsumerCreateWithURL", lua_CGDataConsumerCreateWithURL},
    {"CGDataConsumerCreateWithCFData", lua_CGDataConsumerCreateWithCFData},
    {"CGDataConsumerRetain", lua_CGDataConsumerRetain},
    {"CGDataConsumerRelease", lua_CGDataConsumerRelease},
    {NULL, NULL},
};

int LuaOpenCGDataConsumer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGDataConsumerAPIs);
    return 0;
}
