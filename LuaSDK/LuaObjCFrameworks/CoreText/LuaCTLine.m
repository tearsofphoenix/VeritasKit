//
//  LuaCTLine.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTLine.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineTruncationType(lua_State *L)
{
    CTLineTruncationType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineCreateTruncatedLine(lua_State *L)
{
    CTLineCreateTruncatedLine(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineTruncationStart(lua_State *L)
{
    CTLineTruncationStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineTruncationEnd(lua_State *L)
{
    CTLineTruncationEnd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineTruncationMiddle(lua_State *L)
{
    CTLineTruncationMiddle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineTruncationStart(lua_State *L)
{
    CTLineTruncationStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineTruncationEnd(lua_State *L)
{
    CTLineTruncationEnd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineTruncationMiddle(lua_State *L)
{
    CTLineTruncationMiddle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineTruncationType(lua_State *L)
{
    CTLineTruncationType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetTypeID(lua_State *L)
{
    CTLineGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetTypeID(lua_State *L)
{
    CTLineGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineCreateWithAttributedString(lua_State *L)
{
    CTLineCreateWithAttributedString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineCreateTruncatedLine(lua_State *L)
{
    CTLineCreateTruncatedLine(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineTruncationType(lua_State *L)
{
    CTLineTruncationType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineCreateJustifiedLine(lua_State *L)
{
    CTLineCreateJustifiedLine(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetGlyphCount(lua_State *L)
{
    CTLineGetGlyphCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetGlyphCount(lua_State *L)
{
    CTLineGetGlyphCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetGlyphRuns(lua_State *L)
{
    CTLineGetGlyphRuns(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetGlyphRuns(lua_State *L)
{
    CTLineGetGlyphRuns(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetStringRange(lua_State *L)
{
    CTLineGetStringRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetStringRange(lua_State *L)
{
    CTLineGetStringRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetPenOffsetForFlush(lua_State *L)
{
    CTLineGetPenOffsetForFlush(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetPenOffsetForFlush(lua_State *L)
{
    CTLineGetPenOffsetForFlush(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineDraw(lua_State *L)
{
    CTLineDraw(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineDraw(lua_State *L)
{
    CTLineDraw(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetTypographicBounds(lua_State *L)
{
    CTLineGetTypographicBounds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetTypographicBounds(lua_State *L)
{
    CTLineGetTypographicBounds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetTrailingWhitespaceWidth(lua_State *L)
{
    CTLineGetTrailingWhitespaceWidth(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetTrailingWhitespaceWidth(lua_State *L)
{
    CTLineGetTrailingWhitespaceWidth(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetImageBounds(lua_State *L)
{
    CTLineGetImageBounds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineDraw(lua_State *L)
{
    CTLineDraw(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetTypographicBounds(lua_State *L)
{
    CTLineGetTypographicBounds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetPenOffsetForFlush(lua_State *L)
{
    CTLineGetPenOffsetForFlush(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetImageBounds(lua_State *L)
{
    CTLineGetImageBounds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetStringIndexForPosition(lua_State *L)
{
    CTLineGetStringIndexForPosition(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetStringIndexForPosition(lua_State *L)
{
    CTLineGetStringIndexForPosition(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetOffsetForStringIndex(lua_State *L)
{
    CTLineGetOffsetForStringIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetStringIndexForPosition(lua_State *L)
{
    CTLineGetStringIndexForPosition(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineGetOffsetForStringIndex(lua_State *L)
{
    CTLineGetOffsetForStringIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTLineRef(lua_State *L)
{
    CTLineRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTLineAPIs[] = {
    {"CTLineRef", lua_CTLineRef},
    {"CTLineTruncationType", lua_CTLineTruncationType},
    {"CTLineCreateTruncatedLine", lua_CTLineCreateTruncatedLine},
    {"CTLineTruncationStart", lua_CTLineTruncationStart},
    {"CTLineTruncationEnd", lua_CTLineTruncationEnd},
    {"CTLineTruncationMiddle", lua_CTLineTruncationMiddle},
    {"CTLineTruncationStart", lua_CTLineTruncationStart},
    {"CTLineTruncationEnd", lua_CTLineTruncationEnd},
    {"CTLineTruncationMiddle", lua_CTLineTruncationMiddle},
    {"CTLineTruncationType", lua_CTLineTruncationType},
    {"CTLineGetTypeID", lua_CTLineGetTypeID},
    {"CTLineGetTypeID", lua_CTLineGetTypeID},
    {"CTLineCreateWithAttributedString", lua_CTLineCreateWithAttributedString},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineCreateTruncatedLine", lua_CTLineCreateTruncatedLine},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineTruncationType", lua_CTLineTruncationType},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineCreateJustifiedLine", lua_CTLineCreateJustifiedLine},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineGetGlyphCount", lua_CTLineGetGlyphCount},
    {"CTLineGetGlyphCount", lua_CTLineGetGlyphCount},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineGetGlyphRuns", lua_CTLineGetGlyphRuns},
    {"CTLineGetGlyphRuns", lua_CTLineGetGlyphRuns},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineGetStringRange", lua_CTLineGetStringRange},
    {"CTLineGetStringRange", lua_CTLineGetStringRange},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineGetPenOffsetForFlush", lua_CTLineGetPenOffsetForFlush},
    {"CTLineGetPenOffsetForFlush", lua_CTLineGetPenOffsetForFlush},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineDraw", lua_CTLineDraw},
    {"CTLineDraw", lua_CTLineDraw},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineGetTypographicBounds", lua_CTLineGetTypographicBounds},
    {"CTLineGetTypographicBounds", lua_CTLineGetTypographicBounds},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineGetTrailingWhitespaceWidth", lua_CTLineGetTrailingWhitespaceWidth},
    {"CTLineGetTrailingWhitespaceWidth", lua_CTLineGetTrailingWhitespaceWidth},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineGetImageBounds", lua_CTLineGetImageBounds},
    {"CTLineDraw", lua_CTLineDraw},
    {"CTLineGetTypographicBounds", lua_CTLineGetTypographicBounds},
    {"CTLineGetPenOffsetForFlush", lua_CTLineGetPenOffsetForFlush},
    {"CTLineGetImageBounds", lua_CTLineGetImageBounds},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineGetStringIndexForPosition", lua_CTLineGetStringIndexForPosition},
    {"CTLineGetStringIndexForPosition", lua_CTLineGetStringIndexForPosition},
    {"CTLineRef", lua_CTLineRef},
    {"CTLineGetOffsetForStringIndex", lua_CTLineGetOffsetForStringIndex},
    {"CTLineGetStringIndexForPosition", lua_CTLineGetStringIndexForPosition},
    {"CTLineGetOffsetForStringIndex", lua_CTLineGetOffsetForStringIndex},
    {"CTLineRef", lua_CTLineRef},
    {NULL, NULL},
};

int LuaOpenCTLine(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTLineAPIs);
    return 0;
}
