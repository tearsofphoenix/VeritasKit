//
//  LuaUIInterface.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIInterface.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIBarStyleConstants[] = 
{
    {"UIBarStyleDefault", UIBarStyleDefault},
    {"UIBarStyleBlack", UIBarStyleBlack},
    {"UIBarStyleBlackOpaque", UIBarStyleBlackOpaque},
    {"UIBarStyleBlackTranslucent", UIBarStyleBlackTranslucent},
    {NULL, 0},
};

int LuaOpenUIInterface(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIBarStyleConstants);
    return 0;
}
