//
//  LuaUIMenuController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIMenuController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIMenuControllerConstants[] = {
    {"UIMenuControllerArrowDefault", UIMenuControllerArrowDefault},
    {"UIMenuControllerArrowUp", UIMenuControllerArrowUp},
    {"UIMenuControllerArrowDown", UIMenuControllerArrowDown},
    {"UIMenuControllerArrowLeft", UIMenuControllerArrowLeft},
    {"UIMenuControllerArrowRight", UIMenuControllerArrowRight},
    {NULL, 0},
};


int LuaOpenUIMenuController(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIMenuControllerConstants);
    return 0;
}
