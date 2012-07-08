//
//  LuaCTRun.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTRun.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunStatus(lua_State *L)
{
    CTRunStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetStatus(lua_State *L)
{
    CTRunGetStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunStatusNoStatus(lua_State *L)
{
    CTRunStatusNoStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunStatusRightToLeft(lua_State *L)
{
    CTRunStatusRightToLeft(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunStatusNonMonotonic(lua_State *L)
{
    CTRunStatusNonMonotonic(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunStatusHasNonIdentityMatrix(lua_State *L)
{
    CTRunStatusHasNonIdentityMatrix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunStatusNoStatus(lua_State *L)
{
    CTRunStatusNoStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunStatusRightToLeft(lua_State *L)
{
    CTRunStatusRightToLeft(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunStatusNonMonotonic(lua_State *L)
{
    CTRunStatusNonMonotonic(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunStatusHasNonIdentityMatrix(lua_State *L)
{
    CTRunStatusHasNonIdentityMatrix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunStatus(lua_State *L)
{
    CTRunStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetTypeID(lua_State *L)
{
    CTRunGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetTypeID(lua_State *L)
{
    CTRunGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetGlyphCount(lua_State *L)
{
    CTRunGetGlyphCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetGlyphCount(lua_State *L)
{
    CTRunGetGlyphCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetAttributes(lua_State *L)
{
    CTRunGetAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetAttributes(lua_State *L)
{
    CTRunGetAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetStatus(lua_State *L)
{
    CTRunGetStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunStatus(lua_State *L)
{
    CTRunStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetGlyphsPtr(lua_State *L)
{
    CTRunGetGlyphsPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetGlyphCount(lua_State *L)
{
    CTRunGetGlyphCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetGlyphs(lua_State *L)
{
    CTRunGetGlyphs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetGlyphsPtr(lua_State *L)
{
    CTRunGetGlyphsPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetGlyphs(lua_State *L)
{
    CTRunGetGlyphs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetGlyphs(lua_State *L)
{
    CTRunGetGlyphs(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetPositionsPtr(lua_State *L)
{
    CTRunGetPositionsPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetGlyphCount(lua_State *L)
{
    CTRunGetGlyphCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetPositions(lua_State *L)
{
    CTRunGetPositions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetPositionsPtr(lua_State *L)
{
    CTRunGetPositionsPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetPositions(lua_State *L)
{
    CTRunGetPositions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetPositions(lua_State *L)
{
    CTRunGetPositions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetAdvancesPtr(lua_State *L)
{
    CTRunGetAdvancesPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetGlyphCount(lua_State *L)
{
    CTRunGetGlyphCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetAdvances(lua_State *L)
{
    CTRunGetAdvances(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetAdvancesPtr(lua_State *L)
{
    CTRunGetAdvancesPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetAdvances(lua_State *L)
{
    CTRunGetAdvances(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetAdvances(lua_State *L)
{
    CTRunGetAdvances(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetStringIndicesPtr(lua_State *L)
{
    CTRunGetStringIndicesPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetGlyphCount(lua_State *L)
{
    CTRunGetGlyphCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetStringIndices(lua_State *L)
{
    CTRunGetStringIndices(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetStringIndicesPtr(lua_State *L)
{
    CTRunGetStringIndicesPtr(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetStringIndices(lua_State *L)
{
    CTRunGetStringIndices(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetStringIndices(lua_State *L)
{
    CTRunGetStringIndices(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetStringRange(lua_State *L)
{
    CTRunGetStringRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetStringRange(lua_State *L)
{
    CTRunGetStringRange(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetTypographicBounds(lua_State *L)
{
    CTRunGetTypographicBounds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetTypographicBounds(lua_State *L)
{
    CTRunGetTypographicBounds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetImageBounds(lua_State *L)
{
    CTRunGetImageBounds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDraw(lua_State *L)
{
    CTRunDraw(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetTypographicBounds(lua_State *L)
{
    CTRunGetTypographicBounds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetImageBounds(lua_State *L)
{
    CTRunGetImageBounds(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetTextMatrix(lua_State *L)
{
    CTRunGetTextMatrix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunGetTextMatrix(lua_State *L)
{
    CTRunGetTextMatrix(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDraw(lua_State *L)
{
    CTRunDraw(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunDraw(lua_State *L)
{
    CTRunDraw(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTRunRef(lua_State *L)
{
    CTRunRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTRunAPIs[] = {
    {"CTRunRef", lua_CTRunRef},
    {"CTRunStatus", lua_CTRunStatus},
    {"CTRunGetStatus", lua_CTRunGetStatus},
    {"CTRunStatusNoStatus", lua_CTRunStatusNoStatus},
    {"CTRunStatusRightToLeft", lua_CTRunStatusRightToLeft},
    {"CTRunStatusNonMonotonic", lua_CTRunStatusNonMonotonic},
    {"CTRunStatusHasNonIdentityMatrix", lua_CTRunStatusHasNonIdentityMatrix},
    {"CTRunStatusNoStatus", lua_CTRunStatusNoStatus},
    {"CTRunStatusRightToLeft", lua_CTRunStatusRightToLeft},
    {"CTRunStatusNonMonotonic", lua_CTRunStatusNonMonotonic},
    {"CTRunStatusHasNonIdentityMatrix", lua_CTRunStatusHasNonIdentityMatrix},
    {"CTRunStatus", lua_CTRunStatus},
    {"CTRunGetTypeID", lua_CTRunGetTypeID},
    {"CTRunGetTypeID", lua_CTRunGetTypeID},
    {"CTRunGetGlyphCount", lua_CTRunGetGlyphCount},
    {"CTRunGetGlyphCount", lua_CTRunGetGlyphCount},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetAttributes", lua_CTRunGetAttributes},
    {"CTRunGetAttributes", lua_CTRunGetAttributes},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetStatus", lua_CTRunGetStatus},
    {"CTRunStatus", lua_CTRunStatus},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetGlyphsPtr", lua_CTRunGetGlyphsPtr},
    {"CTRunGetGlyphCount", lua_CTRunGetGlyphCount},
    {"CTRunGetGlyphs", lua_CTRunGetGlyphs},
    {"CTRunGetGlyphsPtr", lua_CTRunGetGlyphsPtr},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetGlyphs", lua_CTRunGetGlyphs},
    {"CTRunGetGlyphs", lua_CTRunGetGlyphs},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetPositionsPtr", lua_CTRunGetPositionsPtr},
    {"CTRunGetGlyphCount", lua_CTRunGetGlyphCount},
    {"CTRunGetPositions", lua_CTRunGetPositions},
    {"CTRunGetPositionsPtr", lua_CTRunGetPositionsPtr},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetPositions", lua_CTRunGetPositions},
    {"CTRunGetPositions", lua_CTRunGetPositions},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetAdvancesPtr", lua_CTRunGetAdvancesPtr},
    {"CTRunGetGlyphCount", lua_CTRunGetGlyphCount},
    {"CTRunGetAdvances", lua_CTRunGetAdvances},
    {"CTRunGetAdvancesPtr", lua_CTRunGetAdvancesPtr},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetAdvances", lua_CTRunGetAdvances},
    {"CTRunGetAdvances", lua_CTRunGetAdvances},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetStringIndicesPtr", lua_CTRunGetStringIndicesPtr},
    {"CTRunGetGlyphCount", lua_CTRunGetGlyphCount},
    {"CTRunGetStringIndices", lua_CTRunGetStringIndices},
    {"CTRunGetStringIndicesPtr", lua_CTRunGetStringIndicesPtr},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetStringIndices", lua_CTRunGetStringIndices},
    {"CTRunGetStringIndices", lua_CTRunGetStringIndices},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetStringRange", lua_CTRunGetStringRange},
    {"CTRunGetStringRange", lua_CTRunGetStringRange},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetTypographicBounds", lua_CTRunGetTypographicBounds},
    {"CTRunGetTypographicBounds", lua_CTRunGetTypographicBounds},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetImageBounds", lua_CTRunGetImageBounds},
    {"CTRunDraw", lua_CTRunDraw},
    {"CTRunGetTypographicBounds", lua_CTRunGetTypographicBounds},
    {"CTRunGetImageBounds", lua_CTRunGetImageBounds},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunGetTextMatrix", lua_CTRunGetTextMatrix},
    {"CTRunGetTextMatrix", lua_CTRunGetTextMatrix},
    {"CTRunRef", lua_CTRunRef},
    {"CTRunDraw", lua_CTRunDraw},
    {"CTRunDraw", lua_CTRunDraw},
    {"CTRunRef", lua_CTRunRef},
    {NULL, NULL},
};

int LuaOpenCTRun(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTRunAPIs);
    return 0;
}
