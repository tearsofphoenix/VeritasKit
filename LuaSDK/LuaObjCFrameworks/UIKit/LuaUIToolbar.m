//
//  LuaUIToolbar.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIToolbar.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIToolbarConstants[] = {
    {"UIToolbarPositionAny", UIToolbarPositionAny},
    {"UIToolbarPositionBottom", UIToolbarPositionBottom},
    {"UIToolbarPositionTop", UIToolbarPositionTop},
    {NULL, 0},
};


int LuaOpenUIToolbar(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIToolbarConstants);
    return 0;
}
