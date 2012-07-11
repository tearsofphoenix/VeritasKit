//
//  LuaUIActionSheet.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIActionSheet.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIActionSheetConstants[] = 
{
    {"UIActionSheetStyleAutomatic", UIActionSheetStyleAutomatic},
    {"UIActionSheetStyleDefault", UIActionSheetStyleDefault},
    {"UIActionSheetStyleBlackTranslucent", UIActionSheetStyleBlackTranslucent},
    {"UIActionSheetStyleBlackOpaque", UIActionSheetStyleBlackOpaque},
    {NULL, 0},
};

int LuaOpenUIActionSheet(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIActionSheetConstants);
    return 0;
}
