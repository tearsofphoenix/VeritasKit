//
//  LuaUIPrintError.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIPrintError.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIPrintConstants[] = {
    {"UIPrintingNotAvailableError", UIPrintingNotAvailableError},
    {"UIPrintNoContentError", UIPrintNoContentError},
    {"UIPrintUnknownImageFormatError", UIPrintUnknownImageFormatError},
    {"UIPrintJobFailedError", UIPrintJobFailedError},
    {NULL, 0},
};

int LuaOpenUIPrintError(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIPrintConstants);
    return 0;
}
