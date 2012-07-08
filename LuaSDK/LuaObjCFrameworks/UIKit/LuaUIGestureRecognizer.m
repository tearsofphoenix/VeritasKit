//
//  LuaUIGestureRecognizer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIGestureRecognizer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIGestureRecognizerConstants[] = {
    {"UIGestureRecognizerStatePossible", UIGestureRecognizerStatePossible},
    {"UIGestureRecognizerStateBegan", UIGestureRecognizerStateBegan},
    {"UIGestureRecognizerStateChanged", UIGestureRecognizerStateChanged},
    {"UIGestureRecognizerStateEnded", UIGestureRecognizerStateEnded},
    {"UIGestureRecognizerStateCancelled", UIGestureRecognizerStateCancelled},
    {"UIGestureRecognizerStateFailed", UIGestureRecognizerStateFailed},
    {"UIGestureRecognizerStateRecognized", UIGestureRecognizerStateRecognized},
    {NULL, 0},
};


int LuaOpenUIGestureRecognizer(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIGestureRecognizerConstants);
    return 0;
}
