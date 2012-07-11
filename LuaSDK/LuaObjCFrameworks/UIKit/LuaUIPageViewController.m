//
//  LuaUIPageViewController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIPageViewController.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIPageViewControllerConstants[] = {
    {"UIPageViewControllerNavigationOrientationHorizontal", UIPageViewControllerNavigationOrientationHorizontal},
    {"UIPageViewControllerNavigationOrientationVertical", UIPageViewControllerNavigationOrientationVertical},
    {"UIPageViewControllerSpineLocationNone", UIPageViewControllerSpineLocationNone},
    {"UIPageViewControllerSpineLocationMin", UIPageViewControllerSpineLocationMin},
    {"UIPageViewControllerSpineLocationMid", UIPageViewControllerSpineLocationMid},
    {"UIPageViewControllerSpineLocationMax", UIPageViewControllerSpineLocationMax},
    {"UIPageViewControllerNavigationDirectionForward", UIPageViewControllerNavigationDirectionForward},
    {"UIPageViewControllerNavigationDirectionReverse", UIPageViewControllerNavigationDirectionReverse},
    {"UIPageViewControllerTransitionStylePageCurl", UIPageViewControllerTransitionStylePageCurl},
    {NULL, 0},
};


int LuaOpenUIPageViewController(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIPageViewControllerConstants);
    return 0;
}
