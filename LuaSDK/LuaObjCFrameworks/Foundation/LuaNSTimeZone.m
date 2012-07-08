//
//  LuaNSTimeZone.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSTimeZone.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSTimeZoneConstants[] = 
{
    {"NSTimeZoneNameStyleStandard", NSTimeZoneNameStyleStandard},
    {"NSTimeZoneNameStyleShortStandard", NSTimeZoneNameStyleShortStandard},
    {"NSTimeZoneNameStyleDaylightSaving", NSTimeZoneNameStyleDaylightSaving},
    {"NSTimeZoneNameStyleShortDaylightSaving", NSTimeZoneNameStyleShortDaylightSaving},
    {"NSTimeZoneNameStyleGeneric", NSTimeZoneNameStyleGeneric},
    {"NSTimeZoneNameStyleShortGeneric", NSTimeZoneNameStyleShortGeneric},
    {NULL, 0},
};

int LuaOpenNSTimeZone(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSTimeZoneConstants);
    return 0;
}
