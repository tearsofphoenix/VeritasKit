//
//  LuaGKMatchmakerViewController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKMatchmakerViewController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKMatchmakerViewControllerDelegate(lua_State *L)
{
    GKMatchmakerViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKMatchmakerViewControllerDelegate(lua_State *L)
{
    GKMatchmakerViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKMatchmakerViewControllerDelegate(lua_State *L)
{
    GKMatchmakerViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKMatchmakerViewControllerAPIs[] = {
    {"GKMatchmakerViewControllerDelegate", lua_GKMatchmakerViewControllerDelegate},
    {"GKMatchmakerViewControllerDelegate", lua_GKMatchmakerViewControllerDelegate},
    {"GKMatchmakerViewControllerDelegate", lua_GKMatchmakerViewControllerDelegate},
    {NULL, NULL},
};

int LuaOpenGKMatchmakerViewController(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKMatchmakerViewControllerAPIs);
    return 0;
}
