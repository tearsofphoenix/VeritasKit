//
//  LuaUITextInputTraits.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUITextInputTraits.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUITextConstants[] = {
    {"UITextAutocapitalizationTypeNone", UITextAutocapitalizationTypeNone},
    {"UITextAutocapitalizationTypeWords", UITextAutocapitalizationTypeWords},
    {"UITextAutocapitalizationTypeSentences", UITextAutocapitalizationTypeSentences},
    {"UITextAutocapitalizationTypeAllCharacters", UITextAutocapitalizationTypeAllCharacters},
    {"UITextAutocorrectionTypeDefault", UITextAutocorrectionTypeDefault},
    {"UITextAutocorrectionTypeNo", UITextAutocorrectionTypeNo},
    {"UITextAutocorrectionTypeYes", UITextAutocorrectionTypeYes},
    {"UITextSpellCheckingTypeDefault", UITextSpellCheckingTypeDefault},
    {"UITextSpellCheckingTypeNo", UITextSpellCheckingTypeNo},
    {"UITextSpellCheckingTypeYes", UITextSpellCheckingTypeYes},
    {NULL, 0},
};

int LuaOpenUITextInputTraits(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUITextConstants);
    return 0;
}
