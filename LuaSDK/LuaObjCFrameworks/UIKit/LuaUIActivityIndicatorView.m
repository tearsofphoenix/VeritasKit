//
//  LuaUIActivityIndicatorView.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIActivityIndicatorView.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIActivityIndicatorViewConstants[] = {
    {"UIActivityIndicatorViewStyleWhiteLarge", UIActivityIndicatorViewStyleWhiteLarge},
    {"UIActivityIndicatorViewStyleWhite", UIActivityIndicatorViewStyleWhite},
    {"UIActivityIndicatorViewStyleGray", UIActivityIndicatorViewStyleGray},
    {NULL, 0},
};


int LuaOpenUIActivityIndicatorView(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIActivityIndicatorViewConstants);
    return 0;
}
