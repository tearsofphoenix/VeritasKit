//
//  LuaACError.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaACError.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_ACErrorDomain(lua_State *L)
{
    ACErrorDomain(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACErrorCode(lua_State *L)
{
    ACErrorCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACErrorUnknown(lua_State *L)
{
    ACErrorUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACErrorAccountMissingRequiredProperty(lua_State *L)
{
    ACErrorAccountMissingRequiredProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACErrorAccountAuthenticationFailed(lua_State *L)
{
    ACErrorAccountAuthenticationFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACErrorAccountTypeInvalid(lua_State *L)
{
    ACErrorAccountTypeInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACErrorAccountAlreadyExists(lua_State *L)
{
    ACErrorAccountAlreadyExists(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACErrorAccountNotFound(lua_State *L)
{
    ACErrorAccountNotFound(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACErrorPermissionDenied(lua_State *L)
{
    ACErrorPermissionDenied(lua_touserdata(L, 1));
    return 1;
}

static int lua_ACErrorCode(lua_State *L)
{
    ACErrorCode(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaACErrorAPIs[] = {
    {"ACErrorDomain", lua_ACErrorDomain},
    {"ACErrorCode", lua_ACErrorCode},
    {"ACErrorUnknown", lua_ACErrorUnknown},
    {"ACErrorAccountMissingRequiredProperty", lua_ACErrorAccountMissingRequiredProperty},
    {"ACErrorAccountAuthenticationFailed", lua_ACErrorAccountAuthenticationFailed},
    {"ACErrorAccountTypeInvalid", lua_ACErrorAccountTypeInvalid},
    {"ACErrorAccountAlreadyExists", lua_ACErrorAccountAlreadyExists},
    {"ACErrorAccountNotFound", lua_ACErrorAccountNotFound},
    {"ACErrorPermissionDenied", lua_ACErrorPermissionDenied},
    {"ACErrorCode", lua_ACErrorCode},
    {NULL, NULL},
};

int LuaOpenACError(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaACErrorAPIs);
    return 0;
}
