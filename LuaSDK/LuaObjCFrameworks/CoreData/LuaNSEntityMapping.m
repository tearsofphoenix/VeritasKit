//
//  LuaNSEntityMapping.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSEntityMapping.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_NSEntityMappingType(lua_State *L)
{
    NSEntityMappingType(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSEntityMappingType(lua_State *L)
{
    NSEntityMappingType(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSEntityMappingType(lua_State *L)
{
    NSEntityMappingType(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSEntityMappingType(lua_State *L)
{
    NSEntityMappingType(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaNSEntityMappingAPIs[] = {
    {"NSEntityMappingType", lua_NSEntityMappingType},
    {"NSEntityMappingType", lua_NSEntityMappingType},
    {"NSEntityMappingType", lua_NSEntityMappingType},
    {"NSEntityMappingType", lua_NSEntityMappingType},
    {NULL, NULL},
};

int LuaOpenNSEntityMapping(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSEntityMappingAPIs);
    return 0;
}
