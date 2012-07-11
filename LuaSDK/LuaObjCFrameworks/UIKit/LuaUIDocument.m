//
//  LuaUIDocument.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaUIDocument.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaUIDocumentConstants[] = {
    {"UIDocumentChangeDone", UIDocumentChangeDone},
    {"UIDocumentChangeUndone", UIDocumentChangeUndone},
    {"UIDocumentChangeRedone", UIDocumentChangeRedone},
    {"UIDocumentChangeCleared", UIDocumentChangeCleared},
    {"UIDocumentSaveForCreating", UIDocumentSaveForCreating},
    {"UIDocumentSaveForOverwriting", UIDocumentSaveForOverwriting},
    {"UIDocumentStateNormal", UIDocumentStateNormal},
    {"UIDocumentStateClosed", UIDocumentStateClosed},
    {"UIDocumentStateInConflict", UIDocumentStateInConflict},
    {"UIDocumentStateSavingError", UIDocumentStateSavingError},
    {"UIDocumentStateEditingDisabled", UIDocumentStateEditingDisabled},
    {NULL, 0},
};


int LuaOpenUIDocument(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaUIDocumentConstants);
    return 0;
}
