//
//  LuaUIButton.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIButton.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIButtonConstants[] = {
    {"UIButtonTypeCustom", UIButtonTypeCustom},
    {"UIButtonTypeRoundedRect", UIButtonTypeRoundedRect},
    {"UIButtonTypeDetailDisclosure", UIButtonTypeDetailDisclosure},
    {"UIButtonTypeInfoLight", UIButtonTypeInfoLight},
    {"UIButtonTypeInfoDark", UIButtonTypeInfoDark},
    {"UIButtonTypeContactAdd", UIButtonTypeContactAdd},
    {NULL, 0},
};

int LuaOpenUIButton(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIButtonConstants);
    return 0;
}
