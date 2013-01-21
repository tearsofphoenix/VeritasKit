//
//  LuaUIAccessibility.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIAccessibility.h"
#import "VMKAuxiliary.h"

static int luaUIKit_UIAccessibilityZoomFocusChanged(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 2);
    UIAccessibilityZoomFocusChanged(luaL_checkunsigned(L, 1), *rect, VMKCheckObject(L, 3));
    return 0;
}

static const luaL_Reg __LuaUIAccessibilityAPIs[] = 
{
    {"UIAccessibilityZoomFocusChanged", luaUIKit_UIAccessibilityZoomFocusChanged},        
    {NULL, NULL},
};

int VMKOpenUIAccessibility(lua_State *L)
{
    VMKLoadGlobalFunctions(L, __LuaUIAccessibilityAPIs);
    return 0;
}
