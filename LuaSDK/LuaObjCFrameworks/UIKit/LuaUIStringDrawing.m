//
//  LuaUIStringDrawing.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIStringDrawing.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIStringDrawingConstants[] = {
    {"UILineBreakModeWordWrap", UILineBreakModeWordWrap},
    {"UILineBreakModeCharacterWrap", UILineBreakModeCharacterWrap},
    {"UILineBreakModeClip", UILineBreakModeClip},
    {"UILineBreakModeHeadTruncation", UILineBreakModeHeadTruncation},
    {"UILineBreakModeTailTruncation", UILineBreakModeTailTruncation},
    {"UILineBreakModeMiddleTruncation", UILineBreakModeMiddleTruncation},
    {"UITextAlignmentLeft", UITextAlignmentLeft},
    {"UITextAlignmentCenter", UITextAlignmentCenter},
    {"UITextAlignmentRight", UITextAlignmentRight},
    {"UIBaselineAdjustmentAlignBaselines", UIBaselineAdjustmentAlignBaselines},
    {"UIBaselineAdjustmentAlignCenters", UIBaselineAdjustmentAlignCenters},
    {"UIBaselineAdjustmentNone", UIBaselineAdjustmentNone},
    {NULL, 0},
};

int LuaOpenUIStringDrawing(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIStringDrawingConstants);
    return 0;
}
