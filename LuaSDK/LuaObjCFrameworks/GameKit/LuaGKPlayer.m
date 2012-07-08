//
//  LuaGKPlayer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKPlayer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKPlayerDidChangeNotificationName(lua_State *L)
{
    GKPlayerDidChangeNotificationName(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKPlayerAPIs[] = {
    {"GKPlayerDidChangeNotificationName", lua_GKPlayerDidChangeNotificationName},
    {NULL, NULL},
};

int LuaOpenGKPlayer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKPlayerAPIs);
    return 0;
}
