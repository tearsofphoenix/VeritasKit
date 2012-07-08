//
//  LuaCTFrame.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTFrame.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTFrameRef(lua_State *L)
{
    CTFrameRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetTypeID(lua_State *L)
{
    CTFrameGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetTypeID(lua_State *L)
{
    CTFrameGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameProgression(lua_State *L)
{
    CTFrameProgression(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameProgressionTopToBottom(lua_State *L)
{
    CTFrameProgressionTopToBottom(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameProgressionRightToLeft(lua_State *L)
{
    CTFrameProgressionRightToLeft(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameProgressionTopToBottom(lua_State *L)
{
    CTFrameProgressionTopToBottom(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameProgressionRightToLeft(lua_State *L)
{
    CTFrameProgressionRightToLeft(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameProgression(lua_State *L)
{
    CTFrameProgression(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameProgressionAttributeName(lua_State *L)
{
    CTFrameProgressionAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameProgression(lua_State *L)
{
    CTFrameProgression(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameProgressionTopToBottom(lua_State *L)
{
    CTFrameProgressionTopToBottom(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterCreateFrame(lua_State *L)
{
    CTFramesetterCreateFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameProgressionAttributeName(lua_State *L)
{
    CTFrameProgressionAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathFillRule(lua_State *L)
{
    CTFramePathFillRule(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathFillEvenOdd(lua_State *L)
{
    CTFramePathFillEvenOdd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathFillWindingNumber(lua_State *L)
{
    CTFramePathFillWindingNumber(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathFillEvenOdd(lua_State *L)
{
    CTFramePathFillEvenOdd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathFillWindingNumber(lua_State *L)
{
    CTFramePathFillWindingNumber(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathFillRule(lua_State *L)
{
    CTFramePathFillRule(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathFillRuleAttributeName(lua_State *L)
{
    CTFramePathFillRuleAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameClippingPathsAttributeName(lua_State *L)
{
    CTFrameClippingPathsAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathFillEvenOdd(lua_State *L)
{
    CTFramePathFillEvenOdd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathFillEvenOdd(lua_State *L)
{
    CTFramePathFillEvenOdd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterCreateFrame(lua_State *L)
{
    CTFramesetterCreateFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathFillRuleAttributeName(lua_State *L)
{
    CTFramePathFillRuleAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathWidthAttributeName(lua_State *L)
{
    CTFramePathWidthAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameClippingPathsAttributeName(lua_State *L)
{
    CTFrameClippingPathsAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterCreateFrame(lua_State *L)
{
    CTFramesetterCreateFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathWidthAttributeName(lua_State *L)
{
    CTFramePathWidthAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameClippingPathsAttributeName(lua_State *L)
{
    CTFrameClippingPathsAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathClippingPathAttributeName(lua_State *L)
{
    CTFramePathClippingPathAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathFillRuleAttributeName(lua_State *L)
{
    CTFramePathFillRuleAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterCreateFrame(lua_State *L)
{
    CTFramesetterCreateFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameClippingPathsAttributeName(lua_State *L)
{
    CTFrameClippingPathsAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathClippingPathAttributeName(lua_State *L)
{
    CTFramePathClippingPathAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameClippingPathsAttributeName(lua_State *L)
{
    CTFrameClippingPathsAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameClippingPathsAttributeName(lua_State *L)
{
    CTFrameClippingPathsAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramePathClippingPathAttributeName(lua_State *L)
{
    CTFramePathClippingPathAttributeName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetStringRange(lua_State *L)
{
    CTFrameGetStringRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetStringRange(lua_State *L)
{
    CTFrameGetStringRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameRef(lua_State *L)
{
    CTFrameRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetVisibleStringRange(lua_State *L)
{
    CTFrameGetVisibleStringRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetVisibleStringRange(lua_State *L)
{
    CTFrameGetVisibleStringRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameRef(lua_State *L)
{
    CTFrameRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetPath(lua_State *L)
{
    CTFrameGetPath(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetPath(lua_State *L)
{
    CTFrameGetPath(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameRef(lua_State *L)
{
    CTFrameRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetFrameAttributes(lua_State *L)
{
    CTFrameGetFrameAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetFrameAttributes(lua_State *L)
{
    CTFrameGetFrameAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameRef(lua_State *L)
{
    CTFrameRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetLines(lua_State *L)
{
    CTFrameGetLines(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetLines(lua_State *L)
{
    CTFrameGetLines(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameRef(lua_State *L)
{
    CTFrameRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetLineOrigins(lua_State *L)
{
    CTFrameGetLineOrigins(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetLines(lua_State *L)
{
    CTFrameGetLines(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameGetLineOrigins(lua_State *L)
{
    CTFrameGetLineOrigins(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameRef(lua_State *L)
{
    CTFrameRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameDraw(lua_State *L)
{
    CTFrameDraw(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameDraw(lua_State *L)
{
    CTFrameDraw(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFrameRef(lua_State *L)
{
    CTFrameRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTFrameAPIs[] = {
    {"CTFrameRef", lua_CTFrameRef},
    {"CTFrameGetTypeID", lua_CTFrameGetTypeID},
    {"CTFrameGetTypeID", lua_CTFrameGetTypeID},
    {"CTFrameProgression", lua_CTFrameProgression},
    {"CTFrameProgressionTopToBottom", lua_CTFrameProgressionTopToBottom},
    {"CTFrameProgressionRightToLeft", lua_CTFrameProgressionRightToLeft},
    {"CTFrameProgressionTopToBottom", lua_CTFrameProgressionTopToBottom},
    {"CTFrameProgressionRightToLeft", lua_CTFrameProgressionRightToLeft},
    {"CTFrameProgression", lua_CTFrameProgression},
    {"CTFrameProgressionAttributeName", lua_CTFrameProgressionAttributeName},
    {"CTFrameProgression", lua_CTFrameProgression},
    {"CTFrameProgressionTopToBottom", lua_CTFrameProgressionTopToBottom},
    {"CTFramesetterCreateFrame", lua_CTFramesetterCreateFrame},
    {"CTFrameProgressionAttributeName", lua_CTFrameProgressionAttributeName},
    {"CTFramePathFillRule", lua_CTFramePathFillRule},
    {"CTFramePathFillEvenOdd", lua_CTFramePathFillEvenOdd},
    {"CTFramePathFillWindingNumber", lua_CTFramePathFillWindingNumber},
    {"CTFramePathFillEvenOdd", lua_CTFramePathFillEvenOdd},
    {"CTFramePathFillWindingNumber", lua_CTFramePathFillWindingNumber},
    {"CTFramePathFillRule", lua_CTFramePathFillRule},
    {"CTFramePathFillRuleAttributeName", lua_CTFramePathFillRuleAttributeName},
    {"CTFrameClippingPathsAttributeName", lua_CTFrameClippingPathsAttributeName},
    {"CTFramePathFillEvenOdd", lua_CTFramePathFillEvenOdd},
    {"CTFramePathFillEvenOdd", lua_CTFramePathFillEvenOdd},
    {"CTFramesetterCreateFrame", lua_CTFramesetterCreateFrame},
    {"CTFramePathFillRuleAttributeName", lua_CTFramePathFillRuleAttributeName},
    {"CTFramePathWidthAttributeName", lua_CTFramePathWidthAttributeName},
    {"CTFrameClippingPathsAttributeName", lua_CTFrameClippingPathsAttributeName},
    {"CTFramesetterCreateFrame", lua_CTFramesetterCreateFrame},
    {"CTFramePathWidthAttributeName", lua_CTFramePathWidthAttributeName},
    {"CTFrameClippingPathsAttributeName", lua_CTFrameClippingPathsAttributeName},
    {"CTFramePathClippingPathAttributeName", lua_CTFramePathClippingPathAttributeName},
    {"CTFramePathFillRuleAttributeName", lua_CTFramePathFillRuleAttributeName},
    {"CTFramesetterCreateFrame", lua_CTFramesetterCreateFrame},
    {"CTFrameClippingPathsAttributeName", lua_CTFrameClippingPathsAttributeName},
    {"CTFramePathClippingPathAttributeName", lua_CTFramePathClippingPathAttributeName},
    {"CTFrameClippingPathsAttributeName", lua_CTFrameClippingPathsAttributeName},
    {"CTFrameClippingPathsAttributeName", lua_CTFrameClippingPathsAttributeName},
    {"CTFramePathClippingPathAttributeName", lua_CTFramePathClippingPathAttributeName},
    {"CTFrameGetStringRange", lua_CTFrameGetStringRange},
    {"CTFrameGetStringRange", lua_CTFrameGetStringRange},
    {"CTFrameRef", lua_CTFrameRef},
    {"CTFrameGetVisibleStringRange", lua_CTFrameGetVisibleStringRange},
    {"CTFrameGetVisibleStringRange", lua_CTFrameGetVisibleStringRange},
    {"CTFrameRef", lua_CTFrameRef},
    {"CTFrameGetPath", lua_CTFrameGetPath},
    {"CTFrameGetPath", lua_CTFrameGetPath},
    {"CTFrameRef", lua_CTFrameRef},
    {"CTFrameGetFrameAttributes", lua_CTFrameGetFrameAttributes},
    {"CTFrameGetFrameAttributes", lua_CTFrameGetFrameAttributes},
    {"CTFrameRef", lua_CTFrameRef},
    {"CTFrameGetLines", lua_CTFrameGetLines},
    {"CTFrameGetLines", lua_CTFrameGetLines},
    {"CTFrameRef", lua_CTFrameRef},
    {"CTFrameGetLineOrigins", lua_CTFrameGetLineOrigins},
    {"CTFrameGetLines", lua_CTFrameGetLines},
    {"CTFrameGetLineOrigins", lua_CTFrameGetLineOrigins},
    {"CTFrameRef", lua_CTFrameRef},
    {"CTFrameDraw", lua_CTFrameDraw},
    {"CTFrameDraw", lua_CTFrameDraw},
    {"CTFrameRef", lua_CTFrameRef},
    {NULL, NULL},
};

int LuaOpenCTFrame(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTFrameAPIs);
    return 0;
}
