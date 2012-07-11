//
//  LuaUIAlertView.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIAlertView.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIAlertViewConstants[] = {
    {"UIAlertViewStyleDefault", UIAlertViewStyleDefault},
    {"UIAlertViewStyleSecureTextInput", UIAlertViewStyleSecureTextInput},
    {"UIAlertViewStylePlainTextInput", UIAlertViewStylePlainTextInput},
    {"UIAlertViewStyleLoginAndPasswordInput", UIAlertViewStyleLoginAndPasswordInput},
    {NULL, 0},
};

int LuaOpenUIAlertView(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIAlertViewConstants);
    return 0;
}
