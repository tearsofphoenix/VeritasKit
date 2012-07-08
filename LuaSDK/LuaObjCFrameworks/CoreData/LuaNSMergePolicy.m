//
//  LuaNSMergePolicy.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSMergePolicy.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_NSMergePolicyType(lua_State *L)
{
    NSMergePolicyType(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSMergePolicyType(lua_State *L)
{
    NSMergePolicyType(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSMergePolicyType(lua_State *L)
{
    NSMergePolicyType(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSMergePolicyType(lua_State *L)
{
    NSMergePolicyType(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaNSMergePolicyAPIs[] = {
    {"NSMergePolicyType", lua_NSMergePolicyType},
    {"NSMergePolicyType", lua_NSMergePolicyType},
    {"NSMergePolicyType", lua_NSMergePolicyType},
    {"NSMergePolicyType", lua_NSMergePolicyType},
    {NULL, NULL},
};

int LuaOpenNSMergePolicy(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSMergePolicyAPIs);
    return 0;
}
