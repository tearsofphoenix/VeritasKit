//
//  LuaNSString.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSString.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __LuaNSStringConstants[] = {
    {"NSCaseInsensitiveSearch", NSCaseInsensitiveSearch},
    {"NSLiteralSearch", NSLiteralSearch},
    {"NSBackwardsSearch", NSBackwardsSearch},
    {"NSAnchoredSearch", NSAnchoredSearch},
    {"NSNumericSearch", NSNumericSearch},
    {"NSDiacriticInsensitiveSearch", NSDiacriticInsensitiveSearch},
    {"NSWidthInsensitiveSearch", NSWidthInsensitiveSearch},
    {"NSForcedOrderingSearch", NSForcedOrderingSearch},
    {"NSRegularExpressionSearch", NSRegularExpressionSearch},

    {"NSASCIIStringEncoding", NSASCIIStringEncoding},
    {"NSNEXTSTEPStringEncoding", NSNEXTSTEPStringEncoding},
    {"NSJapaneseEUCStringEncoding", NSJapaneseEUCStringEncoding},
    {"NSUTF8StringEncoding", NSUTF8StringEncoding},
    {"NSISOLatin1StringEncoding", NSISOLatin1StringEncoding},
    {"NSSymbolStringEncoding", NSSymbolStringEncoding},
    {"NSNonLossyASCIIStringEncoding", NSNonLossyASCIIStringEncoding},
    {"NSShiftJISStringEncoding", NSShiftJISStringEncoding},
    {"NSISOLatin2StringEncoding", NSISOLatin2StringEncoding},
    {"NSUnicodeStringEncoding", NSUnicodeStringEncoding},
    {"NSWindowsCP1251StringEncoding", NSWindowsCP1251StringEncoding},
    {"NSWindowsCP1252StringEncoding", NSWindowsCP1252StringEncoding},
    {"NSWindowsCP1253StringEncoding", NSWindowsCP1253StringEncoding},
    {"NSWindowsCP1254StringEncoding", NSWindowsCP1254StringEncoding},
    {"NSWindowsCP1250StringEncoding", NSWindowsCP1250StringEncoding},
    {"NSISO2022JPStringEncoding", NSISO2022JPStringEncoding},
    {"NSMacOSRomanStringEncoding", NSMacOSRomanStringEncoding},
    {"NSUTF16StringEncoding", NSUTF16StringEncoding},
    {"NSUTF16BigEndianStringEncoding", NSUTF16BigEndianStringEncoding},
    {"NSUTF16LittleEndianStringEncoding", NSUTF16LittleEndianStringEncoding},
    {"NSUTF32StringEncoding", NSUTF32StringEncoding},
    {"NSUTF32BigEndianStringEncoding", NSUTF32BigEndianStringEncoding},
    {"NSUTF32LittleEndianStringEncoding", NSUTF32LittleEndianStringEncoding},
    {"NSStringEncodingConversionAllowLossy", NSStringEncodingConversionAllowLossy},
    {"NSStringEncodingConversionExternalRepresentation", NSStringEncodingConversionExternalRepresentation},
    {"NSStringEnumerationByLines", NSStringEnumerationByLines},
    {"NSStringEnumerationByParagraphs", NSStringEnumerationByParagraphs},
    {"NSStringEnumerationByComposedCharacterSequences", NSStringEnumerationByComposedCharacterSequences},
    {"NSStringEnumerationByWords", NSStringEnumerationByWords},
    {"NSStringEnumerationBySentences", NSStringEnumerationBySentences},
    {"NSStringEnumerationReverse", NSStringEnumerationReverse},
    {"NSStringEnumerationSubstringNotRequired", NSStringEnumerationSubstringNotRequired},
    {"NSStringEnumerationLocalized", NSStringEnumerationLocalized},
    {"NSProprietaryStringEncoding", NSProprietaryStringEncoding},
    {NULL, 0},
};

static int lua_NSConstantStringCreate(lua_State *L)
{
    const char* str = lua_tostring(L, 1);
    NSString *constantString = [[NSString alloc] initWithUTF8String: str];
    luaObjC_pushNSObject(L, constantString);
    return 1;
}

static const luaL_Reg __LuaNSStringFunctions[] = 
{
    {"__NSConstantString", lua_NSConstantStringCreate},
    {NULL, NULL},
};

int LuaOpenNSString(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __LuaNSStringConstants);
    luaObjC_loadGlobalFunctions(L, __LuaNSStringFunctions);
    return 0;
}
