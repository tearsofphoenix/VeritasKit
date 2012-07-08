//
//  LuaCFStringTokenizer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFStringTokenizer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFStringTokenizerGoToTokenAtIndex(lua_State *L)
{
    CFStringTokenizerGoToTokenAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerAdvanceToNextToken(lua_State *L)
{
    CFStringTokenizerAdvanceToNextToken(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetCurrentTokenRange(lua_State *L)
{
    CFStringTokenizerGetCurrentTokenRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCopyCurrentTokenAttribute(lua_State *L)
{
    CFStringTokenizerCopyCurrentTokenAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetCurrentSubTokens(lua_State *L)
{
    CFStringTokenizerGetCurrentSubTokens(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCopyBestStringLanguage(lua_State *L)
{
    CFStringTokenizerCopyBestStringLanguage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCopyBestStringLanguage(lua_State *L)
{
    CFStringTokenizerCopyBestStringLanguage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCopyBestStringLanguage(lua_State *L)
{
    CFStringTokenizerCopyBestStringLanguage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerRef(lua_State *L)
{
    CFStringTokenizerRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCreate(lua_State *L)
{
    CFStringTokenizerCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitWord(lua_State *L)
{
    CFStringTokenizerUnitWord(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitWord(lua_State *L)
{
    CFStringTokenizerUnitWord(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitSentence(lua_State *L)
{
    CFStringTokenizerUnitSentence(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitParagraph(lua_State *L)
{
    CFStringTokenizerUnitParagraph(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitLineBreak(lua_State *L)
{
    CFStringTokenizerUnitLineBreak(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitWordBoundary(lua_State *L)
{
    CFStringTokenizerUnitWordBoundary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCreate(lua_State *L)
{
    CFStringTokenizerCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitWordBoundary(lua_State *L)
{
    CFStringTokenizerUnitWordBoundary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitWordBoundary(lua_State *L)
{
    CFStringTokenizerUnitWordBoundary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCopyCurrentTokenAttribute(lua_State *L)
{
    CFStringTokenizerCopyCurrentTokenAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitWord(lua_State *L)
{
    CFStringTokenizerUnitWord(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitWordBoundary(lua_State *L)
{
    CFStringTokenizerUnitWordBoundary(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerAttributeLatinTranscription(lua_State *L)
{
    CFStringTokenizerAttributeLatinTranscription(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitSentence(lua_State *L)
{
    CFStringTokenizerUnitSentence(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitParagraph(lua_State *L)
{
    CFStringTokenizerUnitParagraph(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerAttributeLanguage(lua_State *L)
{
    CFStringTokenizerAttributeLanguage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGoToTokenAtIndex(lua_State *L)
{
    CFStringTokenizerGoToTokenAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenNone(lua_State *L)
{
    CFStringTokenizerTokenNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenNormal(lua_State *L)
{
    CFStringTokenizerTokenNormal(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetCurrentSubTokens(lua_State *L)
{
    CFStringTokenizerGetCurrentSubTokens(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenHasSubTokensMask(lua_State *L)
{
    CFStringTokenizerTokenHasSubTokensMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetCurrentSubTokens(lua_State *L)
{
    CFStringTokenizerGetCurrentSubTokens(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenHasDerivedSubTokensMask(lua_State *L)
{
    CFStringTokenizerTokenHasDerivedSubTokensMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenHasHasNumbersMask(lua_State *L)
{
    CFStringTokenizerTokenHasHasNumbersMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenHasNonLettersMask(lua_State *L)
{
    CFStringTokenizerTokenHasNonLettersMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenIsCJWordMask(lua_State *L)
{
    CFStringTokenizerTokenIsCJWordMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenType(lua_State *L)
{
    CFStringTokenizerTokenType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetTypeID(lua_State *L)
{
    CFStringTokenizerGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetTypeID(lua_State *L)
{
    CFStringTokenizerGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCreate(lua_State *L)
{
    CFStringTokenizerCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitWord(lua_State *L)
{
    CFStringTokenizerUnitWord(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerUnitWord(lua_State *L)
{
    CFStringTokenizerUnitWord(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerRef(lua_State *L)
{
    CFStringTokenizerRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerSetString(lua_State *L)
{
    CFStringTokenizerSetString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCreate(lua_State *L)
{
    CFStringTokenizerCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerSetString(lua_State *L)
{
    CFStringTokenizerSetString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGoToTokenAtIndex(lua_State *L)
{
    CFStringTokenizerGoToTokenAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCreate(lua_State *L)
{
    CFStringTokenizerCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenNone(lua_State *L)
{
    CFStringTokenizerTokenNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetCurrentTokenRange(lua_State *L)
{
    CFStringTokenizerGetCurrentTokenRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenHasSubTokensMask(lua_State *L)
{
    CFStringTokenizerTokenHasSubTokensMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenHasDerivedSubTokensMask(lua_State *L)
{
    CFStringTokenizerTokenHasDerivedSubTokensMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetCurrentSubTokens(lua_State *L)
{
    CFStringTokenizerGetCurrentSubTokens(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenType(lua_State *L)
{
    CFStringTokenizerTokenType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerAdvanceToNextToken(lua_State *L)
{
    CFStringTokenizerAdvanceToNextToken(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCreate(lua_State *L)
{
    CFStringTokenizerCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenNone(lua_State *L)
{
    CFStringTokenizerTokenNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGoToTokenAtIndex(lua_State *L)
{
    CFStringTokenizerGoToTokenAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerAdvanceToNextToken(lua_State *L)
{
    CFStringTokenizerAdvanceToNextToken(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCreate(lua_State *L)
{
    CFStringTokenizerCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGoToTokenAtIndex(lua_State *L)
{
    CFStringTokenizerGoToTokenAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenNone(lua_State *L)
{
    CFStringTokenizerTokenNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetCurrentTokenRange(lua_State *L)
{
    CFStringTokenizerGetCurrentTokenRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCopyCurrentTokenAttribute(lua_State *L)
{
    CFStringTokenizerCopyCurrentTokenAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenHasSubTokensMask(lua_State *L)
{
    CFStringTokenizerTokenHasSubTokensMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenHasDerivedSubTokensMask(lua_State *L)
{
    CFStringTokenizerTokenHasDerivedSubTokensMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetCurrentSubTokens(lua_State *L)
{
    CFStringTokenizerGetCurrentSubTokens(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenType(lua_State *L)
{
    CFStringTokenizerTokenType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetCurrentTokenRange(lua_State *L)
{
    CFStringTokenizerGetCurrentTokenRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCreate(lua_State *L)
{
    CFStringTokenizerCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetCurrentTokenRange(lua_State *L)
{
    CFStringTokenizerGetCurrentTokenRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCopyCurrentTokenAttribute(lua_State *L)
{
    CFStringTokenizerCopyCurrentTokenAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCreate(lua_State *L)
{
    CFStringTokenizerCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerAttributeLatinTranscription(lua_State *L)
{
    CFStringTokenizerAttributeLatinTranscription(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerAttributeLanguage(lua_State *L)
{
    CFStringTokenizerAttributeLanguage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCopyCurrentTokenAttribute(lua_State *L)
{
    CFStringTokenizerCopyCurrentTokenAttribute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetCurrentSubTokens(lua_State *L)
{
    CFStringTokenizerGetCurrentSubTokens(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCreate(lua_State *L)
{
    CFStringTokenizerCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerCreate(lua_State *L)
{
    CFStringTokenizerCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenNone(lua_State *L)
{
    CFStringTokenizerTokenNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenNormal(lua_State *L)
{
    CFStringTokenizerTokenNormal(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenHasSubTokensMask(lua_State *L)
{
    CFStringTokenizerTokenHasSubTokensMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenHasDerivedSubTokensMask(lua_State *L)
{
    CFStringTokenizerTokenHasDerivedSubTokensMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerTokenHasSubTokensMask(lua_State *L)
{
    CFStringTokenizerTokenHasSubTokensMask(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStringTokenizerGetCurrentSubTokens(lua_State *L)
{
    CFStringTokenizerGetCurrentSubTokens(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFStringTokenizerAPIs[] = {
    {"CFStringTokenizerGoToTokenAtIndex", lua_CFStringTokenizerGoToTokenAtIndex},
    {"CFStringTokenizerAdvanceToNextToken", lua_CFStringTokenizerAdvanceToNextToken},
    {"CFStringTokenizerGetCurrentTokenRange", lua_CFStringTokenizerGetCurrentTokenRange},
    {"CFStringTokenizerCopyCurrentTokenAttribute", lua_CFStringTokenizerCopyCurrentTokenAttribute},
    {"CFStringTokenizerGetCurrentSubTokens", lua_CFStringTokenizerGetCurrentSubTokens},
    {"CFStringTokenizerCopyBestStringLanguage", lua_CFStringTokenizerCopyBestStringLanguage},
    {"CFStringTokenizerCopyBestStringLanguage", lua_CFStringTokenizerCopyBestStringLanguage},
    {"CFStringTokenizerCopyBestStringLanguage", lua_CFStringTokenizerCopyBestStringLanguage},
    {"CFStringTokenizerRef", lua_CFStringTokenizerRef},
    {"CFStringTokenizerCreate", lua_CFStringTokenizerCreate},
    {"CFStringTokenizerUnitWord", lua_CFStringTokenizerUnitWord},
    {"CFStringTokenizerUnitWord", lua_CFStringTokenizerUnitWord},
    {"CFStringTokenizerUnitSentence", lua_CFStringTokenizerUnitSentence},
    {"CFStringTokenizerUnitParagraph", lua_CFStringTokenizerUnitParagraph},
    {"CFStringTokenizerUnitLineBreak", lua_CFStringTokenizerUnitLineBreak},
    {"CFStringTokenizerUnitWordBoundary", lua_CFStringTokenizerUnitWordBoundary},
    {"CFStringTokenizerCreate", lua_CFStringTokenizerCreate},
    {"CFStringTokenizerUnitWordBoundary", lua_CFStringTokenizerUnitWordBoundary},
    {"CFStringTokenizerUnitWordBoundary", lua_CFStringTokenizerUnitWordBoundary},
    {"CFStringTokenizerCopyCurrentTokenAttribute", lua_CFStringTokenizerCopyCurrentTokenAttribute},
    {"CFStringTokenizerUnitWord", lua_CFStringTokenizerUnitWord},
    {"CFStringTokenizerUnitWordBoundary", lua_CFStringTokenizerUnitWordBoundary},
    {"CFStringTokenizerAttributeLatinTranscription", lua_CFStringTokenizerAttributeLatinTranscription},
    {"CFStringTokenizerUnitSentence", lua_CFStringTokenizerUnitSentence},
    {"CFStringTokenizerUnitParagraph", lua_CFStringTokenizerUnitParagraph},
    {"CFStringTokenizerAttributeLanguage", lua_CFStringTokenizerAttributeLanguage},
    {"CFStringTokenizerGoToTokenAtIndex", lua_CFStringTokenizerGoToTokenAtIndex},
    {"CFStringTokenizerTokenNone", lua_CFStringTokenizerTokenNone},
    {"CFStringTokenizerTokenNormal", lua_CFStringTokenizerTokenNormal},
    {"CFStringTokenizerGetCurrentSubTokens", lua_CFStringTokenizerGetCurrentSubTokens},
    {"CFStringTokenizerTokenHasSubTokensMask", lua_CFStringTokenizerTokenHasSubTokensMask},
    {"CFStringTokenizerGetCurrentSubTokens", lua_CFStringTokenizerGetCurrentSubTokens},
    {"CFStringTokenizerTokenHasDerivedSubTokensMask", lua_CFStringTokenizerTokenHasDerivedSubTokensMask},
    {"CFStringTokenizerTokenHasHasNumbersMask", lua_CFStringTokenizerTokenHasHasNumbersMask},
    {"CFStringTokenizerTokenHasNonLettersMask", lua_CFStringTokenizerTokenHasNonLettersMask},
    {"CFStringTokenizerTokenIsCJWordMask", lua_CFStringTokenizerTokenIsCJWordMask},
    {"CFStringTokenizerTokenType", lua_CFStringTokenizerTokenType},
    {"CFStringTokenizerGetTypeID", lua_CFStringTokenizerGetTypeID},
    {"CFStringTokenizerGetTypeID", lua_CFStringTokenizerGetTypeID},
    {"CFStringTokenizerCreate", lua_CFStringTokenizerCreate},
    {"CFStringTokenizerUnitWord", lua_CFStringTokenizerUnitWord},
    {"CFStringTokenizerUnitWord", lua_CFStringTokenizerUnitWord},
    {"CFStringTokenizerRef", lua_CFStringTokenizerRef},
    {"CFStringTokenizerSetString", lua_CFStringTokenizerSetString},
    {"CFStringTokenizerCreate", lua_CFStringTokenizerCreate},
    {"CFStringTokenizerSetString", lua_CFStringTokenizerSetString},
    {"CFStringTokenizerGoToTokenAtIndex", lua_CFStringTokenizerGoToTokenAtIndex},
    {"CFStringTokenizerCreate", lua_CFStringTokenizerCreate},
    {"CFStringTokenizerTokenNone", lua_CFStringTokenizerTokenNone},
    {"CFStringTokenizerGetCurrentTokenRange", lua_CFStringTokenizerGetCurrentTokenRange},
    {"CFStringTokenizerTokenHasSubTokensMask", lua_CFStringTokenizerTokenHasSubTokensMask},
    {"CFStringTokenizerTokenHasDerivedSubTokensMask", lua_CFStringTokenizerTokenHasDerivedSubTokensMask},
    {"CFStringTokenizerGetCurrentSubTokens", lua_CFStringTokenizerGetCurrentSubTokens},
    {"CFStringTokenizerTokenType", lua_CFStringTokenizerTokenType},
    {"CFStringTokenizerAdvanceToNextToken", lua_CFStringTokenizerAdvanceToNextToken},
    {"CFStringTokenizerCreate", lua_CFStringTokenizerCreate},
    {"CFStringTokenizerTokenNone", lua_CFStringTokenizerTokenNone},
    {"CFStringTokenizerGoToTokenAtIndex", lua_CFStringTokenizerGoToTokenAtIndex},
    {"CFStringTokenizerAdvanceToNextToken", lua_CFStringTokenizerAdvanceToNextToken},
    {"CFStringTokenizerCreate", lua_CFStringTokenizerCreate},
    {"CFStringTokenizerGoToTokenAtIndex", lua_CFStringTokenizerGoToTokenAtIndex},
    {"CFStringTokenizerTokenNone", lua_CFStringTokenizerTokenNone},
    {"CFStringTokenizerGetCurrentTokenRange", lua_CFStringTokenizerGetCurrentTokenRange},
    {"CFStringTokenizerCopyCurrentTokenAttribute", lua_CFStringTokenizerCopyCurrentTokenAttribute},
    {"CFStringTokenizerTokenHasSubTokensMask", lua_CFStringTokenizerTokenHasSubTokensMask},
    {"CFStringTokenizerTokenHasDerivedSubTokensMask", lua_CFStringTokenizerTokenHasDerivedSubTokensMask},
    {"CFStringTokenizerGetCurrentSubTokens", lua_CFStringTokenizerGetCurrentSubTokens},
    {"CFStringTokenizerTokenType", lua_CFStringTokenizerTokenType},
    {"CFStringTokenizerGetCurrentTokenRange", lua_CFStringTokenizerGetCurrentTokenRange},
    {"CFStringTokenizerCreate", lua_CFStringTokenizerCreate},
    {"CFStringTokenizerGetCurrentTokenRange", lua_CFStringTokenizerGetCurrentTokenRange},
    {"CFStringTokenizerCopyCurrentTokenAttribute", lua_CFStringTokenizerCopyCurrentTokenAttribute},
    {"CFStringTokenizerCreate", lua_CFStringTokenizerCreate},
    {"CFStringTokenizerAttributeLatinTranscription", lua_CFStringTokenizerAttributeLatinTranscription},
    {"CFStringTokenizerAttributeLanguage", lua_CFStringTokenizerAttributeLanguage},
    {"CFStringTokenizerCopyCurrentTokenAttribute", lua_CFStringTokenizerCopyCurrentTokenAttribute},
    {"CFStringTokenizerGetCurrentSubTokens", lua_CFStringTokenizerGetCurrentSubTokens},
    {"CFStringTokenizerCreate", lua_CFStringTokenizerCreate},
    {"CFStringTokenizerCreate", lua_CFStringTokenizerCreate},
    {"CFStringTokenizerTokenNone", lua_CFStringTokenizerTokenNone},
    {"CFStringTokenizerTokenNormal", lua_CFStringTokenizerTokenNormal},
    {"CFStringTokenizerTokenHasSubTokensMask", lua_CFStringTokenizerTokenHasSubTokensMask},
    {"CFStringTokenizerTokenHasDerivedSubTokensMask", lua_CFStringTokenizerTokenHasDerivedSubTokensMask},
    {"CFStringTokenizerTokenHasSubTokensMask", lua_CFStringTokenizerTokenHasSubTokensMask},
    {"CFStringTokenizerGetCurrentSubTokens", lua_CFStringTokenizerGetCurrentSubTokens},
    {NULL, NULL},
};

int LuaOpenCFStringTokenizer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFStringTokenizerAPIs);
    return 0;
}
