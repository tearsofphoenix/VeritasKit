//
//  LuaUIBezierPath.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIBezierPath.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaUIBezierPathConstants[] = {
    {"UIRectCornerTopLeft", UIRectCornerTopLeft},
    {"UIRectCornerTopRight", UIRectCornerTopRight},
    {"UIRectCornerBottomLeft", UIRectCornerBottomLeft},
    {"UIRectCornerBottomRight", UIRectCornerBottomRight},
    {"UIRectCornerAllCorners", UIRectCornerAllCorners},
    {NULL, 0},
};

int LuaOpenUIBezierPath(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaUIBezierPathConstants);
    return 0;
}
