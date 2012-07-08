//
//  LuaUIControl.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIControl.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIControlConstants[] = 
{
    {"UIControlEventTouchDown", UIControlEventTouchDown},
    {"UIControlEventTouchDownRepeat", UIControlEventTouchDownRepeat},
    {"UIControlEventTouchDragInside", UIControlEventTouchDragInside},
    {"UIControlEventTouchDragOutside", UIControlEventTouchDragOutside},
    {"UIControlEventTouchDragEnter", UIControlEventTouchDragEnter},
    {"UIControlEventTouchDragExit", UIControlEventTouchDragExit},
    {"UIControlEventTouchUpInside", UIControlEventTouchUpInside},
    {"UIControlEventTouchUpOutside", UIControlEventTouchUpOutside},
    {"UIControlEventTouchCancel", UIControlEventTouchCancel},
    {"UIControlEventValueChanged", UIControlEventValueChanged},
    {"UIControlEventEditingDidBegin", UIControlEventEditingDidBegin},
    {"UIControlEventEditingChanged", UIControlEventEditingChanged},
    {"UIControlEventEditingDidEnd", UIControlEventEditingDidEnd},
    {"UIControlEventEditingDidEndOnExit", UIControlEventEditingDidEndOnExit},
    {"UIControlEventAllTouchEvents", UIControlEventAllTouchEvents},
    {"UIControlEventAllEditingEvents", UIControlEventAllEditingEvents},
    {"UIControlEventApplicationReserved", UIControlEventApplicationReserved},
    {"UIControlEventSystemReserved", UIControlEventSystemReserved},
    {"UIControlEventAllEvents", UIControlEventAllEvents},
    {"UIControlContentVerticalAlignmentCenter", UIControlContentVerticalAlignmentCenter},
    {"UIControlContentVerticalAlignmentTop", UIControlContentVerticalAlignmentTop},
    {"UIControlContentVerticalAlignmentBottom", UIControlContentVerticalAlignmentBottom},
    {"UIControlContentVerticalAlignmentFill", UIControlContentVerticalAlignmentFill},
    {"UIControlContentHorizontalAlignmentCenter", UIControlContentHorizontalAlignmentCenter},
    {"UIControlContentHorizontalAlignmentLeft", UIControlContentHorizontalAlignmentLeft},
    {"UIControlContentHorizontalAlignmentRight", UIControlContentHorizontalAlignmentRight},
    {"UIControlContentHorizontalAlignmentFill", UIControlContentHorizontalAlignmentFill},
    {"UIControlStateNormal", UIControlStateNormal},
    {"UIControlStateHighlighted", UIControlStateHighlighted},
    {"UIControlStateDisabled", UIControlStateDisabled},
    {"UIControlStateSelected", UIControlStateSelected},
    {"UIControlStateApplication", UIControlStateApplication},
    {"UIControlStateReserved", UIControlStateReserved},
    {NULL, 0},
};


int LuaOpenUIControl(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIControlConstants);
    return 0;
}
