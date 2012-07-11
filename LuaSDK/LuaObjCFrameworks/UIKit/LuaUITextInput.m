//
//  LuaUITextInput.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUITextInput.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUITextConstants[] = {
    {"UITextStorageDirectionForward", UITextStorageDirectionForward},
    {"UITextStorageDirectionBackward", UITextStorageDirectionBackward},
    {"UITextLayoutDirectionRight", UITextLayoutDirectionRight},
    {"UITextLayoutDirectionLeft", UITextLayoutDirectionLeft},
    {"UITextLayoutDirectionUp", UITextLayoutDirectionUp},
    {"UITextLayoutDirectionDown", UITextLayoutDirectionDown},
    {"UITextWritingDirectionNatural", UITextWritingDirectionNatural},
    {"UITextWritingDirectionLeftToRight", UITextWritingDirectionLeftToRight},
    {"UITextWritingDirectionRightToLeft", UITextWritingDirectionRightToLeft},
    {"UITextGranularityCharacter", UITextGranularityCharacter},
    {"UITextGranularityWord", UITextGranularityWord},
    {"UITextGranularitySentence", UITextGranularitySentence},
    {"UITextGranularityParagraph", UITextGranularityParagraph},
    {"UITextGranularityLine", UITextGranularityLine},
    {"UITextGranularityDocument", UITextGranularityDocument},
    {NULL, 0},
};

int LuaOpenUITextInput(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUITextConstants);
    return 0;
}
