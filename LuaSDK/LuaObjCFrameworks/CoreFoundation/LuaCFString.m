//
//  LuaCFString.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFString.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFStrings(lua_State *L)
{
    CFStrings(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetPascalStringPtr(lua_State *L)
{
    CFStringGetPascalStringPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCStringPtr(lua_State *L)
{
    CFStringGetCStringPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharactersPtr(lua_State *L)
{
    CFStringGetCharactersPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharactersPtr(lua_State *L)
{
    CFStringGetCharactersPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCStringPtr(lua_State *L)
{
    CFStringGetCStringPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCString(lua_State *L)
{
    CFStringGetCString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCString(lua_State *L)
{
    CFStringGetCString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCString(lua_State *L)
{
    CFStringGetCString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStrings(lua_State *L)
{
    CFStrings(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCreateWithPascalStringNoCopy(lua_State *L)
{
    CFStringCreateWithPascalStringNoCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCreateWithCStringNoCopy(lua_State *L)
{
    CFStringCreateWithCStringNoCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCreateWithCharactersNoCopy(lua_State *L)
{
    CFStringCreateWithCharactersNoCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStrings(lua_State *L)
{
    CFStrings(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCreateMutableWithExternalCharactersNoCopy(lua_State *L)
{
    CFStringCreateMutableWithExternalCharactersNoCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringSetExternalCharactersNoCopy(lua_State *L)
{
    CFStringSetExternalCharactersNoCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringSetExternalCharactersNoCopy(lua_State *L)
{
    CFStringSetExternalCharactersNoCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharactersPtr(lua_State *L)
{
    CFStringGetCharactersPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncoding(lua_State *L)
{
    CFStringEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetSystemEncoding(lua_State *L)
{
    CFStringGetSystemEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingInvalidId(lua_State *L)
{
    CFStringEncodingInvalidId(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingMacRoman(lua_State *L)
{
    CFStringEncodingMacRoman(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingWindowsLatin1(lua_State *L)
{
    CFStringEncodingWindowsLatin1(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingISOLatin1(lua_State *L)
{
    CFStringEncodingISOLatin1(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingNextStepLatin(lua_State *L)
{
    CFStringEncodingNextStepLatin(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingASCII(lua_State *L)
{
    CFStringEncodingASCII(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingUnicode(lua_State *L)
{
    CFStringEncodingUnicode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingUTF8(lua_State *L)
{
    CFStringEncodingUTF8(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingNonLossyASCII(lua_State *L)
{
    CFStringEncodingNonLossyASCII(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingUTF16(lua_State *L)
{
    CFStringEncodingUTF16(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingUTF16BE(lua_State *L)
{
    CFStringEncodingUTF16BE(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingUTF16LE(lua_State *L)
{
    CFStringEncodingUTF16LE(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingUTF32(lua_State *L)
{
    CFStringEncodingUTF32(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingUTF32BE(lua_State *L)
{
    CFStringEncodingUTF32BE(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingUTF32LE(lua_State *L)
{
    CFStringEncodingUTF32LE(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncoding(lua_State *L)
{
    CFStringEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetTypeID(lua_State *L)
{
    CFStringGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRefs(lua_State *L)
{
    CFStringRefs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringMakeConstantString(lua_State *L)
{
    CFStringMakeConstantString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCreateMutable(lua_State *L)
{
    CFStringCreateMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCreateMutableCopy(lua_State *L)
{
    CFStringCreateMutableCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCreateMutableWithExternalCharactersNoCopy(lua_State *L)
{
    CFStringCreateMutableWithExternalCharactersNoCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetLength(lua_State *L)
{
    CFStringGetLength(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharacters(lua_State *L)
{
    CFStringGetCharacters(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharacters(lua_State *L)
{
    CFStringGetCharacters(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharacterFromInlineBuffer(lua_State *L)
{
    CFStringGetCharacterFromInlineBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharacterAtIndex(lua_State *L)
{
    CFStringGetCharacterAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharacters(lua_State *L)
{
    CFStringGetCharacters(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetBytes(lua_State *L)
{
    CFStringGetBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetBytes(lua_State *L)
{
    CFStringGetBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetPascalString(lua_State *L)
{
    CFStringGetPascalString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCString(lua_State *L)
{
    CFStringGetCString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetPascalStringPtr(lua_State *L)
{
    CFStringGetPascalStringPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCStringPtr(lua_State *L)
{
    CFStringGetCStringPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharactersPtr(lua_State *L)
{
    CFStringGetCharactersPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetBytes(lua_State *L)
{
    CFStringGetBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCreateFromExternalRepresentation(lua_State *L)
{
    CFStringCreateFromExternalRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCreateExternalRepresentation(lua_State *L)
{
    CFStringCreateExternalRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetBytes(lua_State *L)
{
    CFStringGetBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCreateExternalRepresentation(lua_State *L)
{
    CFStringCreateExternalRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncoding(lua_State *L)
{
    CFStringEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncoding(lua_State *L)
{
    CFStringEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncoding(lua_State *L)
{
    CFStringEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetMaximumSizeForEncoding(lua_State *L)
{
    CFStringGetMaximumSizeForEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetMaximumSizeOfFileSystemRepresentation(lua_State *L)
{
    CFStringGetMaximumSizeOfFileSystemRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetFileSystemRepresentation(lua_State *L)
{
    CFStringGetFileSystemRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetFileSystemRepresentation(lua_State *L)
{
    CFStringGetFileSystemRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetMaximumSizeOfFileSystemRepresentation(lua_State *L)
{
    CFStringGetMaximumSizeOfFileSystemRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCompareFlags(lua_State *L)
{
    CFStringCompareFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCompareFlags(lua_State *L)
{
    CFStringCompareFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCompareWithOptionsAndLocale(lua_State *L)
{
    CFStringCompareWithOptionsAndLocale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCompareWithOptions(lua_State *L)
{
    CFStringCompareWithOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCompare(lua_State *L)
{
    CFStringCompare(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringFindWithOptionsAndLocale(lua_State *L)
{
    CFStringFindWithOptionsAndLocale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringFindWithOptionsAndLocale(lua_State *L)
{
    CFStringFindWithOptionsAndLocale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringFindWithOptions(lua_State *L)
{
    CFStringFindWithOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCreateArrayWithFindResults(lua_State *L)
{
    CFStringCreateArrayWithFindResults(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCreateArrayWithFindResults(lua_State *L)
{
    CFStringCreateArrayWithFindResults(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringFind(lua_State *L)
{
    CFStringFind(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringHasPrefix(lua_State *L)
{
    CFStringHasPrefix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringHasSuffix(lua_State *L)
{
    CFStringHasSuffix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetRangeOfComposedCharactersAtIndex(lua_State *L)
{
    CFStringGetRangeOfComposedCharactersAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetRangeOfComposedCharactersAtIndex(lua_State *L)
{
    CFStringGetRangeOfComposedCharactersAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringFindCharacterFromSet(lua_State *L)
{
    CFStringFindCharacterFromSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringFindCharacterFromSet(lua_State *L)
{
    CFStringFindCharacterFromSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetLineBounds(lua_State *L)
{
    CFStringGetLineBounds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetLineBounds(lua_State *L)
{
    CFStringGetLineBounds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetParagraphBounds(lua_State *L)
{
    CFStringGetParagraphBounds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetHyphenationLocationBeforeIndex(lua_State *L)
{
    CFStringGetHyphenationLocationBeforeIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringIsHyphenationAvailableForLocale(lua_State *L)
{
    CFStringIsHyphenationAvailableForLocale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetHyphenationLocationBeforeIndex(lua_State *L)
{
    CFStringGetHyphenationLocationBeforeIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringIsHyphenationAvailableForLocale(lua_State *L)
{
    CFStringIsHyphenationAvailableForLocale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCreateArrayBySeparatingStrings(lua_State *L)
{
    CFStringCreateArrayBySeparatingStrings(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetIntValue(lua_State *L)
{
    CFStringGetIntValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetDoubleValue(lua_State *L)
{
    CFStringGetDoubleValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringAppend(lua_State *L)
{
    CFStringAppend(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringDelete(lua_State *L)
{
    CFStringDelete(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringReplace(lua_State *L)
{
    CFStringReplace(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringReplaceAll(lua_State *L)
{
    CFStringReplaceAll(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringAppend(lua_State *L)
{
    CFStringAppend(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringAppendCharacters(lua_State *L)
{
    CFStringAppendCharacters(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringAppendPascalString(lua_State *L)
{
    CFStringAppendPascalString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringAppendCString(lua_State *L)
{
    CFStringAppendCString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringAppendFormat(lua_State *L)
{
    CFStringAppendFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringAppendFormatAndArguments(lua_State *L)
{
    CFStringAppendFormatAndArguments(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringInsert(lua_State *L)
{
    CFStringInsert(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringDelete(lua_State *L)
{
    CFStringDelete(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringReplace(lua_State *L)
{
    CFStringReplace(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringReplaceAll(lua_State *L)
{
    CFStringReplaceAll(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringFindAndReplace(lua_State *L)
{
    CFStringFindAndReplace(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStrings(lua_State *L)
{
    CFStrings(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringSetExternalCharactersNoCopy(lua_State *L)
{
    CFStringSetExternalCharactersNoCopy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringPad(lua_State *L)
{
    CFStringPad(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringPad(lua_State *L)
{
    CFStringPad(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringPad(lua_State *L)
{
    CFStringPad(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringPad(lua_State *L)
{
    CFStringPad(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTrim(lua_State *L)
{
    CFStringTrim(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTrimWhitespace(lua_State *L)
{
    CFStringTrimWhitespace(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTrim(lua_State *L)
{
    CFStringTrim(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTrim(lua_State *L)
{
    CFStringTrim(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringPad(lua_State *L)
{
    CFStringPad(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTrim(lua_State *L)
{
    CFStringTrim(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTrimWhitespace(lua_State *L)
{
    CFStringTrimWhitespace(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringLowercase(lua_State *L)
{
    CFStringLowercase(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringUppercase(lua_State *L)
{
    CFStringUppercase(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringCapitalize(lua_State *L)
{
    CFStringCapitalize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringNormalizationForm(lua_State *L)
{
    CFStringNormalizationForm(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetFileSystemRepresentation(lua_State *L)
{
    CFStringGetFileSystemRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringNormalizationFormD(lua_State *L)
{
    CFStringNormalizationFormD(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringNormalizationFormKD(lua_State *L)
{
    CFStringNormalizationFormKD(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringNormalizationFormC(lua_State *L)
{
    CFStringNormalizationFormC(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringNormalizationFormKC(lua_State *L)
{
    CFStringNormalizationFormKC(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringNormalizationForm(lua_State *L)
{
    CFStringNormalizationForm(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringNormalize(lua_State *L)
{
    CFStringNormalize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringNormalizationForm(lua_State *L)
{
    CFStringNormalizationForm(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringNormalize(lua_State *L)
{
    CFStringNormalize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringFold(lua_State *L)
{
    CFStringFold(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringNormalize(lua_State *L)
{
    CFStringNormalize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringFold(lua_State *L)
{
    CFStringFold(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTransform(lua_State *L)
{
    CFStringTransform(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTransform(lua_State *L)
{
    CFStringTransform(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringIsEncodingAvailable(lua_State *L)
{
    CFStringIsEncodingAvailable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingInvalidId(lua_State *L)
{
    CFStringEncodingInvalidId(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncoding(lua_State *L)
{
    CFStringEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingInvalidId(lua_State *L)
{
    CFStringEncodingInvalidId(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringConvertEncodingToNSStringEncoding(lua_State *L)
{
    CFStringConvertEncodingToNSStringEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncoding(lua_State *L)
{
    CFStringEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingInvalidId(lua_State *L)
{
    CFStringEncodingInvalidId(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringConvertEncodingToWindowsCodepage(lua_State *L)
{
    CFStringConvertEncodingToWindowsCodepage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncoding(lua_State *L)
{
    CFStringEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingInvalidId(lua_State *L)
{
    CFStringEncodingInvalidId(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncoding(lua_State *L)
{
    CFStringEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingMacRoman(lua_State *L)
{
    CFStringEncodingMacRoman(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingWindowsLatin1(lua_State *L)
{
    CFStringEncodingWindowsLatin1(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncodingISO_2022_JP(lua_State *L)
{
    CFStringEncodingISO_2022_JP(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringEncoding(lua_State *L)
{
    CFStringEncoding(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringInitInlineBuffer(lua_State *L)
{
    CFStringInitInlineBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharacterFromInlineBuffer(lua_State *L)
{
    CFStringGetCharacterFromInlineBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharacterFromInlineBuffer(lua_State *L)
{
    CFStringGetCharacterFromInlineBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringInlineBufferLength(lua_State *L)
{
    CFStringInlineBufferLength(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringInlineBufferLength(lua_State *L)
{
    CFStringInlineBufferLength(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringInlineBuffer(lua_State *L)
{
    CFStringInlineBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringInitInlineBuffer(lua_State *L)
{
    CFStringInitInlineBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharactersPtr(lua_State *L)
{
    CFStringGetCharactersPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharacterFromInlineBuffer(lua_State *L)
{
    CFStringGetCharacterFromInlineBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringInlineBufferLength(lua_State *L)
{
    CFStringInlineBufferLength(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharacters(lua_State *L)
{
    CFStringGetCharacters(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringInitInlineBuffer(lua_State *L)
{
    CFStringInitInlineBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharactersPtr(lua_State *L)
{
    CFStringGetCharactersPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharacterFromInlineBuffer(lua_State *L)
{
    CFStringGetCharacterFromInlineBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetCharacterAtIndex(lua_State *L)
{
    CFStringGetCharacterAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringIsSurrogateHighCharacter(lua_State *L)
{
    CFStringIsSurrogateHighCharacter(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringIsSurrogateLowCharacter(lua_State *L)
{
    CFStringIsSurrogateLowCharacter(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetLongCharacterForSurrogatePair(lua_State *L)
{
    CFStringGetLongCharacterForSurrogatePair(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringGetSurrogatePairForLongCharacter(lua_State *L)
{
    CFStringGetSurrogatePairForLongCharacter(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringRef(lua_State *L)
{
    CFStringRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFStringAPIs[] = {
    {"CFStrings", lua_CFStrings},
    {"CFStringGetPascalStringPtr", lua_CFStringGetPascalStringPtr},
    {"CFStringGetCStringPtr", lua_CFStringGetCStringPtr},
    {"CFStringGetCharactersPtr", lua_CFStringGetCharactersPtr},
    {"CFStringGetCharactersPtr", lua_CFStringGetCharactersPtr},
    {"CFStringGetCStringPtr", lua_CFStringGetCStringPtr},
    {"CFStringGetCString", lua_CFStringGetCString},
    {"CFStringGetCString", lua_CFStringGetCString},
    {"CFStringGetCString", lua_CFStringGetCString},
    {"CFStrings", lua_CFStrings},
    {"CFStringCreateWithPascalStringNoCopy", lua_CFStringCreateWithPascalStringNoCopy},
    {"CFStringCreateWithCStringNoCopy", lua_CFStringCreateWithCStringNoCopy},
    {"CFStringCreateWithCharactersNoCopy", lua_CFStringCreateWithCharactersNoCopy},
    {"CFStrings", lua_CFStrings},
    {"CFStringCreateMutableWithExternalCharactersNoCopy", lua_CFStringCreateMutableWithExternalCharactersNoCopy},
    {"CFStringSetExternalCharactersNoCopy", lua_CFStringSetExternalCharactersNoCopy},
    {"CFStringSetExternalCharactersNoCopy", lua_CFStringSetExternalCharactersNoCopy},
    {"CFStringGetCharactersPtr", lua_CFStringGetCharactersPtr},
    {"CFStringEncoding", lua_CFStringEncoding},
    {"CFStringGetSystemEncoding", lua_CFStringGetSystemEncoding},
    {"CFStringEncodingInvalidId", lua_CFStringEncodingInvalidId},
    {"CFStringEncodingMacRoman", lua_CFStringEncodingMacRoman},
    {"CFStringEncodingWindowsLatin1", lua_CFStringEncodingWindowsLatin1},
    {"CFStringEncodingISOLatin1", lua_CFStringEncodingISOLatin1},
    {"CFStringEncodingNextStepLatin", lua_CFStringEncodingNextStepLatin},
    {"CFStringEncodingASCII", lua_CFStringEncodingASCII},
    {"CFStringEncodingUnicode", lua_CFStringEncodingUnicode},
    {"CFStringEncodingUTF8", lua_CFStringEncodingUTF8},
    {"CFStringEncodingNonLossyASCII", lua_CFStringEncodingNonLossyASCII},
    {"CFStringEncodingUTF16", lua_CFStringEncodingUTF16},
    {"CFStringEncodingUTF16BE", lua_CFStringEncodingUTF16BE},
    {"CFStringEncodingUTF16LE", lua_CFStringEncodingUTF16LE},
    {"CFStringEncodingUTF32", lua_CFStringEncodingUTF32},
    {"CFStringEncodingUTF32BE", lua_CFStringEncodingUTF32BE},
    {"CFStringEncodingUTF32LE", lua_CFStringEncodingUTF32LE},
    {"CFStringEncoding", lua_CFStringEncoding},
    {"CFStringGetTypeID", lua_CFStringGetTypeID},
    {"CFStringRefs", lua_CFStringRefs},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringMakeConstantString", lua_CFStringMakeConstantString},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringCreateMutable", lua_CFStringCreateMutable},
    {"CFStringCreateMutableCopy", lua_CFStringCreateMutableCopy},
    {"CFStringCreateMutableWithExternalCharactersNoCopy", lua_CFStringCreateMutableWithExternalCharactersNoCopy},
    {"CFStringGetLength", lua_CFStringGetLength},
    {"CFStringGetCharacters", lua_CFStringGetCharacters},
    {"CFStringGetCharacters", lua_CFStringGetCharacters},
    {"CFStringGetCharacterFromInlineBuffer", lua_CFStringGetCharacterFromInlineBuffer},
    {"CFStringGetCharacterAtIndex", lua_CFStringGetCharacterAtIndex},
    {"CFStringGetCharacters", lua_CFStringGetCharacters},
    {"CFStringGetBytes", lua_CFStringGetBytes},
    {"CFStringGetBytes", lua_CFStringGetBytes},
    {"CFStringGetPascalString", lua_CFStringGetPascalString},
    {"CFStringGetCString", lua_CFStringGetCString},
    {"CFStringGetPascalStringPtr", lua_CFStringGetPascalStringPtr},
    {"CFStringGetCStringPtr", lua_CFStringGetCStringPtr},
    {"CFStringGetCharactersPtr", lua_CFStringGetCharactersPtr},
    {"CFStringGetBytes", lua_CFStringGetBytes},
    {"CFStringCreateFromExternalRepresentation", lua_CFStringCreateFromExternalRepresentation},
    {"CFStringCreateExternalRepresentation", lua_CFStringCreateExternalRepresentation},
    {"CFStringGetBytes", lua_CFStringGetBytes},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringCreateExternalRepresentation", lua_CFStringCreateExternalRepresentation},
    {"CFStringEncoding", lua_CFStringEncoding},
    {"CFStringEncoding", lua_CFStringEncoding},
    {"CFStringEncoding", lua_CFStringEncoding},
    {"CFStringGetMaximumSizeForEncoding", lua_CFStringGetMaximumSizeForEncoding},
    {"CFStringGetMaximumSizeOfFileSystemRepresentation", lua_CFStringGetMaximumSizeOfFileSystemRepresentation},
    {"CFStringGetFileSystemRepresentation", lua_CFStringGetFileSystemRepresentation},
    {"CFStringGetFileSystemRepresentation", lua_CFStringGetFileSystemRepresentation},
    {"CFStringGetMaximumSizeOfFileSystemRepresentation", lua_CFStringGetMaximumSizeOfFileSystemRepresentation},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringCompareFlags", lua_CFStringCompareFlags},
    {"CFStringCompareFlags", lua_CFStringCompareFlags},
    {"CFStringCompareWithOptionsAndLocale", lua_CFStringCompareWithOptionsAndLocale},
    {"CFStringCompareWithOptions", lua_CFStringCompareWithOptions},
    {"CFStringCompare", lua_CFStringCompare},
    {"CFStringFindWithOptionsAndLocale", lua_CFStringFindWithOptionsAndLocale},
    {"CFStringFindWithOptionsAndLocale", lua_CFStringFindWithOptionsAndLocale},
    {"CFStringFindWithOptions", lua_CFStringFindWithOptions},
    {"CFStringCreateArrayWithFindResults", lua_CFStringCreateArrayWithFindResults},
    {"CFStringCreateArrayWithFindResults", lua_CFStringCreateArrayWithFindResults},
    {"CFStringFind", lua_CFStringFind},
    {"CFStringHasPrefix", lua_CFStringHasPrefix},
    {"CFStringHasSuffix", lua_CFStringHasSuffix},
    {"CFStringGetRangeOfComposedCharactersAtIndex", lua_CFStringGetRangeOfComposedCharactersAtIndex},
    {"CFStringGetRangeOfComposedCharactersAtIndex", lua_CFStringGetRangeOfComposedCharactersAtIndex},
    {"CFStringFindCharacterFromSet", lua_CFStringFindCharacterFromSet},
    {"CFStringFindCharacterFromSet", lua_CFStringFindCharacterFromSet},
    {"CFStringGetLineBounds", lua_CFStringGetLineBounds},
    {"CFStringGetLineBounds", lua_CFStringGetLineBounds},
    {"CFStringGetParagraphBounds", lua_CFStringGetParagraphBounds},
    {"CFStringGetHyphenationLocationBeforeIndex", lua_CFStringGetHyphenationLocationBeforeIndex},
    {"CFStringIsHyphenationAvailableForLocale", lua_CFStringIsHyphenationAvailableForLocale},
    {"CFStringGetHyphenationLocationBeforeIndex", lua_CFStringGetHyphenationLocationBeforeIndex},
    {"CFStringIsHyphenationAvailableForLocale", lua_CFStringIsHyphenationAvailableForLocale},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringCreateArrayBySeparatingStrings", lua_CFStringCreateArrayBySeparatingStrings},
    {"CFStringGetIntValue", lua_CFStringGetIntValue},
    {"CFStringGetDoubleValue", lua_CFStringGetDoubleValue},
    {"CFStringAppend", lua_CFStringAppend},
    {"CFStringDelete", lua_CFStringDelete},
    {"CFStringReplace", lua_CFStringReplace},
    {"CFStringReplaceAll", lua_CFStringReplaceAll},
    {"CFStringAppend", lua_CFStringAppend},
    {"CFStringAppendCharacters", lua_CFStringAppendCharacters},
    {"CFStringAppendPascalString", lua_CFStringAppendPascalString},
    {"CFStringAppendCString", lua_CFStringAppendCString},
    {"CFStringAppendFormat", lua_CFStringAppendFormat},
    {"CFStringAppendFormatAndArguments", lua_CFStringAppendFormatAndArguments},
    {"CFStringInsert", lua_CFStringInsert},
    {"CFStringDelete", lua_CFStringDelete},
    {"CFStringReplace", lua_CFStringReplace},
    {"CFStringReplaceAll", lua_CFStringReplaceAll},
    {"CFStringFindAndReplace", lua_CFStringFindAndReplace},
    {"CFStrings", lua_CFStrings},
    {"CFStringSetExternalCharactersNoCopy", lua_CFStringSetExternalCharactersNoCopy},
    {"CFStringPad", lua_CFStringPad},
    {"CFStringPad", lua_CFStringPad},
    {"CFStringPad", lua_CFStringPad},
    {"CFStringPad", lua_CFStringPad},
    {"CFStringTrim", lua_CFStringTrim},
    {"CFStringTrimWhitespace", lua_CFStringTrimWhitespace},
    {"CFStringTrim", lua_CFStringTrim},
    {"CFStringTrim", lua_CFStringTrim},
    {"CFStringPad", lua_CFStringPad},
    {"CFStringTrim", lua_CFStringTrim},
    {"CFStringTrimWhitespace", lua_CFStringTrimWhitespace},
    {"CFStringLowercase", lua_CFStringLowercase},
    {"CFStringUppercase", lua_CFStringUppercase},
    {"CFStringCapitalize", lua_CFStringCapitalize},
    {"CFStringNormalizationForm", lua_CFStringNormalizationForm},
    {"CFStringGetFileSystemRepresentation", lua_CFStringGetFileSystemRepresentation},
    {"CFStringNormalizationFormD", lua_CFStringNormalizationFormD},
    {"CFStringNormalizationFormKD", lua_CFStringNormalizationFormKD},
    {"CFStringNormalizationFormC", lua_CFStringNormalizationFormC},
    {"CFStringNormalizationFormKC", lua_CFStringNormalizationFormKC},
    {"CFStringNormalizationForm", lua_CFStringNormalizationForm},
    {"CFStringNormalize", lua_CFStringNormalize},
    {"CFStringNormalizationForm", lua_CFStringNormalizationForm},
    {"CFStringNormalize", lua_CFStringNormalize},
    {"CFStringFold", lua_CFStringFold},
    {"CFStringNormalize", lua_CFStringNormalize},
    {"CFStringFold", lua_CFStringFold},
    {"CFStringTransform", lua_CFStringTransform},
    {"CFStringTransform", lua_CFStringTransform},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringIsEncodingAvailable", lua_CFStringIsEncodingAvailable},
    {"CFStringEncodingInvalidId", lua_CFStringEncodingInvalidId},
    {"CFStringEncoding", lua_CFStringEncoding},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringEncodingInvalidId", lua_CFStringEncodingInvalidId},
    {"CFStringConvertEncodingToNSStringEncoding", lua_CFStringConvertEncodingToNSStringEncoding},
    {"CFStringEncoding", lua_CFStringEncoding},
    {"CFStringEncodingInvalidId", lua_CFStringEncodingInvalidId},
    {"CFStringConvertEncodingToWindowsCodepage", lua_CFStringConvertEncodingToWindowsCodepage},
    {"CFStringEncoding", lua_CFStringEncoding},
    {"CFStringEncodingInvalidId", lua_CFStringEncodingInvalidId},
    {"CFStringEncoding", lua_CFStringEncoding},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringEncodingMacRoman", lua_CFStringEncodingMacRoman},
    {"CFStringEncodingWindowsLatin1", lua_CFStringEncodingWindowsLatin1},
    {"CFStringEncodingISO_2022_JP", lua_CFStringEncodingISO_2022_JP},
    {"CFStringEncoding", lua_CFStringEncoding},
    {"CFStringInitInlineBuffer", lua_CFStringInitInlineBuffer},
    {"CFStringGetCharacterFromInlineBuffer", lua_CFStringGetCharacterFromInlineBuffer},
    {"CFStringGetCharacterFromInlineBuffer", lua_CFStringGetCharacterFromInlineBuffer},
    {"CFStringInlineBufferLength", lua_CFStringInlineBufferLength},
    {"CFStringInlineBufferLength", lua_CFStringInlineBufferLength},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringInlineBuffer", lua_CFStringInlineBuffer},
    {"CFStringInitInlineBuffer", lua_CFStringInitInlineBuffer},
    {"CFStringGetCharactersPtr", lua_CFStringGetCharactersPtr},
    {"CFStringGetCharacterFromInlineBuffer", lua_CFStringGetCharacterFromInlineBuffer},
    {"CFStringInlineBufferLength", lua_CFStringInlineBufferLength},
    {"CFStringGetCharacters", lua_CFStringGetCharacters},
    {"CFStringInitInlineBuffer", lua_CFStringInitInlineBuffer},
    {"CFStringGetCharactersPtr", lua_CFStringGetCharactersPtr},
    {"CFStringGetCharacterFromInlineBuffer", lua_CFStringGetCharacterFromInlineBuffer},
    {"CFStringGetCharacterAtIndex", lua_CFStringGetCharacterAtIndex},
    {"CFStringIsSurrogateHighCharacter", lua_CFStringIsSurrogateHighCharacter},
    {"CFStringIsSurrogateLowCharacter", lua_CFStringIsSurrogateLowCharacter},
    {"CFStringGetLongCharacterForSurrogatePair", lua_CFStringGetLongCharacterForSurrogatePair},
    {"CFStringGetSurrogatePairForLongCharacter", lua_CFStringGetSurrogatePairForLongCharacter},
    {"CFStringRef", lua_CFStringRef},
    {"CFStringRef", lua_CFStringRef},
    {NULL, NULL},
};

int LuaOpenCFString(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFStringAPIs);
    return 0;
}
