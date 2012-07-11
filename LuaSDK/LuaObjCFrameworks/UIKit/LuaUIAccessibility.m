//
//  LuaUIAccessibility.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIAccessibility.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaObjCAuxiliary.h"
/*
 {"UIAccessibilityVoiceOverStatusChanged", UIAccessibilityVoiceOverStatusChanged},
 {"UIAccessibilityClosedCaptioningStatusDidChangeNotification", UIAccessibilityClosedCaptioningStatusDidChangeNotification},
 {"UIAccessibilityMonoAudioStatusDidChangeNotification", UIAccessibilityMonoAudioStatusDidChangeNotification},
 */
static int luaUIKit_UIAccessibilityPostNotification(lua_State *L)
{
    UIAccessibilityPostNotification(luaL_checkunsigned(L, 1), luaObjC_checkNSObject(L, 2));
    return 0;
}

static int luaUIKit_UIAccessibilityIsVoiceOverRunning(lua_State *L)
{
    lua_pushboolean(L, UIAccessibilityIsVoiceOverRunning());
    return 1;
}

static int luaUIKit_UIAccessibilityIsMonoAudioEnabled(lua_State *L)
{
    lua_pushboolean(L, UIAccessibilityIsMonoAudioEnabled());
    return 1;
}

static int luaUIKit_UIAccessibilityIsClosedCaptioningEnabled(lua_State *L)
{
    lua_pushboolean(L, UIAccessibilityIsClosedCaptioningEnabled());
    return 1;
}

static int luaUIKit_UIAccessibilityZoomFocusChanged(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 2);
    UIAccessibilityZoomFocusChanged(luaL_checkunsigned(L, 1), *rect, luaObjC_checkNSObject(L, 3));
    return 0;
}

static int luaKit_UIAccessibilityRegisterGestureConflictWithZoom(lua_State *L)
{
    UIAccessibilityRegisterGestureConflictWithZoom();
    return 0;
}

static int luaUIKit_UIDeviceOrientationIsValidInterfaceOrientation(lua_State *L)
{
    lua_pushboolean(L, UIDeviceOrientationIsValidInterfaceOrientation(luaL_checkunsigned(L, 1)));
    return 1;
}

static int luaUIKit_UIInterfaceOrientationIsPortrait(lua_State *L)
{
    lua_pushboolean(L, UIInterfaceOrientationIsPortrait(luaL_checkunsigned(L, 1)));
    return 1;
}

static int luaUIKit_UIInterfaceOrientationIsLandscape(lua_State *L)
{
    lua_pushboolean(L, UIInterfaceOrientationIsLandscape(luaL_checkunsigned(L, 1)));
    return 1;
}

static int luaUIKit_UI_USER_INTERFACE_IDIOM(lua_State *L)
{
    lua_pushinteger(L, UI_USER_INTERFACE_IDIOM());
    return 1;
}

static int luaUIKit_UIDeviceOrientationIsPortrait(lua_State *L)
{
    lua_pushboolean(L, UIDeviceOrientationIsPortrait(luaL_checkunsigned(L, 1)));
    return 1;
}

static int luaUIKit_UIDeviceOrientationIsLandscape(lua_State *L)
{
    lua_pushboolean(L, UIDeviceOrientationIsLandscape(luaL_checkunsigned(L, 1)));
    return 1;
}

static const luaL_Reg __LuaUIAccessibilityAPIs[] = 
{
    //accessbility
    //
    {"UIAccessibilityPostNotification", luaUIKit_UIAccessibilityPostNotification},
    {"UIAccessibilityIsVoiceOverRunning",luaUIKit_UIAccessibilityIsVoiceOverRunning},
    {"UIAccessibilityIsMonoAudioEnabled", luaUIKit_UIAccessibilityIsMonoAudioEnabled},
    {"UIAccessibilityIsClosedCaptioningEnabled", luaUIKit_UIAccessibilityIsClosedCaptioningEnabled},
    
    {"UIAccessibilityZoomFocusChanged", luaUIKit_UIAccessibilityZoomFocusChanged},
    {"UIAccessibilityRegisterGestureConflictWithZoom", luaKit_UIAccessibilityRegisterGestureConflictWithZoom},
    
    {"UIDeviceOrientationIsValidInterfaceOrientation", luaUIKit_UIDeviceOrientationIsValidInterfaceOrientation},
    {"UIInterfaceOrientationIsPortrait", luaUIKit_UIInterfaceOrientationIsPortrait},
    {"UIInterfaceOrientationIsLandscape", luaUIKit_UIInterfaceOrientationIsLandscape},
    
    {"UI_USER_INTERFACE_IDIOM", luaUIKit_UI_USER_INTERFACE_IDIOM},        
    {"UIDeviceOrientationIsPortrait", luaUIKit_UIDeviceOrientationIsPortrait},
    {"UIDeviceOrientationIsLandscape", luaUIKit_UIDeviceOrientationIsLandscape},
    {NULL, NULL},
};

int LuaOpenUIAccessibility(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaUIAccessibilityAPIs);
    return 0;
}
