//
//  LuaUIViewController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIViewController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIModalConstants[] = {
    {"UIModalTransitionStyleCoverVertical", UIModalTransitionStyleCoverVertical},
    {"UIModalTransitionStyleFlipHorizontal", UIModalTransitionStyleFlipHorizontal},
    {"UIModalTransitionStyleCrossDissolve", UIModalTransitionStyleCrossDissolve},
    {"UIModalTransitionStylePartialCurl", UIModalTransitionStylePartialCurl},
    {"UIModalPresentationFullScreen", UIModalPresentationFullScreen},
    {"UIModalPresentationPageSheet", UIModalPresentationPageSheet},
    {"UIModalPresentationFormSheet", UIModalPresentationFormSheet},
    {"UIModalPresentationCurrentContext", UIModalPresentationCurrentContext},
    {NULL, 0},
};

int LuaOpenUIViewController(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIModalConstants);
    return 0;
}
