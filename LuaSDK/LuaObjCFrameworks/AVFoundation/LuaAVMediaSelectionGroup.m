//
//  LuaAVMediaSelectionGroup.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVMediaSelectionGroup.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVMediaSelectionGroupInternal(lua_State *L)
{
    AVMediaSelectionGroupInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVMediaSelectionGroupInternal(lua_State *L)
{
    AVMediaSelectionGroupInternal(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVMediaSelectionGroupAPIs[] = {
    {"AVMediaSelectionGroupInternal", lua_AVMediaSelectionGroupInternal},
    {"AVMediaSelectionGroupInternal", lua_AVMediaSelectionGroupInternal},
    {NULL, NULL},
};

int LuaOpenAVMediaSelectionGroup(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVMediaSelectionGroupAPIs);
    return 0;
}
