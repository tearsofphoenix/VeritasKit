//
//  LuaCTTypesetter.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTTypesetter.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTTypesetterRef(lua_State *L)
{
    CTTypesetterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterGetTypeID(lua_State *L)
{
    CTTypesetterGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterGetTypeID(lua_State *L)
{
    CTTypesetterGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterOptionDisableBidiProcessing(lua_State *L)
{
    CTTypesetterOptionDisableBidiProcessing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterOptionDisableBidiProcessing(lua_State *L)
{
    CTTypesetterOptionDisableBidiProcessing(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterOptionForcedEmbeddingLevel(lua_State *L)
{
    CTTypesetterOptionForcedEmbeddingLevel(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterOptionForcedEmbeddingLevel(lua_State *L)
{
    CTTypesetterOptionForcedEmbeddingLevel(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterCreateWithAttributedString(lua_State *L)
{
    CTTypesetterCreateWithAttributedString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterRef(lua_State *L)
{
    CTTypesetterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterCreateWithAttributedStringAndOptions(lua_State *L)
{
    CTTypesetterCreateWithAttributedStringAndOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterRef(lua_State *L)
{
    CTTypesetterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterCreateLineWithOffset(lua_State *L)
{
    CTTypesetterCreateLineWithOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterCreateLineWithOffset(lua_State *L)
{
    CTTypesetterCreateLineWithOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterRef(lua_State *L)
{
    CTTypesetterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterCreateLine(lua_State *L)
{
    CTTypesetterCreateLine(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterCreateLineWithOffset(lua_State *L)
{
    CTTypesetterCreateLineWithOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterCreateLine(lua_State *L)
{
    CTTypesetterCreateLine(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterRef(lua_State *L)
{
    CTTypesetterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterSuggestLineBreakWithOffset(lua_State *L)
{
    CTTypesetterSuggestLineBreakWithOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterCreateLine(lua_State *L)
{
    CTTypesetterCreateLine(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterSuggestLineBreakWithOffset(lua_State *L)
{
    CTTypesetterSuggestLineBreakWithOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterRef(lua_State *L)
{
    CTTypesetterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterSuggestLineBreak(lua_State *L)
{
    CTTypesetterSuggestLineBreak(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterSuggestLineBreakWithOffset(lua_State *L)
{
    CTTypesetterSuggestLineBreakWithOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterSuggestLineBreak(lua_State *L)
{
    CTTypesetterSuggestLineBreak(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterRef(lua_State *L)
{
    CTTypesetterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterSuggestClusterBreakWithOffset(lua_State *L)
{
    CTTypesetterSuggestClusterBreakWithOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterCreateLine(lua_State *L)
{
    CTTypesetterCreateLine(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterSuggestClusterBreakWithOffset(lua_State *L)
{
    CTTypesetterSuggestClusterBreakWithOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterRef(lua_State *L)
{
    CTTypesetterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterSuggestClusterBreak(lua_State *L)
{
    CTTypesetterSuggestClusterBreak(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterSuggestClusterBreakWithOffset(lua_State *L)
{
    CTTypesetterSuggestClusterBreakWithOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterSuggestClusterBreak(lua_State *L)
{
    CTTypesetterSuggestClusterBreak(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTTypesetterRef(lua_State *L)
{
    CTTypesetterRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTTypesetterAPIs[] = {
    {"CTTypesetterRef", lua_CTTypesetterRef},
    {"CTTypesetterGetTypeID", lua_CTTypesetterGetTypeID},
    {"CTTypesetterGetTypeID", lua_CTTypesetterGetTypeID},
    {"CTTypesetterOptionDisableBidiProcessing", lua_CTTypesetterOptionDisableBidiProcessing},
    {"CTTypesetterOptionDisableBidiProcessing", lua_CTTypesetterOptionDisableBidiProcessing},
    {"CTTypesetterOptionForcedEmbeddingLevel", lua_CTTypesetterOptionForcedEmbeddingLevel},
    {"CTTypesetterOptionForcedEmbeddingLevel", lua_CTTypesetterOptionForcedEmbeddingLevel},
    {"CTTypesetterCreateWithAttributedString", lua_CTTypesetterCreateWithAttributedString},
    {"CTTypesetterRef", lua_CTTypesetterRef},
    {"CTTypesetterCreateWithAttributedStringAndOptions", lua_CTTypesetterCreateWithAttributedStringAndOptions},
    {"CTTypesetterRef", lua_CTTypesetterRef},
    {"CTTypesetterCreateLineWithOffset", lua_CTTypesetterCreateLineWithOffset},
    {"CTTypesetterCreateLineWithOffset", lua_CTTypesetterCreateLineWithOffset},
    {"CTTypesetterRef", lua_CTTypesetterRef},
    {"CTTypesetterCreateLine", lua_CTTypesetterCreateLine},
    {"CTTypesetterCreateLineWithOffset", lua_CTTypesetterCreateLineWithOffset},
    {"CTTypesetterCreateLine", lua_CTTypesetterCreateLine},
    {"CTTypesetterRef", lua_CTTypesetterRef},
    {"CTTypesetterSuggestLineBreakWithOffset", lua_CTTypesetterSuggestLineBreakWithOffset},
    {"CTTypesetterCreateLine", lua_CTTypesetterCreateLine},
    {"CTTypesetterSuggestLineBreakWithOffset", lua_CTTypesetterSuggestLineBreakWithOffset},
    {"CTTypesetterRef", lua_CTTypesetterRef},
    {"CTTypesetterSuggestLineBreak", lua_CTTypesetterSuggestLineBreak},
    {"CTTypesetterSuggestLineBreakWithOffset", lua_CTTypesetterSuggestLineBreakWithOffset},
    {"CTTypesetterSuggestLineBreak", lua_CTTypesetterSuggestLineBreak},
    {"CTTypesetterRef", lua_CTTypesetterRef},
    {"CTTypesetterSuggestClusterBreakWithOffset", lua_CTTypesetterSuggestClusterBreakWithOffset},
    {"CTTypesetterCreateLine", lua_CTTypesetterCreateLine},
    {"CTTypesetterSuggestClusterBreakWithOffset", lua_CTTypesetterSuggestClusterBreakWithOffset},
    {"CTTypesetterRef", lua_CTTypesetterRef},
    {"CTTypesetterSuggestClusterBreak", lua_CTTypesetterSuggestClusterBreak},
    {"CTTypesetterSuggestClusterBreakWithOffset", lua_CTTypesetterSuggestClusterBreakWithOffset},
    {"CTTypesetterSuggestClusterBreak", lua_CTTypesetterSuggestClusterBreak},
    {"CTTypesetterRef", lua_CTTypesetterRef},
    {NULL, NULL},
};

int LuaOpenCTTypesetter(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTTypesetterAPIs);
    return 0;
}
