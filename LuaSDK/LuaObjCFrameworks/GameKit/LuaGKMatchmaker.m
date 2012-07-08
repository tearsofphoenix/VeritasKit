//
//  LuaGKMatchmaker.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKMatchmaker.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKMatchmakerViewController(lua_State *L)
{
    GKMatchmakerViewController(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKMatchmakerAPIs[] = {
    {"GKMatchmakerViewController", lua_GKMatchmakerViewController},
    {NULL, NULL},
};

int LuaOpenGKMatchmaker(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKMatchmakerAPIs);
    return 0;
}
