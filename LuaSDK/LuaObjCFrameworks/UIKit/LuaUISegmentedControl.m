//
//  LuaUISegmentedControl.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUISegmentedControl.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUISegmentedControlConstants[] = {
    {"UISegmentedControlStylePlain", UISegmentedControlStylePlain},
    {"UISegmentedControlStyleBordered", UISegmentedControlStyleBordered},
    {"UISegmentedControlStyleBar", UISegmentedControlStyleBar},
    {"UISegmentedControlStyleBezeled", UISegmentedControlStyleBezeled},
    {"UISegmentedControlNoSegment", UISegmentedControlNoSegment},
    {"UISegmentedControlSegmentAny", UISegmentedControlSegmentAny},
    {"UISegmentedControlSegmentLeft", UISegmentedControlSegmentLeft},
    {"UISegmentedControlSegmentCenter", UISegmentedControlSegmentCenter},
    {"UISegmentedControlSegmentRight", UISegmentedControlSegmentRight},
    {"UISegmentedControlSegmentAlone", UISegmentedControlSegmentAlone},
    {NULL, 0},
};


int LuaOpenUISegmentedControl(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUISegmentedControlConstants);
    return 0;
}
