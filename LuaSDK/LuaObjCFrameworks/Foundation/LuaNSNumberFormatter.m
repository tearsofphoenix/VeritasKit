//
//  LuaNSNumberFormatter.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSNumberFormatter.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaNSNumberFormatterConstants[] = 
{
    {"NSNumberFormatterNoStyle", NSNumberFormatterNoStyle},
    {"NSNumberFormatterDecimalStyle", NSNumberFormatterDecimalStyle},
    {"NSNumberFormatterCurrencyStyle", NSNumberFormatterCurrencyStyle},
    {"NSNumberFormatterPercentStyle", NSNumberFormatterPercentStyle},
    {"NSNumberFormatterScientificStyle", NSNumberFormatterScientificStyle},
    {"NSNumberFormatterSpellOutStyle", NSNumberFormatterSpellOutStyle},
    {"NSNumberFormatterBehaviorDefault", NSNumberFormatterBehaviorDefault},
#if (TARGET_OS_MAC && !(TARGET_OS_EMBEDDED || TARGET_OS_IPHONE))
    {"NSNumberFormatterBehavior10_0", NSNumberFormatterBehavior10_0},
#endif
    {"NSNumberFormatterBehavior10_4", NSNumberFormatterBehavior10_4},
    {"NSNumberFormatterPadBeforePrefix", NSNumberFormatterPadBeforePrefix},
    {"NSNumberFormatterPadAfterPrefix", NSNumberFormatterPadAfterPrefix},
    {"NSNumberFormatterPadBeforeSuffix", NSNumberFormatterPadBeforeSuffix},
    {"NSNumberFormatterPadAfterSuffix", NSNumberFormatterPadAfterSuffix},
    {"NSNumberFormatterRoundCeiling", NSNumberFormatterRoundCeiling},
    {"NSNumberFormatterRoundFloor", NSNumberFormatterRoundFloor},
    {"NSNumberFormatterRoundDown", NSNumberFormatterRoundDown},
    {"NSNumberFormatterRoundUp", NSNumberFormatterRoundUp},
    {"NSNumberFormatterRoundHalfEven", NSNumberFormatterRoundHalfEven},
    {"NSNumberFormatterRoundHalfDown", NSNumberFormatterRoundHalfDown},
    {"NSNumberFormatterRoundHalfUp", NSNumberFormatterRoundHalfUp},
    {NULL, 0},
};

int LuaOpenNSNumberFormatter(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaNSNumberFormatterConstants);
    return 0;
}
