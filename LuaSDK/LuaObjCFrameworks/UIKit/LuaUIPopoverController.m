//
//  LuaUIPopoverController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIPopoverController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIPopoverConstants[] = {
    {"UIPopoverArrowDirectionUp", UIPopoverArrowDirectionUp},
    {"UIPopoverArrowDirectionDown", UIPopoverArrowDirectionDown},
    {"UIPopoverArrowDirectionLeft", UIPopoverArrowDirectionLeft},
    {"UIPopoverArrowDirectionRight", UIPopoverArrowDirectionRight},
    {"UIPopoverArrowDirectionAny", UIPopoverArrowDirectionAny},
    {"UIPopoverArrowDirectionUnknown", UIPopoverArrowDirectionUnknown},
    {NULL, 0},
};

int LuaOpenUIPopoverController(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIPopoverConstants);
    return 0;
}
