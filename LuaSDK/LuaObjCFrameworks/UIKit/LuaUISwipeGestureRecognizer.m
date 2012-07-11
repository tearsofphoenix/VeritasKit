//
//  LuaUISwipeGestureRecognizer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUISwipeGestureRecognizer.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUISwipeGestureRecognizerConstants[] = {
    {"UISwipeGestureRecognizerDirectionRight", UISwipeGestureRecognizerDirectionRight},
    {"UISwipeGestureRecognizerDirectionLeft", UISwipeGestureRecognizerDirectionLeft},
    {"UISwipeGestureRecognizerDirectionUp", UISwipeGestureRecognizerDirectionUp},
    {"UISwipeGestureRecognizerDirectionDown", UISwipeGestureRecognizerDirectionDown},
    {NULL, 0},
};

int LuaOpenUISwipeGestureRecognizer(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUISwipeGestureRecognizerConstants);
    return 0;
}
