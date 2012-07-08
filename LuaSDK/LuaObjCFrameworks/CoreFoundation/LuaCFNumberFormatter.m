//
//  LuaCFNumberFormatter.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFNumberFormatter.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFNumberFormatterRef(lua_State *L)
{
    CFNumberFormatterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatters(lua_State *L)
{
    CFNumberFormatters(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterGetTypeID(lua_State *L)
{
    CFNumberFormatterGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterNoStyle(lua_State *L)
{
    CFNumberFormatterNoStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterDecimalStyle(lua_State *L)
{
    CFNumberFormatterDecimalStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterCurrencyStyle(lua_State *L)
{
    CFNumberFormatterCurrencyStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterPercentStyle(lua_State *L)
{
    CFNumberFormatterPercentStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterScientificStyle(lua_State *L)
{
    CFNumberFormatterScientificStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterSpellOutStyle(lua_State *L)
{
    CFNumberFormatterSpellOutStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterStyle(lua_State *L)
{
    CFNumberFormatterStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterRef(lua_State *L)
{
    CFNumberFormatterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterGetLocale(lua_State *L)
{
    CFNumberFormatterGetLocale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterStyle(lua_State *L)
{
    CFNumberFormatterStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterGetFormat(lua_State *L)
{
    CFNumberFormatterGetFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterSetFormat(lua_State *L)
{
    CFNumberFormatterSetFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterCreateStringWithNumber(lua_State *L)
{
    CFNumberFormatterCreateStringWithNumber(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterCreateStringWithValue(lua_State *L)
{
    CFNumberFormatterCreateStringWithValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterParseIntegersOnly(lua_State *L)
{
    CFNumberFormatterParseIntegersOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterOptionFlags(lua_State *L)
{
    CFNumberFormatterOptionFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterCreateNumberFromString(lua_State *L)
{
    CFNumberFormatterCreateNumberFromString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterGetValueFromString(lua_State *L)
{
    CFNumberFormatterGetValueFromString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterSetProperty(lua_State *L)
{
    CFNumberFormatterSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterCopyProperty(lua_State *L)
{
    CFNumberFormatterCopyProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterCurrencyCode(lua_State *L)
{
    CFNumberFormatterCurrencyCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterDecimalSeparator(lua_State *L)
{
    CFNumberFormatterDecimalSeparator(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterCurrencyDecimalSeparator(lua_State *L)
{
    CFNumberFormatterCurrencyDecimalSeparator(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterAlwaysShowDecimalSeparator(lua_State *L)
{
    CFNumberFormatterAlwaysShowDecimalSeparator(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterGroupingSeparator(lua_State *L)
{
    CFNumberFormatterGroupingSeparator(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterUseGroupingSeparator(lua_State *L)
{
    CFNumberFormatterUseGroupingSeparator(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterPercentSymbol(lua_State *L)
{
    CFNumberFormatterPercentSymbol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterZeroSymbol(lua_State *L)
{
    CFNumberFormatterZeroSymbol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterNaNSymbol(lua_State *L)
{
    CFNumberFormatterNaNSymbol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterInfinitySymbol(lua_State *L)
{
    CFNumberFormatterInfinitySymbol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterMinusSign(lua_State *L)
{
    CFNumberFormatterMinusSign(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterPlusSign(lua_State *L)
{
    CFNumberFormatterPlusSign(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterCurrencySymbol(lua_State *L)
{
    CFNumberFormatterCurrencySymbol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterExponentSymbol(lua_State *L)
{
    CFNumberFormatterExponentSymbol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterMinIntegerDigits(lua_State *L)
{
    CFNumberFormatterMinIntegerDigits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterMaxIntegerDigits(lua_State *L)
{
    CFNumberFormatterMaxIntegerDigits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterMinFractionDigits(lua_State *L)
{
    CFNumberFormatterMinFractionDigits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterMaxFractionDigits(lua_State *L)
{
    CFNumberFormatterMaxFractionDigits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterGroupingSize(lua_State *L)
{
    CFNumberFormatterGroupingSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterSecondaryGroupingSize(lua_State *L)
{
    CFNumberFormatterSecondaryGroupingSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterRoundingMode(lua_State *L)
{
    CFNumberFormatterRoundingMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterRoundingIncrement(lua_State *L)
{
    CFNumberFormatterRoundingIncrement(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterFormatWidth(lua_State *L)
{
    CFNumberFormatterFormatWidth(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterPaddingPosition(lua_State *L)
{
    CFNumberFormatterPaddingPosition(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterPaddingCharacter(lua_State *L)
{
    CFNumberFormatterPaddingCharacter(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterDefaultFormat(lua_State *L)
{
    CFNumberFormatterDefaultFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterMultiplier(lua_State *L)
{
    CFNumberFormatterMultiplier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterPositivePrefix(lua_State *L)
{
    CFNumberFormatterPositivePrefix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterPositiveSuffix(lua_State *L)
{
    CFNumberFormatterPositiveSuffix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterNegativePrefix(lua_State *L)
{
    CFNumberFormatterNegativePrefix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterNegativeSuffix(lua_State *L)
{
    CFNumberFormatterNegativeSuffix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterPerMillSymbol(lua_State *L)
{
    CFNumberFormatterPerMillSymbol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterInternationalCurrencySymbol(lua_State *L)
{
    CFNumberFormatterInternationalCurrencySymbol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterCurrencyGroupingSeparator(lua_State *L)
{
    CFNumberFormatterCurrencyGroupingSeparator(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterIsLenient(lua_State *L)
{
    CFNumberFormatterIsLenient(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterUseSignificantDigits(lua_State *L)
{
    CFNumberFormatterUseSignificantDigits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterMinSignificantDigits(lua_State *L)
{
    CFNumberFormatterMinSignificantDigits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterMaxSignificantDigits(lua_State *L)
{
    CFNumberFormatterMaxSignificantDigits(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterRoundCeiling(lua_State *L)
{
    CFNumberFormatterRoundCeiling(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterRoundFloor(lua_State *L)
{
    CFNumberFormatterRoundFloor(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterRoundDown(lua_State *L)
{
    CFNumberFormatterRoundDown(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterRoundUp(lua_State *L)
{
    CFNumberFormatterRoundUp(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterRoundHalfEven(lua_State *L)
{
    CFNumberFormatterRoundHalfEven(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterRoundHalfDown(lua_State *L)
{
    CFNumberFormatterRoundHalfDown(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterRoundHalfUp(lua_State *L)
{
    CFNumberFormatterRoundHalfUp(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterRoundingMode(lua_State *L)
{
    CFNumberFormatterRoundingMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterPadBeforePrefix(lua_State *L)
{
    CFNumberFormatterPadBeforePrefix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterPadAfterPrefix(lua_State *L)
{
    CFNumberFormatterPadAfterPrefix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterPadBeforeSuffix(lua_State *L)
{
    CFNumberFormatterPadBeforeSuffix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterPadAfterSuffix(lua_State *L)
{
    CFNumberFormatterPadAfterSuffix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterPadPosition(lua_State *L)
{
    CFNumberFormatterPadPosition(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNumberFormatterGetDecimalInfoForCurrencyCode(lua_State *L)
{
    CFNumberFormatterGetDecimalInfoForCurrencyCode(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFNumberFormatterAPIs[] = {
    {"CFNumberFormatterRef", lua_CFNumberFormatterRef},
    {"CFNumberFormatters", lua_CFNumberFormatters},
    {"CFNumberFormatterGetTypeID", lua_CFNumberFormatterGetTypeID},
    {"CFNumberFormatterNoStyle", lua_CFNumberFormatterNoStyle},
    {"CFNumberFormatterDecimalStyle", lua_CFNumberFormatterDecimalStyle},
    {"CFNumberFormatterCurrencyStyle", lua_CFNumberFormatterCurrencyStyle},
    {"CFNumberFormatterPercentStyle", lua_CFNumberFormatterPercentStyle},
    {"CFNumberFormatterScientificStyle", lua_CFNumberFormatterScientificStyle},
    {"CFNumberFormatterSpellOutStyle", lua_CFNumberFormatterSpellOutStyle},
    {"CFNumberFormatterStyle", lua_CFNumberFormatterStyle},
    {"CFNumberFormatterRef", lua_CFNumberFormatterRef},
    {"CFNumberFormatterGetLocale", lua_CFNumberFormatterGetLocale},
    {"CFNumberFormatterStyle", lua_CFNumberFormatterStyle},
    {"CFNumberFormatterGetFormat", lua_CFNumberFormatterGetFormat},
    {"CFNumberFormatterSetFormat", lua_CFNumberFormatterSetFormat},
    {"CFNumberFormatterCreateStringWithNumber", lua_CFNumberFormatterCreateStringWithNumber},
    {"CFNumberFormatterCreateStringWithValue", lua_CFNumberFormatterCreateStringWithValue},
    {"CFNumberFormatterParseIntegersOnly", lua_CFNumberFormatterParseIntegersOnly},
    {"CFNumberFormatterOptionFlags", lua_CFNumberFormatterOptionFlags},
    {"CFNumberFormatterCreateNumberFromString", lua_CFNumberFormatterCreateNumberFromString},
    {"CFNumberFormatterGetValueFromString", lua_CFNumberFormatterGetValueFromString},
    {"CFNumberFormatterSetProperty", lua_CFNumberFormatterSetProperty},
    {"CFNumberFormatterCopyProperty", lua_CFNumberFormatterCopyProperty},
    {"CFNumberFormatterCurrencyCode", lua_CFNumberFormatterCurrencyCode},
    {"CFNumberFormatterDecimalSeparator", lua_CFNumberFormatterDecimalSeparator},
    {"CFNumberFormatterCurrencyDecimalSeparator", lua_CFNumberFormatterCurrencyDecimalSeparator},
    {"CFNumberFormatterAlwaysShowDecimalSeparator", lua_CFNumberFormatterAlwaysShowDecimalSeparator},
    {"CFNumberFormatterGroupingSeparator", lua_CFNumberFormatterGroupingSeparator},
    {"CFNumberFormatterUseGroupingSeparator", lua_CFNumberFormatterUseGroupingSeparator},
    {"CFNumberFormatterPercentSymbol", lua_CFNumberFormatterPercentSymbol},
    {"CFNumberFormatterZeroSymbol", lua_CFNumberFormatterZeroSymbol},
    {"CFNumberFormatterNaNSymbol", lua_CFNumberFormatterNaNSymbol},
    {"CFNumberFormatterInfinitySymbol", lua_CFNumberFormatterInfinitySymbol},
    {"CFNumberFormatterMinusSign", lua_CFNumberFormatterMinusSign},
    {"CFNumberFormatterPlusSign", lua_CFNumberFormatterPlusSign},
    {"CFNumberFormatterCurrencySymbol", lua_CFNumberFormatterCurrencySymbol},
    {"CFNumberFormatterExponentSymbol", lua_CFNumberFormatterExponentSymbol},
    {"CFNumberFormatterMinIntegerDigits", lua_CFNumberFormatterMinIntegerDigits},
    {"CFNumberFormatterMaxIntegerDigits", lua_CFNumberFormatterMaxIntegerDigits},
    {"CFNumberFormatterMinFractionDigits", lua_CFNumberFormatterMinFractionDigits},
    {"CFNumberFormatterMaxFractionDigits", lua_CFNumberFormatterMaxFractionDigits},
    {"CFNumberFormatterGroupingSize", lua_CFNumberFormatterGroupingSize},
    {"CFNumberFormatterSecondaryGroupingSize", lua_CFNumberFormatterSecondaryGroupingSize},
    {"CFNumberFormatterRoundingMode", lua_CFNumberFormatterRoundingMode},
    {"CFNumberFormatterRoundingIncrement", lua_CFNumberFormatterRoundingIncrement},
    {"CFNumberFormatterFormatWidth", lua_CFNumberFormatterFormatWidth},
    {"CFNumberFormatterPaddingPosition", lua_CFNumberFormatterPaddingPosition},
    {"CFNumberFormatterPaddingCharacter", lua_CFNumberFormatterPaddingCharacter},
    {"CFNumberFormatterDefaultFormat", lua_CFNumberFormatterDefaultFormat},
    {"CFNumberFormatterMultiplier", lua_CFNumberFormatterMultiplier},
    {"CFNumberFormatterPositivePrefix", lua_CFNumberFormatterPositivePrefix},
    {"CFNumberFormatterPositiveSuffix", lua_CFNumberFormatterPositiveSuffix},
    {"CFNumberFormatterNegativePrefix", lua_CFNumberFormatterNegativePrefix},
    {"CFNumberFormatterNegativeSuffix", lua_CFNumberFormatterNegativeSuffix},
    {"CFNumberFormatterPerMillSymbol", lua_CFNumberFormatterPerMillSymbol},
    {"CFNumberFormatterInternationalCurrencySymbol", lua_CFNumberFormatterInternationalCurrencySymbol},
    {"CFNumberFormatterCurrencyGroupingSeparator", lua_CFNumberFormatterCurrencyGroupingSeparator},
    {"CFNumberFormatterIsLenient", lua_CFNumberFormatterIsLenient},
    {"CFNumberFormatterUseSignificantDigits", lua_CFNumberFormatterUseSignificantDigits},
    {"CFNumberFormatterMinSignificantDigits", lua_CFNumberFormatterMinSignificantDigits},
    {"CFNumberFormatterMaxSignificantDigits", lua_CFNumberFormatterMaxSignificantDigits},
    {"CFNumberFormatterRoundCeiling", lua_CFNumberFormatterRoundCeiling},
    {"CFNumberFormatterRoundFloor", lua_CFNumberFormatterRoundFloor},
    {"CFNumberFormatterRoundDown", lua_CFNumberFormatterRoundDown},
    {"CFNumberFormatterRoundUp", lua_CFNumberFormatterRoundUp},
    {"CFNumberFormatterRoundHalfEven", lua_CFNumberFormatterRoundHalfEven},
    {"CFNumberFormatterRoundHalfDown", lua_CFNumberFormatterRoundHalfDown},
    {"CFNumberFormatterRoundHalfUp", lua_CFNumberFormatterRoundHalfUp},
    {"CFNumberFormatterRoundingMode", lua_CFNumberFormatterRoundingMode},
    {"CFNumberFormatterPadBeforePrefix", lua_CFNumberFormatterPadBeforePrefix},
    {"CFNumberFormatterPadAfterPrefix", lua_CFNumberFormatterPadAfterPrefix},
    {"CFNumberFormatterPadBeforeSuffix", lua_CFNumberFormatterPadBeforeSuffix},
    {"CFNumberFormatterPadAfterSuffix", lua_CFNumberFormatterPadAfterSuffix},
    {"CFNumberFormatterPadPosition", lua_CFNumberFormatterPadPosition},
    {"CFNumberFormatterGetDecimalInfoForCurrencyCode", lua_CFNumberFormatterGetDecimalInfoForCurrencyCode},
    {NULL, NULL},
};

int LuaOpenCFNumberFormatter(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFNumberFormatterAPIs);
    return 0;
}
