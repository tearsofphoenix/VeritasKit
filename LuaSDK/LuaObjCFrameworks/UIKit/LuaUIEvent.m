//
//  LuaUIEvent.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIEvent.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIEventConstants[] = {
    {"UIEventTypeTouches", UIEventTypeTouches},
    {"UIEventTypeMotion", UIEventTypeMotion},
    {"UIEventTypeRemoteControl", UIEventTypeRemoteControl},
    {"UIEventSubtypeNone", UIEventSubtypeNone},
    {"UIEventTypeMotion", UIEventTypeMotion},
    {"UIEventSubtypeMotionShake", UIEventSubtypeMotionShake},
    {"UIEventTypeRemoteControl", UIEventTypeRemoteControl},
    {"UIEventSubtypeRemoteControlPlay", UIEventSubtypeRemoteControlPlay},
    {"UIEventSubtypeRemoteControlPause", UIEventSubtypeRemoteControlPause},
    {"UIEventSubtypeRemoteControlStop", UIEventSubtypeRemoteControlStop},
    {"UIEventSubtypeRemoteControlTogglePlayPause", UIEventSubtypeRemoteControlTogglePlayPause},
    {"UIEventSubtypeRemoteControlNextTrack", UIEventSubtypeRemoteControlNextTrack},
    {"UIEventSubtypeRemoteControlPreviousTrack", UIEventSubtypeRemoteControlPreviousTrack},
    {"UIEventSubtypeRemoteControlBeginSeekingBackward", UIEventSubtypeRemoteControlBeginSeekingBackward},
    {"UIEventSubtypeRemoteControlEndSeekingBackward", UIEventSubtypeRemoteControlEndSeekingBackward},
    {"UIEventSubtypeRemoteControlBeginSeekingForward", UIEventSubtypeRemoteControlBeginSeekingForward},
    {"UIEventSubtypeRemoteControlEndSeekingForward", UIEventSubtypeRemoteControlEndSeekingForward},
    {NULL, 0},
};

int LuaOpenUIEvent(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIEventConstants);
    return 0;
}
