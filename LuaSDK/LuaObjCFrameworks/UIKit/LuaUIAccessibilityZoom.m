//
//  LuaUIAccessibilityZoom.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIAccessibilityZoom.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"
static const LuaSDKConst __LuaUIAccessibilityZoomConstants[] = 
{
    {"UIAccessibilityZoomTypeInsertionPoint", UIAccessibilityZoomTypeInsertionPoint},
    {NULL, 0},
};


static int lua_UIAccessibilityRegisterGestureConflictWithZoom(lua_State *L)
{
    UIAccessibilityRegisterGestureConflictWithZoom();
    return 0;
}

static int lua_UIAccessibilityZoomFocusChanged(lua_State *L)
{
    UIAccessibilityZoomType type = lua_tointeger(L, 1);
    CGRect *frame = lua_touserdata(L, 2);
    UIView *view = luaObjC_checkNSObject(L, 3);
    UIAccessibilityZoomFocusChanged(type, *frame, view);
    return 0;
}


static const luaL_Reg __luaUIAccessibilityZoomAPIs[] = 
{
    {"UIAccessibilityRegisterGestureConflictWithZoom", lua_UIAccessibilityRegisterGestureConflictWithZoom},
    {"UIAccessibilityZoomFocusChanged", lua_UIAccessibilityZoomFocusChanged},
    {NULL, NULL},
};

int LuaOpenUIAccessibilityZoom(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaUIAccessibilityZoomConstants);
    luaObjC_loadGlobalFunctions(L, __luaUIAccessibilityZoomAPIs);
    return 0;
}
