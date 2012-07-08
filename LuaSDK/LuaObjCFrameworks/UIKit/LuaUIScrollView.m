//
//  LuaUIScrollView.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIScrollView.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIScrollViewConstants[] = {
    {"UIScrollViewIndicatorStyleDefault", UIScrollViewIndicatorStyleDefault},
    {"UIScrollViewIndicatorStyleBlack", UIScrollViewIndicatorStyleBlack},
    {"UIScrollViewIndicatorStyleWhite", UIScrollViewIndicatorStyleWhite},
    {NULL, 0},
};

int LuaOpenUIScrollView(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIScrollViewConstants);
    return 0;
}
