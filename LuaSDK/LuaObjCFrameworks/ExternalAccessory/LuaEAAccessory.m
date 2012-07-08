//
//  LuaEAAccessory.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaEAAccessory.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_EAAccessoryInternal(lua_State *L)
{
    EAAccessoryInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_EAAccessoryDelegate(lua_State *L)
{
    EAAccessoryDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_EAAccessoryInternal(lua_State *L)
{
    EAAccessoryInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_EAAccessoryDelegate(lua_State *L)
{
    EAAccessoryDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_EAAccessoryDelegate(lua_State *L)
{
    EAAccessoryDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaEAAccessoryAPIs[] = {
    {"EAAccessoryInternal", lua_EAAccessoryInternal},
    {"EAAccessoryDelegate", lua_EAAccessoryDelegate},
    {"EAAccessoryInternal", lua_EAAccessoryInternal},
    {"EAAccessoryDelegate", lua_EAAccessoryDelegate},
    {"EAAccessoryDelegate", lua_EAAccessoryDelegate},
    {NULL, NULL},
};

int LuaOpenEAAccessory(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaEAAccessoryAPIs);
    return 0;
}
