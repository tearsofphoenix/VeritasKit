//
//  LuaMPMediaPickerController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMPMediaPickerController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MPMediaPickerControllerInternal(lua_State *L)
{
    MPMediaPickerControllerInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPickerControllerDelegate(lua_State *L)
{
    MPMediaPickerControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPickerControllerInternal(lua_State *L)
{
    MPMediaPickerControllerInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPickerControllerDelegate(lua_State *L)
{
    MPMediaPickerControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaPickerControllerDelegate(lua_State *L)
{
    MPMediaPickerControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMPMediaPickerControllerAPIs[] = {
    {"MPMediaPickerControllerInternal", lua_MPMediaPickerControllerInternal},
    {"MPMediaPickerControllerDelegate", lua_MPMediaPickerControllerDelegate},
    {"MPMediaPickerControllerInternal", lua_MPMediaPickerControllerInternal},
    {"MPMediaPickerControllerDelegate", lua_MPMediaPickerControllerDelegate},
    {"MPMediaPickerControllerDelegate", lua_MPMediaPickerControllerDelegate},
    {NULL, NULL},
};

int LuaOpenMPMediaPickerController(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMPMediaPickerControllerAPIs);
    return 0;
}
