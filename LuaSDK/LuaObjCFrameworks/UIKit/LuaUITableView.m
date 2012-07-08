//
//  LuaUITableView.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUITableView.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUITableViewConstants[] = {
    {"UITableViewStylePlain", UITableViewStylePlain},
    {"UITableViewStyleGrouped", UITableViewStyleGrouped},
    {"UITableViewScrollPositionNone", UITableViewScrollPositionNone},
    {"UITableViewScrollPositionTop", UITableViewScrollPositionTop},
    {"UITableViewScrollPositionMiddle", UITableViewScrollPositionMiddle},
    {"UITableViewScrollPositionBottom", UITableViewScrollPositionBottom},
    {"UITableViewRowAnimationFade", UITableViewRowAnimationFade},
    {"UITableViewRowAnimationRight", UITableViewRowAnimationRight},
    {"UITableViewRowAnimationLeft", UITableViewRowAnimationLeft},
    {"UITableViewRowAnimationTop", UITableViewRowAnimationTop},
    {"UITableViewRowAnimationBottom", UITableViewRowAnimationBottom},
    {"UITableViewRowAnimationNone", UITableViewRowAnimationNone},
    {"UITableViewRowAnimationMiddle", UITableViewRowAnimationMiddle},
    {"UITableViewRowAnimationAutomatic", UITableViewRowAnimationAutomatic},
    {NULL, 0},
};

int LuaOpenUITableView(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUITableViewConstants);
    return 0;
}
