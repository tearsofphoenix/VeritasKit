//
//  LuaNSURLCache.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSURLCache.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSURLCacheConstants[] = 
{
    {"NSURLCacheStorageAllowed", NSURLCacheStorageAllowed},
    {"NSURLCacheStorageAllowedInMemoryOnly", NSURLCacheStorageAllowedInMemoryOnly},
    {"NSURLCacheStorageNotAllowed", NSURLCacheStorageNotAllowed},
    {NULL, 0},
};

int LuaOpenNSURLCache(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSURLCacheConstants);
    return 0;
}
