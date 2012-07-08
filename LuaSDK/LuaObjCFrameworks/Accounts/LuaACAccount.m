//
//  LuaACAccount.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaACAccount.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_ACAccountType(lua_State *L)
{
    ACAccountType(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACAccountType(lua_State *L)
{
    ACAccountType(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACAccountStore(lua_State *L)
{
    ACAccountStore(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACAccountStore(lua_State *L)
{
    ACAccountStore(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACAccountType(lua_State *L)
{
    ACAccountType(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACAccountCredential(lua_State *L)
{
    ACAccountCredential(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaACAccountAPIs[] = {
    {"ACAccountType", lua_ACAccountType},
    {"ACAccountType", lua_ACAccountType},
    {"ACAccountStore", lua_ACAccountStore},
    {"ACAccountStore", lua_ACAccountStore},
    {"ACAccountType", lua_ACAccountType},
    {"ACAccountCredential", lua_ACAccountCredential},
    {NULL, NULL},
};

int LuaOpenACAccount(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaACAccountAPIs);
    return 0;
}
