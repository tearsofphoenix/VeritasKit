//
//  LuaNSAttributedString.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSAttributedString.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaNSAttributedStringConstants[] = 
{
    {"NSAttributedStringEnumerationReverse", NSAttributedStringEnumerationReverse},
    {"NSAttributedStringEnumerationLongestEffectiveRangeNotRequired", NSAttributedStringEnumerationLongestEffectiveRangeNotRequired},
    {NULL, 0},
};

int LuaOpenNSAttributedString(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaNSAttributedStringConstants);
    return 0;
}
