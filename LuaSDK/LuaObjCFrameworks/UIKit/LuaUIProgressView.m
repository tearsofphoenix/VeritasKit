//
//  LuaUIProgressView.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIProgressView.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIProgressViewConstants[] = {
    {"UIProgressViewStyleDefault", UIProgressViewStyleDefault},
    {"UIProgressViewStyleBar", UIProgressViewStyleBar},
    {NULL, 0},
};

int LuaOpenUIProgressView(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIProgressViewConstants);
    return 0;
}
