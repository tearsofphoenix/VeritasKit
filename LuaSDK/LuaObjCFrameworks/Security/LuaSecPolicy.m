//
//  LuaSecPolicy.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSecPolicy.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SecPolicyRef(lua_State *L)
{
    SecPolicyRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecPolicyRef(lua_State *L)
{
    SecPolicyRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecPolicyGetTypeID(lua_State *L)
{
    SecPolicyGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecPolicyGetTypeID(lua_State *L)
{
    SecPolicyGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecPolicyCreateBasicX509(lua_State *L)
{
    SecPolicyCreateBasicX509(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecPolicyRef(lua_State *L)
{
    SecPolicyRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecPolicyCreateSSL(lua_State *L)
{
    SecPolicyCreateSSL(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecPolicyRef(lua_State *L)
{
    SecPolicyRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSecPolicyAPIs[] = {
    {"SecPolicyRef", lua_SecPolicyRef},
    {"SecPolicyRef", lua_SecPolicyRef},
    {"SecPolicyGetTypeID", lua_SecPolicyGetTypeID},
    {"SecPolicyGetTypeID", lua_SecPolicyGetTypeID},
    {"SecPolicyCreateBasicX509", lua_SecPolicyCreateBasicX509},
    {"SecPolicyRef", lua_SecPolicyRef},
    {"SecPolicyCreateSSL", lua_SecPolicyCreateSSL},
    {"SecPolicyRef", lua_SecPolicyRef},
    {NULL, NULL},
};

int LuaOpenSecPolicy(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSecPolicyAPIs);
    return 0;
}
