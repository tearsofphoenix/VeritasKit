//
//  LuaUIDevice.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIDevice.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIDeviceConstants[] = {
    {"UIDeviceOrientationUnknown", UIDeviceOrientationUnknown},
    {"UIDeviceOrientationPortrait", UIDeviceOrientationPortrait},
    {"UIDeviceOrientationPortraitUpsideDown", UIDeviceOrientationPortraitUpsideDown},
    {"UIDeviceOrientationLandscapeLeft", UIDeviceOrientationLandscapeLeft},
    {"UIDeviceOrientationLandscapeRight", UIDeviceOrientationLandscapeRight},
    {"UIDeviceOrientationFaceUp", UIDeviceOrientationFaceUp},
    {"UIDeviceOrientationFaceDown", UIDeviceOrientationFaceDown},
    {"UIDeviceBatteryStateUnknown", UIDeviceBatteryStateUnknown},
    {"UIDeviceBatteryStateUnplugged", UIDeviceBatteryStateUnplugged},
    {"UIDeviceBatteryStateCharging", UIDeviceBatteryStateCharging},
    {"UIDeviceBatteryStateFull", UIDeviceBatteryStateFull},
    {NULL, 0},
};

int LuaOpenUIDevice(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIDeviceConstants);
    return 0;
}
