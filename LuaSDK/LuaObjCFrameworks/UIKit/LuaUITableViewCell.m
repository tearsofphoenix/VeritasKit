//
//  LuaUITableViewCell.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUITableViewCell.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUITableViewCellConstants[] = {
    {"UITableViewCellStyleDefault", UITableViewCellStyleDefault},
    {"UITableViewCellStyleValue1", UITableViewCellStyleValue1},
    {"UITableViewCellStyleValue2", UITableViewCellStyleValue2},
    {"UITableViewCellStyleSubtitle", UITableViewCellStyleSubtitle},
    {"UITableViewCellSeparatorStyleNone", UITableViewCellSeparatorStyleNone},
    {"UITableViewCellSeparatorStyleSingleLine", UITableViewCellSeparatorStyleSingleLine},
    {"UITableViewCellSeparatorStyleSingleLineEtched", UITableViewCellSeparatorStyleSingleLineEtched},
    {"UITableViewCellSelectionStyleNone", UITableViewCellSelectionStyleNone},
    {"UITableViewCellSelectionStyleBlue", UITableViewCellSelectionStyleBlue},
    {"UITableViewCellSelectionStyleGray", UITableViewCellSelectionStyleGray},
    {"UITableViewCellEditingStyleNone", UITableViewCellEditingStyleNone},
    {"UITableViewCellEditingStyleDelete", UITableViewCellEditingStyleDelete},
    {"UITableViewCellEditingStyleInsert", UITableViewCellEditingStyleInsert},
    {"UITableViewCellAccessoryNone", UITableViewCellAccessoryNone},
    {"UITableViewCellAccessoryDisclosureIndicator", UITableViewCellAccessoryDisclosureIndicator},
    {"UITableViewCellAccessoryDetailDisclosureButton", UITableViewCellAccessoryDetailDisclosureButton},
    {"UITableViewCellAccessoryCheckmark", UITableViewCellAccessoryCheckmark},
    {"UITableViewCellStateDefaultMask", UITableViewCellStateDefaultMask},
    {"UITableViewCellStateShowingEditControlMask", UITableViewCellStateShowingEditControlMask},
    {"UITableViewCellStateShowingDeleteConfirmationMask", UITableViewCellStateShowingDeleteConfirmationMask},
    {"UITableViewCellStateEditingMask", UITableViewCellStateEditingMask},
    {NULL, 0},
};


int LuaOpenUITableViewCell(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUITableViewCellConstants);
    return 0;
}
