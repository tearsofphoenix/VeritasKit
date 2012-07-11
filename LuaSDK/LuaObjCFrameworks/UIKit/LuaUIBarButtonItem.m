//
//  LuaUIBarButtonItem.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIBarButtonItem.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIConstants[] = 
{
    {"UIBarMetricsDefault", UIBarMetricsDefault},
    {"UIBarMetricsLandscapePhone", UIBarMetricsLandscapePhone},
    {"UIBarButtonItemStylePlain", UIBarButtonItemStylePlain},
    {"UIBarButtonItemStyleBordered", UIBarButtonItemStyleBordered},
    {"UIBarButtonItemStyleDone", UIBarButtonItemStyleDone},
    {"UIBarButtonSystemItemDone", UIBarButtonSystemItemDone},
    {"UIBarButtonSystemItemCancel", UIBarButtonSystemItemCancel},
    {"UIBarButtonSystemItemEdit", UIBarButtonSystemItemEdit},
    {"UIBarButtonSystemItemSave", UIBarButtonSystemItemSave},
    {"UIBarButtonSystemItemAdd", UIBarButtonSystemItemAdd},
    {"UIBarButtonSystemItemFlexibleSpace", UIBarButtonSystemItemFlexibleSpace},
    {"UIBarButtonSystemItemFixedSpace", UIBarButtonSystemItemFixedSpace},
    {"UIBarButtonSystemItemCompose", UIBarButtonSystemItemCompose},
    {"UIBarButtonSystemItemReply", UIBarButtonSystemItemReply},
    {"UIBarButtonSystemItemAction", UIBarButtonSystemItemAction},
    {"UIBarButtonSystemItemOrganize", UIBarButtonSystemItemOrganize},
    {"UIBarButtonSystemItemBookmarks", UIBarButtonSystemItemBookmarks},
    {"UIBarButtonSystemItemSearch", UIBarButtonSystemItemSearch},
    {"UIBarButtonSystemItemRefresh", UIBarButtonSystemItemRefresh},
    {"UIBarButtonSystemItemStop", UIBarButtonSystemItemStop},
    {"UIBarButtonSystemItemCamera", UIBarButtonSystemItemCamera},
    {"UIBarButtonSystemItemTrash", UIBarButtonSystemItemTrash},
    {"UIBarButtonSystemItemPlay", UIBarButtonSystemItemPlay},
    {"UIBarButtonSystemItemPause", UIBarButtonSystemItemPause},
    {"UIBarButtonSystemItemRewind", UIBarButtonSystemItemRewind},
    {"UIBarButtonSystemItemFastForward", UIBarButtonSystemItemFastForward},
    {"UIBarButtonSystemItemUndo", UIBarButtonSystemItemUndo},
    {"UIBarButtonSystemItemRedo", UIBarButtonSystemItemRedo},
    {"UIBarButtonSystemItemPageCurl", UIBarButtonSystemItemPageCurl},
    {NULL, 0},
};

int LuaOpenUIBarButtonItem(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIConstants);
    return 0;
}
