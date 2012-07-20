//
//  LuaUIKit.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIKit.h"

#import "LuaCoreGraphics.h"

#import "LuaUIAccessibility.h"
#import "LuaUIGeometry.h"
#import "LuaUIGraphics.h"
#import "LuaUIView.h"
#import "LuaObjCFrameworkFunctions.h"

#import "lauxlib.h"

static int lua_UIKitIndex(struct lua_State *L)
{
    return 0;
}

static int lua_UIKitNewIndex(struct lua_State *L)
{
    return 0;
}

static const luaL_Reg __lua_UIKitMetaMethods[] =
{
    {"__gc", luaObjCInternal_StructGarbageCollection},
    {"__index", lua_UIKitIndex},
    {"__newindex", lua_UIKitNewIndex},
    {NULL, NULL},
};

int LuaOpenUIKit(struct lua_State *L)
{
    //load CoreGraphics
    //
    LuaOpenCoreGraphics(L);
        
    LuaOpenUIAccessibility(L);
    LuaOpenUIGeometry(L);
    LuaOpenUIGraphics(L);

    LuaOpenUIView(L);

    return 0;
}
