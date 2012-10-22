//
//  LuaUIAccessibility.m
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIAccessibility.h"
#import "LuaObjCAuxiliary.h"

static int luaUIKit_UIAccessibilityZoomFocusChanged(lua_State *L)
{
    CGRect *rect = lua_touserdata(L, 2);
    UIAccessibilityZoomFocusChanged(luaL_checkunsigned(L, 1), *rect, LuaObjCCheckObject(L, 3));
    return 0;
}

static const luaL_Reg __LuaUIAccessibilityAPIs[] = 
{
    {"UIAccessibilityZoomFocusChanged", luaUIKit_UIAccessibilityZoomFocusChanged},        
    {NULL, NULL},
};

int LuaObjCOpenUIAccessibility(lua_State *L)
{
    LuaObjCLoadGlobalFunctions(L, __LuaUIAccessibilityAPIs);
    return 0;
}
