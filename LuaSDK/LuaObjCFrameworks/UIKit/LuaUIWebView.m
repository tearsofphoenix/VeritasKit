//
//  LuaUIWebView.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIWebView.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIWebViewConstants[] = {
    {"UIWebViewNavigationTypeLinkClicked", UIWebViewNavigationTypeLinkClicked},
    {"UIWebViewNavigationTypeFormSubmitted", UIWebViewNavigationTypeFormSubmitted},
    {"UIWebViewNavigationTypeBackForward", UIWebViewNavigationTypeBackForward},
    {"UIWebViewNavigationTypeReload", UIWebViewNavigationTypeReload},
    {"UIWebViewNavigationTypeFormResubmitted", UIWebViewNavigationTypeFormResubmitted},
    {"UIWebViewNavigationTypeOther", UIWebViewNavigationTypeOther},
    {NULL, 0},
};

int LuaOpenUIWebView(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIWebViewConstants);
    return 0;
}
