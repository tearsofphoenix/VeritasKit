//
//  LuaUIApplication.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIApplication.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIConstants[] = 
{
    /*
    {"UIStatusBarStyleDefault", UIStatusBarStyleDefault},
    {"UIStatusBarStyleBlackTranslucent", UIStatusBarStyleBlackTranslucent},
    {"UIStatusBarStyleBlackOpaque", UIStatusBarStyleBlackOpaque},
    {"UIStatusBarAnimationNone", UIStatusBarAnimationNone},
    {"UIStatusBarAnimationFade", UIStatusBarAnimationFade},
    {"UIStatusBarAnimationSlide", UIStatusBarAnimationSlide},
    {"UIInterfaceOrientationPortrait", UIInterfaceOrientationPortrait},
    {"UIInterfaceOrientationPortraitUpsideDown", UIInterfaceOrientationPortraitUpsideDown},
    {"UIInterfaceOrientationLandscapeLeft", UIInterfaceOrientationLandscapeLeft},
    {"UIInterfaceOrientationLandscapeRight", UIInterfaceOrientationLandscapeRight},
    {"UIRemoteNotificationTypeNone", UIRemoteNotificationTypeNone},
    {"UIRemoteNotificationTypeBadge", UIRemoteNotificationTypeBadge},
    {"UIRemoteNotificationTypeSound", UIRemoteNotificationTypeSound},
    {"UIRemoteNotificationTypeAlert", UIRemoteNotificationTypeAlert},
    {"UIRemoteNotificationTypeNewsstandContentAvailability", UIRemoteNotificationTypeNewsstandContentAvailability},
    {"UIApplicationStateActive", UIApplicationStateActive},
    {"UIApplicationStateInactive", UIApplicationStateInactive},
    {"UIApplicationStateBackground", UIApplicationStateBackground},
    {"UIBackgroundTaskInvalid", UIBackgroundTaskInvalid},
    {"UIUserInterfaceLayoutDirectionLeftToRight", UIUserInterfaceLayoutDirectionLeftToRight},
    {"UIUserInterfaceLayoutDirectionRightToLeft", UIUserInterfaceLayoutDirectionRightToLeft},
     */
    {NULL, 0},
};

static int lua_UIApplicationMain(lua_State *L)
{
    int argc = luaL_checkinteger(L, 1);
    const char **argv =  NULL;

    NSString * principalClassName = luaObjC_checkNSObject(L, 3);
    NSString * delegateClassName = luaObjC_checkNSObject(L, 4);
    
    lua_pushinteger(L, UIApplicationMain(argc, (char **)argv, principalClassName, delegateClassName));
    
    return 1;
}

static const luaL_Reg __luaUIApplicationAPIs[] = 
{
    {"UIApplicationMain", lua_UIApplicationMain},
    {NULL, NULL},
};

int LuaOpenUIApplication(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIConstants);
    luaObjC_loadGlobalFunctions(L, __luaUIApplicationAPIs);
    return 0;
}
