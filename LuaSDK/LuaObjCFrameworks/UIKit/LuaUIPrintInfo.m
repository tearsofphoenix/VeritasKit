//
//  LuaUIPrintInfo.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIPrintInfo.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIPrintInfoConstants[] = {
    {"UIPrintInfoOutputGeneral", UIPrintInfoOutputGeneral},
    {"UIPrintInfoOutputPhoto", UIPrintInfoOutputPhoto},
    {"UIPrintInfoOutputGrayscale", UIPrintInfoOutputGrayscale},
    {"UIPrintInfoOrientationPortrait", UIPrintInfoOrientationPortrait},
    {"UIPrintInfoOrientationLandscape", UIPrintInfoOrientationLandscape},
    {"UIPrintInfoDuplexNone", UIPrintInfoDuplexNone},
    {"UIPrintInfoDuplexLongEdge", UIPrintInfoDuplexLongEdge},
    {"UIPrintInfoDuplexShortEdge", UIPrintInfoDuplexShortEdge},
    {NULL, 0},
};

int LuaOpenUIPrintInfo(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIPrintInfoConstants);
    return 0;
}
