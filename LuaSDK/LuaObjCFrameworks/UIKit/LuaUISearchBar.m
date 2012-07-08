//
//  LuaUISearchBar.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUISearchBar.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUISearchBarConstants[] = {
    {"UISearchBarIconSearch", UISearchBarIconSearch},
    {"UISearchBarIconClear", UISearchBarIconClear},
    {"UISearchBarIconBookmark", UISearchBarIconBookmark},
    {"UISearchBarIconResultsList", UISearchBarIconResultsList},
    {NULL, 0},
};

int LuaOpenUISearchBar(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUISearchBarConstants);
    return 0;
}
