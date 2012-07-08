//
//  LuaCFLocale.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFLocale.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFLocaleRef(lua_State *L)
{
    CFLocaleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleGetTypeID(lua_State *L)
{
    CFLocaleGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleRef(lua_State *L)
{
    CFLocaleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleRef(lua_State *L)
{
    CFLocaleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCopyAvailableLocaleIdentifiers(lua_State *L)
{
    CFLocaleCopyAvailableLocaleIdentifiers(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCopyISOLanguageCodes(lua_State *L)
{
    CFLocaleCopyISOLanguageCodes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCopyISOCountryCodes(lua_State *L)
{
    CFLocaleCopyISOCountryCodes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCopyISOCurrencyCodes(lua_State *L)
{
    CFLocaleCopyISOCurrencyCodes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCopyCommonISOCurrencyCodes(lua_State *L)
{
    CFLocaleCopyCommonISOCurrencyCodes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCopyPreferredLanguages(lua_State *L)
{
    CFLocaleCopyPreferredLanguages(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCreateCanonicalLanguageIdentifierFromString(lua_State *L)
{
    CFLocaleCreateCanonicalLanguageIdentifierFromString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCreateCanonicalLocaleIdentifierFromString(lua_State *L)
{
    CFLocaleCreateCanonicalLocaleIdentifierFromString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes(lua_State *L)
{
    CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode(lua_State *L)
{
    CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier(lua_State *L)
{
    CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleLanguageDirectionUnknown(lua_State *L)
{
    CFLocaleLanguageDirectionUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleLanguageDirectionLeftToRight(lua_State *L)
{
    CFLocaleLanguageDirectionLeftToRight(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleLanguageDirectionRightToLeft(lua_State *L)
{
    CFLocaleLanguageDirectionRightToLeft(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleLanguageDirectionTopToBottom(lua_State *L)
{
    CFLocaleLanguageDirectionTopToBottom(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleLanguageDirectionBottomToTop(lua_State *L)
{
    CFLocaleLanguageDirectionBottomToTop(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleLanguageDirection(lua_State *L)
{
    CFLocaleLanguageDirection(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleLanguageDirection(lua_State *L)
{
    CFLocaleLanguageDirection(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleLanguageDirection(lua_State *L)
{
    CFLocaleLanguageDirection(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCreateComponentsFromLocaleIdentifier(lua_State *L)
{
    CFLocaleCreateComponentsFromLocaleIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleLanguageCode(lua_State *L)
{
    CFLocaleLanguageCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCalendarIdentifier(lua_State *L)
{
    CFLocaleCalendarIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCreateLocaleIdentifierFromComponents(lua_State *L)
{
    CFLocaleCreateLocaleIdentifierFromComponents(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCreateDictionaryFromLocaleIdentifier(lua_State *L)
{
    CFLocaleCreateDictionaryFromLocaleIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleLanguageCode(lua_State *L)
{
    CFLocaleLanguageCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCalendarIdentifier(lua_State *L)
{
    CFLocaleCalendarIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleRef(lua_State *L)
{
    CFLocaleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleRef(lua_State *L)
{
    CFLocaleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleRef(lua_State *L)
{
    CFLocaleRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleGetIdentifier(lua_State *L)
{
    CFLocaleGetIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleGetValue(lua_State *L)
{
    CFLocaleGetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCopyDisplayNameForPropertyValue(lua_State *L)
{
    CFLocaleCopyDisplayNameForPropertyValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCurrentLocaleDidChangeNotification(lua_State *L)
{
    CFLocaleCurrentLocaleDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleIdentifier(lua_State *L)
{
    CFLocaleIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleLanguageCode(lua_State *L)
{
    CFLocaleLanguageCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCountryCode(lua_State *L)
{
    CFLocaleCountryCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleScriptCode(lua_State *L)
{
    CFLocaleScriptCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleVariantCode(lua_State *L)
{
    CFLocaleVariantCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleExemplarCharacterSet(lua_State *L)
{
    CFLocaleExemplarCharacterSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCalendarIdentifier(lua_State *L)
{
    CFLocaleCalendarIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCalendar(lua_State *L)
{
    CFLocaleCalendar(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCollationIdentifier(lua_State *L)
{
    CFLocaleCollationIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleUsesMetricSystem(lua_State *L)
{
    CFLocaleUsesMetricSystem(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleMeasurementSystem(lua_State *L)
{
    CFLocaleMeasurementSystem(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleDecimalSeparator(lua_State *L)
{
    CFLocaleDecimalSeparator(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleGroupingSeparator(lua_State *L)
{
    CFLocaleGroupingSeparator(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCurrencySymbol(lua_State *L)
{
    CFLocaleCurrencySymbol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCurrencyCode(lua_State *L)
{
    CFLocaleCurrencyCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCollatorIdentifier(lua_State *L)
{
    CFLocaleCollatorIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleQuotationBeginDelimiterKey(lua_State *L)
{
    CFLocaleQuotationBeginDelimiterKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleQuotationEndDelimiterKey(lua_State *L)
{
    CFLocaleQuotationEndDelimiterKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleAlternateQuotationBeginDelimiterKey(lua_State *L)
{
    CFLocaleAlternateQuotationBeginDelimiterKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleAlternateQuotationEndDelimiterKey(lua_State *L)
{
    CFLocaleAlternateQuotationEndDelimiterKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFLocaleCalendarIdentifier(lua_State *L)
{
    CFLocaleCalendarIdentifier(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFLocaleAPIs[] = {
    {"CFLocaleRef", lua_CFLocaleRef},
    {"CFLocaleGetTypeID", lua_CFLocaleGetTypeID},
    {"CFLocaleRef", lua_CFLocaleRef},
    {"CFLocaleRef", lua_CFLocaleRef},
    {"CFLocaleCopyAvailableLocaleIdentifiers", lua_CFLocaleCopyAvailableLocaleIdentifiers},
    {"CFLocaleCopyISOLanguageCodes", lua_CFLocaleCopyISOLanguageCodes},
    {"CFLocaleCopyISOCountryCodes", lua_CFLocaleCopyISOCountryCodes},
    {"CFLocaleCopyISOCurrencyCodes", lua_CFLocaleCopyISOCurrencyCodes},
    {"CFLocaleCopyCommonISOCurrencyCodes", lua_CFLocaleCopyCommonISOCurrencyCodes},
    {"CFLocaleCopyPreferredLanguages", lua_CFLocaleCopyPreferredLanguages},
    {"CFLocaleCreateCanonicalLanguageIdentifierFromString", lua_CFLocaleCreateCanonicalLanguageIdentifierFromString},
    {"CFLocaleCreateCanonicalLocaleIdentifierFromString", lua_CFLocaleCreateCanonicalLocaleIdentifierFromString},
    {"CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes", lua_CFLocaleCreateCanonicalLocaleIdentifierFromScriptManagerCodes},
    {"CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode", lua_CFLocaleCreateLocaleIdentifierFromWindowsLocaleCode},
    {"CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier", lua_CFLocaleGetWindowsLocaleCodeFromLocaleIdentifier},
    {"CFLocaleLanguageDirectionUnknown", lua_CFLocaleLanguageDirectionUnknown},
    {"CFLocaleLanguageDirectionLeftToRight", lua_CFLocaleLanguageDirectionLeftToRight},
    {"CFLocaleLanguageDirectionRightToLeft", lua_CFLocaleLanguageDirectionRightToLeft},
    {"CFLocaleLanguageDirectionTopToBottom", lua_CFLocaleLanguageDirectionTopToBottom},
    {"CFLocaleLanguageDirectionBottomToTop", lua_CFLocaleLanguageDirectionBottomToTop},
    {"CFLocaleLanguageDirection", lua_CFLocaleLanguageDirection},
    {"CFLocaleLanguageDirection", lua_CFLocaleLanguageDirection},
    {"CFLocaleLanguageDirection", lua_CFLocaleLanguageDirection},
    {"CFLocaleCreateComponentsFromLocaleIdentifier", lua_CFLocaleCreateComponentsFromLocaleIdentifier},
    {"CFLocaleLanguageCode", lua_CFLocaleLanguageCode},
    {"CFLocaleCalendarIdentifier", lua_CFLocaleCalendarIdentifier},
    {"CFLocaleCreateLocaleIdentifierFromComponents", lua_CFLocaleCreateLocaleIdentifierFromComponents},
    {"CFLocaleCreateDictionaryFromLocaleIdentifier", lua_CFLocaleCreateDictionaryFromLocaleIdentifier},
    {"CFLocaleLanguageCode", lua_CFLocaleLanguageCode},
    {"CFLocaleCalendarIdentifier", lua_CFLocaleCalendarIdentifier},
    {"CFLocaleRef", lua_CFLocaleRef},
    {"CFLocaleRef", lua_CFLocaleRef},
    {"CFLocaleRef", lua_CFLocaleRef},
    {"CFLocaleGetIdentifier", lua_CFLocaleGetIdentifier},
    {"CFLocaleGetValue", lua_CFLocaleGetValue},
    {"CFLocaleCopyDisplayNameForPropertyValue", lua_CFLocaleCopyDisplayNameForPropertyValue},
    {"CFLocaleCurrentLocaleDidChangeNotification", lua_CFLocaleCurrentLocaleDidChangeNotification},
    {"CFLocaleIdentifier", lua_CFLocaleIdentifier},
    {"CFLocaleLanguageCode", lua_CFLocaleLanguageCode},
    {"CFLocaleCountryCode", lua_CFLocaleCountryCode},
    {"CFLocaleScriptCode", lua_CFLocaleScriptCode},
    {"CFLocaleVariantCode", lua_CFLocaleVariantCode},
    {"CFLocaleExemplarCharacterSet", lua_CFLocaleExemplarCharacterSet},
    {"CFLocaleCalendarIdentifier", lua_CFLocaleCalendarIdentifier},
    {"CFLocaleCalendar", lua_CFLocaleCalendar},
    {"CFLocaleCollationIdentifier", lua_CFLocaleCollationIdentifier},
    {"CFLocaleUsesMetricSystem", lua_CFLocaleUsesMetricSystem},
    {"CFLocaleMeasurementSystem", lua_CFLocaleMeasurementSystem},
    {"CFLocaleDecimalSeparator", lua_CFLocaleDecimalSeparator},
    {"CFLocaleGroupingSeparator", lua_CFLocaleGroupingSeparator},
    {"CFLocaleCurrencySymbol", lua_CFLocaleCurrencySymbol},
    {"CFLocaleCurrencyCode", lua_CFLocaleCurrencyCode},
    {"CFLocaleCollatorIdentifier", lua_CFLocaleCollatorIdentifier},
    {"CFLocaleQuotationBeginDelimiterKey", lua_CFLocaleQuotationBeginDelimiterKey},
    {"CFLocaleQuotationEndDelimiterKey", lua_CFLocaleQuotationEndDelimiterKey},
    {"CFLocaleAlternateQuotationBeginDelimiterKey", lua_CFLocaleAlternateQuotationBeginDelimiterKey},
    {"CFLocaleAlternateQuotationEndDelimiterKey", lua_CFLocaleAlternateQuotationEndDelimiterKey},
    {"CFLocaleCalendarIdentifier", lua_CFLocaleCalendarIdentifier},
    {NULL, NULL},
};

int LuaOpenCFLocale(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFLocaleAPIs);
    return 0;
}
