//
//  LuaCGFont.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGFont.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "LuaCGGeometry.h"
#import "luasdk_utilities.h"

static int lua_CGFontGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGFontGetTypeID());
    return 1;
}

static int lua_CGFontCreateWithDataProvider(lua_State *L)
{
    lua_pushlightuserdata(L, CGFontCreateWithDataProvider(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontCreateWithFontName(lua_State *L)
{
    lua_pushlightuserdata(L, CGFontCreateWithFontName(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontCreateCopyWithVariations(lua_State *L)
{
    lua_pushlightuserdata(L, CGFontCreateCopyWithVariations(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGFontRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGFontRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontRelease(lua_State *L)
{
    CGFontRelease(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGFontGetNumberOfGlyphs(lua_State *L)
{
    lua_pushinteger(L, CGFontGetNumberOfGlyphs(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontGetUnitsPerEm(lua_State *L)
{
    lua_pushinteger(L, CGFontGetUnitsPerEm(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontCopyPostScriptName(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGFontCopyPostScriptName(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontCopyFullName(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGFontCopyFullName(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontGetAscent(lua_State *L)
{
    lua_pushinteger(L, CGFontGetAscent(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontGetDescent(lua_State *L)
{
    lua_pushinteger(L, CGFontGetDescent(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontGetLeading(lua_State *L)
{
    lua_pushinteger(L, CGFontGetLeading(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontGetCapHeight(lua_State *L)
{
    lua_pushinteger(L, CGFontGetCapHeight(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontGetXHeight(lua_State *L)
{
    lua_pushinteger(L, CGFontGetXHeight(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontGetFontBBox(lua_State *L)
{
    lua_pushCGRect(L, CGFontGetFontBBox(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontGetItalicAngle(lua_State *L)
{
    lua_pushnumber(L, CGFontGetItalicAngle(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontGetStemV(lua_State *L)
{
    lua_pushnumber(L, CGFontGetStemV(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontCopyVariationAxes(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGFontCopyVariationAxes(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontCopyVariations(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGFontCopyVariations(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontGetGlyphAdvances(lua_State *L)
{
    CGGlyph *glyphs = NULL;
    size_t count = luasdk_get_arrayui(L, 2, (unsigned int**)&glyphs);
    int * advances = NULL;
    luasdk_get_arrayi(L, 3, &advances);
    lua_pushboolean(L, CGFontGetGlyphAdvances(lua_touserdata(L, 1), glyphs, count, advances));
    return 1;
}

static int lua_CGFontGetGlyphBBoxes(lua_State *L)
{
    //TODO
//    lua_pushlightuserdata(L, CGFontGetGlyphBBoxes(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontGetGlyphWithGlyphName(lua_State *L)
{
    lua_pushinteger(L, CGFontGetGlyphWithGlyphName(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGFontCopyGlyphNameForGlyph(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGFontCopyGlyphNameForGlyph(lua_touserdata(L, 1), lua_tointeger(L, 2)));
    return 1;
}

static int lua_CGFontCanCreatePostScriptSubset(lua_State *L)
{
    lua_pushboolean(L, CGFontCanCreatePostScriptSubset(lua_touserdata(L, 1), lua_tointeger(L, 2)));
    return 1;
}

static int lua_CGFontCreatePostScriptSubset(lua_State *L)
{
    CFStringRef subsetName = lua_touserdata(L, 2);
    CGFontPostScriptFormat format = lua_tointeger(L, 3);
    CGGlyph *glyphs = NULL;
    size_t count = luasdk_get_arrayui(L, 4, (unsigned int**)&glyphs);
    CGGlyph *encoding = NULL;
    luasdk_get_arrayui(L, 5, (unsigned int**)&encoding);

    lua_pushlightuserdata(L, (void*)CGFontCreatePostScriptSubset(lua_touserdata(L, 1), subsetName, format, glyphs, count, encoding));
    return 1;
}

static int lua_CGFontCreatePostScriptEncoding(lua_State *L)
{
    CGGlyph *glyphs = NULL;
    luasdk_get_arrayui(L, 2, (unsigned int**)&glyphs);

    lua_pushlightuserdata(L, (void*)CGFontCreatePostScriptEncoding(lua_touserdata(L, 1), glyphs));
    return 1;
}

static int lua_CGFontCopyTableTags(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGFontCopyTableTags(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGFontCopyTableForTag(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGFontCopyTableForTag(lua_touserdata(L, 1), lua_tointeger(L, 2)));
    return 1;
}

static const luaL_Reg __LuaCGFontAPIs[] = 
{
    {"CGFontGetTypeID", lua_CGFontGetTypeID},
    {"CGFontCreateWithDataProvider", lua_CGFontCreateWithDataProvider},
    {"CGFontCreateWithFontName", lua_CGFontCreateWithFontName},
    {"CGFontCreateCopyWithVariations", lua_CGFontCreateCopyWithVariations},
    {"CGFontRetain", lua_CGFontRetain},
    {"CGFontRelease", lua_CGFontRelease},
    {"CGFontGetNumberOfGlyphs", lua_CGFontGetNumberOfGlyphs},
    {"CGFontGetUnitsPerEm", lua_CGFontGetUnitsPerEm},
    {"CGFontCopyPostScriptName", lua_CGFontCopyPostScriptName},
    {"CGFontCopyFullName", lua_CGFontCopyFullName},
    {"CGFontGetAscent", lua_CGFontGetAscent},
    {"CGFontGetDescent", lua_CGFontGetDescent},
    {"CGFontGetLeading", lua_CGFontGetLeading},
    {"CGFontGetCapHeight", lua_CGFontGetCapHeight},
    {"CGFontGetXHeight", lua_CGFontGetXHeight},
    {"CGFontGetFontBBox", lua_CGFontGetFontBBox},
    {"CGFontGetItalicAngle", lua_CGFontGetItalicAngle},
    {"CGFontGetStemV", lua_CGFontGetStemV},
    {"CGFontCopyVariationAxes", lua_CGFontCopyVariationAxes},
    {"CGFontCopyVariations", lua_CGFontCopyVariations},
    {"CGFontGetGlyphAdvances", lua_CGFontGetGlyphAdvances},
    {"CGFontGetGlyphBBoxes", lua_CGFontGetGlyphBBoxes},
    {"CGFontGetGlyphWithGlyphName", lua_CGFontGetGlyphWithGlyphName},
    {"CGFontCopyGlyphNameForGlyph", lua_CGFontCopyGlyphNameForGlyph},
    {"CGFontCanCreatePostScriptSubset", lua_CGFontCanCreatePostScriptSubset},
    {"CGFontCreatePostScriptSubset", lua_CGFontCreatePostScriptSubset},
    {"CGFontCreatePostScriptEncoding", lua_CGFontCreatePostScriptEncoding},
    {"CGFontCopyTableTags", lua_CGFontCopyTableTags},
    {"CGFontCopyTableForTag", lua_CGFontCopyTableForTag},
    {NULL, 0},
};

int LuaOpenCGFont(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGFontAPIs);
    return 0;
}
