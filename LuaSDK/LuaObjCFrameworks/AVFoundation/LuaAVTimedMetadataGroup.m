//
//  LuaAVTimedMetadataGroup.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVTimedMetadataGroup.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVTimedMetadataGroupInternal(lua_State *L)
{
    AVTimedMetadataGroupInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVTimedMetadataGroupInternal(lua_State *L)
{
    AVTimedMetadataGroupInternal(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVTimedMetadataGroupAPIs[] = {
    {"AVTimedMetadataGroupInternal", lua_AVTimedMetadataGroupInternal},
    {"AVTimedMetadataGroupInternal", lua_AVTimedMetadataGroupInternal},
    {NULL, NULL},
};

int LuaOpenAVTimedMetadataGroup(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVTimedMetadataGroupAPIs);
    return 0;
}
