//
//  LuaNSURL.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSURL.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSURLConstants[] = 
{
    {"NSURLBookmarkCreationPreferFileIDResolution", NSURLBookmarkCreationPreferFileIDResolution},
    {"NSURLBookmarkCreationMinimalBookmark", NSURLBookmarkCreationMinimalBookmark},
    {"NSURLBookmarkCreationSuitableForBookmarkFile", NSURLBookmarkCreationSuitableForBookmarkFile},
    {"NSURLBookmarkResolutionWithoutUI", NSURLBookmarkResolutionWithoutUI},
    {"NSURLBookmarkResolutionWithoutMounting", NSURLBookmarkResolutionWithoutMounting},
    {NULL, 0},
};

int LuaOpenNSURL(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSURLConstants);
    return 0;
}
