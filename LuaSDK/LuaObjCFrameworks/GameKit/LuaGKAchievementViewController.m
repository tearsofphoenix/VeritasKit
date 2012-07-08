//
//  LuaGKAchievementViewController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKAchievementViewController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKAchievementViewControllerDelegate(lua_State *L)
{
    GKAchievementViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKAchievementViewControllerDelegate(lua_State *L)
{
    GKAchievementViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKAchievementViewControllerDelegate(lua_State *L)
{
    GKAchievementViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKAchievementViewControllerAPIs[] = {
    {"GKAchievementViewControllerDelegate", lua_GKAchievementViewControllerDelegate},
    {"GKAchievementViewControllerDelegate", lua_GKAchievementViewControllerDelegate},
    {"GKAchievementViewControllerDelegate", lua_GKAchievementViewControllerDelegate},
    {NULL, NULL},
};

int LuaOpenGKAchievementViewController(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKAchievementViewControllerAPIs);
    return 0;
}
