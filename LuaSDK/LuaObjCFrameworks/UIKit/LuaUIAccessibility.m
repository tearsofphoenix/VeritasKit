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

static int luaUIKit_UIAccessibilityZoomFocusChanged(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 2);
    UIAccessibilityZoomFocusChanged(luaL_checkunsigned(L, 1), *rect, luaObjC_checkNSObject(L, 3));
    return 0;
}

static const luaL_Reg __LuaUIAccessibilityAPIs[] = 
{
    //accessbility
    //
    
    {"UIAccessibilityZoomFocusChanged", luaUIKit_UIAccessibilityZoomFocusChanged},
        
    {NULL, NULL},
};

int LuaOpenUIAccessibility(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaUIAccessibilityAPIs);
    return 0;
}
