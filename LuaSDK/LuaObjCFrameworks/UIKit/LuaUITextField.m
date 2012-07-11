//
//  LuaUITextField.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUITextField.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUITextConstants[] = {
    {"UITextBorderStyleNone", UITextBorderStyleNone},
    {"UITextBorderStyleLine", UITextBorderStyleLine},
    {"UITextBorderStyleBezel", UITextBorderStyleBezel},
    {"UITextBorderStyleRoundedRect", UITextBorderStyleRoundedRect},
    {"UITextFieldViewModeNever", UITextFieldViewModeNever},
    {"UITextFieldViewModeWhileEditing", UITextFieldViewModeWhileEditing},
    {"UITextFieldViewModeUnlessEditing", UITextFieldViewModeUnlessEditing},
    {"UITextFieldViewModeAlways", UITextFieldViewModeAlways},
    {NULL, 0},
};


int LuaOpenUITextField(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUITextConstants);
    return 0;
}
