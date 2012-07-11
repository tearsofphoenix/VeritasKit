//
//  LuaUIDataDetectors.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIDataDetectors.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIDataDetectorConstants[] = {
    {"UIDataDetectorTypePhoneNumber", UIDataDetectorTypePhoneNumber},
    {"UIDataDetectorTypeLink", UIDataDetectorTypeLink},
    {"UIDataDetectorTypeAddress", UIDataDetectorTypeAddress},
    {"UIDataDetectorTypeCalendarEvent", UIDataDetectorTypeCalendarEvent},
    {"UIDataDetectorTypeNone", UIDataDetectorTypeNone},
    {"UIDataDetectorTypeAll", UIDataDetectorTypeAll},
    {NULL, 0},
};


int LuaOpenUIDataDetectors(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIDataDetectorConstants);
    return 0;
}
