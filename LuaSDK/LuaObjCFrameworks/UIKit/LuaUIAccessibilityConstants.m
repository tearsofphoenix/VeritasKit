//
//  LuaUIAccessibilityConstants.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIAccessibilityConstants.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaCGContextConstants[] = 
{
    /*
    {"UIAccessibilityTraitNone", UIAccessibilityTraitNone},
    {"UIAccessibilityTraitButton", UIAccessibilityTraitButton},
    {"UIAccessibilityTraitLink", UIAccessibilityTraitLink},
    {"UIAccessibilityTraitSearchField", UIAccessibilityTraitSearchField},
    {"UIAccessibilityTraitImage", UIAccessibilityTraitImage},
    {"UIAccessibilityTraitSelected", UIAccessibilityTraitSelected},
    {"UIAccessibilityTraitPlaysSound", UIAccessibilityTraitPlaysSound},
    {"UIAccessibilityTraitKeyboardKey", UIAccessibilityTraitKeyboardKey},
    {"UIAccessibilityTraitStaticText", UIAccessibilityTraitStaticText},
    {"UIAccessibilityTraitSummaryElement", UIAccessibilityTraitSummaryElement},
    {"UIAccessibilityTraitNotEnabled", UIAccessibilityTraitNotEnabled},
    {"UIAccessibilityTraitUpdatesFrequently", UIAccessibilityTraitUpdatesFrequently},
    {"UIAccessibilityTraitStartsMediaSession", UIAccessibilityTraitStartsMediaSession},
    {"UIAccessibilityTraitAdjustable", UIAccessibilityTraitAdjustable},
    {"UIAccessibilityTraitAllowsDirectInteraction", UIAccessibilityTraitAllowsDirectInteraction},
    {"UIAccessibilityTraitCausesPageTurn", UIAccessibilityTraitCausesPageTurn},
    {"UIAccessibilityScreenChangedNotification", UIAccessibilityScreenChangedNotification},
    {"UIAccessibilityLayoutChangedNotification", UIAccessibilityLayoutChangedNotification},
    {"UIAccessibilityAnnouncementNotification", UIAccessibilityAnnouncementNotification},
    {"UIAccessibilityPageScrolledNotification", UIAccessibilityPageScrolledNotification},
     */
    {NULL, 0},
};

int LuaOpenUIAccessibilityConstants(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaCGContextConstants);
    return 0;
}
