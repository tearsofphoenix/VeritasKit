//
//  LuaSKError.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSKError.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SKErrorDomain(lua_State *L)
{
    SKErrorDomain(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKErrorDomain(lua_State *L)
{
    SKErrorDomain(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKErrorUnknown(lua_State *L)
{
    SKErrorUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKErrorClientInvalid(lua_State *L)
{
    SKErrorClientInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKErrorPaymentCancelled(lua_State *L)
{
    SKErrorPaymentCancelled(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKErrorPaymentInvalid(lua_State *L)
{
    SKErrorPaymentInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_SKErrorPaymentNotAllowed(lua_State *L)
{
    SKErrorPaymentNotAllowed(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSKErrorAPIs[] = {
    {"SKErrorDomain", lua_SKErrorDomain},
    {"SKErrorDomain", lua_SKErrorDomain},
    {"SKErrorUnknown", lua_SKErrorUnknown},
    {"SKErrorClientInvalid", lua_SKErrorClientInvalid},
    {"SKErrorPaymentCancelled", lua_SKErrorPaymentCancelled},
    {"SKErrorPaymentInvalid", lua_SKErrorPaymentInvalid},
    {"SKErrorPaymentNotAllowed", lua_SKErrorPaymentNotAllowed},
    {NULL, NULL},
};

int LuaOpenSKError(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSKErrorAPIs);
    return 0;
}
