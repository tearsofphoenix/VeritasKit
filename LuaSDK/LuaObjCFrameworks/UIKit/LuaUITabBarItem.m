//
//  LuaUITabBarItem.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUITabBarItem.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUITabBarSystemItemConstants[] = {
    {"UITabBarSystemItemMore", UITabBarSystemItemMore},
    {"UITabBarSystemItemFavorites", UITabBarSystemItemFavorites},
    {"UITabBarSystemItemFeatured", UITabBarSystemItemFeatured},
    {"UITabBarSystemItemTopRated", UITabBarSystemItemTopRated},
    {"UITabBarSystemItemRecents", UITabBarSystemItemRecents},
    {"UITabBarSystemItemContacts", UITabBarSystemItemContacts},
    {"UITabBarSystemItemHistory", UITabBarSystemItemHistory},
    {"UITabBarSystemItemBookmarks", UITabBarSystemItemBookmarks},
    {"UITabBarSystemItemSearch", UITabBarSystemItemSearch},
    {"UITabBarSystemItemDownloads", UITabBarSystemItemDownloads},
    {"UITabBarSystemItemMostRecent", UITabBarSystemItemMostRecent},
    {"UITabBarSystemItemMostViewed", UITabBarSystemItemMostViewed},
    {NULL, 0},
};

int LuaOpenUITabBarItem(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUITabBarSystemItemConstants);
    return 0;
}
