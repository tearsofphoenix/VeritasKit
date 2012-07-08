//
//  LuaNSLinguisticTagger.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSLinguisticTagger.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaNSLinguisticTaggerConstants[] = 
{
    {"NSLinguisticTaggerOmitWords", NSLinguisticTaggerOmitWords},
    {"NSLinguisticTaggerOmitPunctuation", NSLinguisticTaggerOmitPunctuation},
    {"NSLinguisticTaggerOmitWhitespace", NSLinguisticTaggerOmitWhitespace},
    {"NSLinguisticTaggerOmitOther", NSLinguisticTaggerOmitOther},
    {"NSLinguisticTaggerJoinNames", NSLinguisticTaggerJoinNames},
    {NULL, 0},
};

int LuaOpenNSLinguisticTagger(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaNSLinguisticTaggerConstants);
    return 0;
}
