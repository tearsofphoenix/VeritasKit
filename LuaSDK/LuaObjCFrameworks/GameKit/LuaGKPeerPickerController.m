//
//  LuaGKPeerPickerController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKPeerPickerController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKPeerPickerControllerDelegate(lua_State *L)
{
    GKPeerPickerControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKPeerPickerControllerDelegate(lua_State *L)
{
    GKPeerPickerControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKPeerPickerControllerDelegate(lua_State *L)
{
    GKPeerPickerControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKPeerPickerControllerAPIs[] = {
    {"GKPeerPickerControllerDelegate", lua_GKPeerPickerControllerDelegate},
    {"GKPeerPickerControllerDelegate", lua_GKPeerPickerControllerDelegate},
    {"GKPeerPickerControllerDelegate", lua_GKPeerPickerControllerDelegate},
    {NULL, NULL},
};

int LuaOpenGKPeerPickerController(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKPeerPickerControllerAPIs);
    return 0;
}
