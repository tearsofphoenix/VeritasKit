//
//  LuaCABase.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCABase.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CACurrentMediaTime(lua_State *L)
{
    lua_pushnumber(L, CACurrentMediaTime());
    return 1;
}

static const luaL_Reg __LuaCABaseAPIs[] = 
{
    {"CACurrentMediaTime", lua_CACurrentMediaTime},
    {NULL, NULL},
};

int LuaOpenCABase(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCABaseAPIs);
    return 0;
}
