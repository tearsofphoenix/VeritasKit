//
//  LuaGKFriendRequestComposeViewController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKFriendRequestComposeViewController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKFriendRequestComposeViewControllerDelegate(lua_State *L)
{
    GKFriendRequestComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKFriendRequestComposeViewControllerDelegate(lua_State *L)
{
    GKFriendRequestComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKFriendRequestComposeViewControllerDelegate(lua_State *L)
{
    GKFriendRequestComposeViewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKFriendRequestComposeViewControllerAPIs[] = {
    {"GKFriendRequestComposeViewControllerDelegate", lua_GKFriendRequestComposeViewControllerDelegate},
    {"GKFriendRequestComposeViewControllerDelegate", lua_GKFriendRequestComposeViewControllerDelegate},
    {"GKFriendRequestComposeViewControllerDelegate", lua_GKFriendRequestComposeViewControllerDelegate},
    {NULL, NULL},
};

int LuaOpenGKFriendRequestComposeViewController(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKFriendRequestComposeViewControllerAPIs);
    return 0;
}
