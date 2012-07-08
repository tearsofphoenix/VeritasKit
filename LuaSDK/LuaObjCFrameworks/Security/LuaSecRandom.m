//
//  LuaSecRandom.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSecRandom.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SecRandomRef(lua_State *L)
{
    SecRandomRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecRandomRef(lua_State *L)
{
    SecRandomRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecRandomRef(lua_State *L)
{
    SecRandomRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecRandomCopyBytes(lua_State *L)
{
    SecRandomCopyBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecRandomCopyBytes(lua_State *L)
{
    SecRandomCopyBytes(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSecRandomAPIs[] = {
    {"SecRandomRef", lua_SecRandomRef},
    {"SecRandomRef", lua_SecRandomRef},
    {"SecRandomRef", lua_SecRandomRef},
    {"SecRandomCopyBytes", lua_SecRandomCopyBytes},
    {"SecRandomCopyBytes", lua_SecRandomCopyBytes},
    {NULL, NULL},
};

int LuaOpenSecRandom(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSecRandomAPIs);
    return 0;
}
