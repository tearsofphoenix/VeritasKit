//
//  LuaSecIdentity.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSecIdentity.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SecIdentityGetTypeID(lua_State *L)
{
    SecIdentityGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecIdentityGetTypeID(lua_State *L)
{
    SecIdentityGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecIdentityCopyCertificate(lua_State *L)
{
    SecIdentityCopyCertificate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecIdentityCopyCertificate(lua_State *L)
{
    SecIdentityCopyCertificate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecIdentityRef(lua_State *L)
{
    SecIdentityRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecIdentityCopyPrivateKey(lua_State *L)
{
    SecIdentityCopyPrivateKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecIdentityCopyPrivateKey(lua_State *L)
{
    SecIdentityCopyPrivateKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecIdentityRef(lua_State *L)
{
    SecIdentityRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSecIdentityAPIs[] = {
    {"SecIdentityGetTypeID", lua_SecIdentityGetTypeID},
    {"SecIdentityGetTypeID", lua_SecIdentityGetTypeID},
    {"SecIdentityCopyCertificate", lua_SecIdentityCopyCertificate},
    {"SecIdentityCopyCertificate", lua_SecIdentityCopyCertificate},
    {"SecIdentityRef", lua_SecIdentityRef},
    {"SecIdentityCopyPrivateKey", lua_SecIdentityCopyPrivateKey},
    {"SecIdentityCopyPrivateKey", lua_SecIdentityCopyPrivateKey},
    {"SecIdentityRef", lua_SecIdentityRef},
    {NULL, NULL},
};

int LuaOpenSecIdentity(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSecIdentityAPIs);
    return 0;
}
