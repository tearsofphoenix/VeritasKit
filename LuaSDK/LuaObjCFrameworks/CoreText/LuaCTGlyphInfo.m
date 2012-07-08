//
//  LuaCTGlyphInfo.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTGlyphInfo.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTGlyphInfoRef(lua_State *L)
{
    CTGlyphInfoRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoGetTypeID(lua_State *L)
{
    CTGlyphInfoGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoGetTypeID(lua_State *L)
{
    CTGlyphInfoGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoCreateWithGlyphName(lua_State *L)
{
    CTGlyphInfoCreateWithGlyphName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoRef(lua_State *L)
{
    CTGlyphInfoRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoCreateWithGlyph(lua_State *L)
{
    CTGlyphInfoCreateWithGlyph(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoRef(lua_State *L)
{
    CTGlyphInfoRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoCreateWithCharacterIdentifier(lua_State *L)
{
    CTGlyphInfoCreateWithCharacterIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoRef(lua_State *L)
{
    CTGlyphInfoRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoGetGlyphName(lua_State *L)
{
    CTGlyphInfoGetGlyphName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoGetGlyphName(lua_State *L)
{
    CTGlyphInfoGetGlyphName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoRef(lua_State *L)
{
    CTGlyphInfoRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoGetCharacterIdentifier(lua_State *L)
{
    CTGlyphInfoGetCharacterIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoGetCharacterIdentifier(lua_State *L)
{
    CTGlyphInfoGetCharacterIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoRef(lua_State *L)
{
    CTGlyphInfoRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoGetCharacterCollection(lua_State *L)
{
    CTGlyphInfoGetCharacterCollection(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoGetCharacterCollection(lua_State *L)
{
    CTGlyphInfoGetCharacterCollection(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTGlyphInfoRef(lua_State *L)
{
    CTGlyphInfoRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTGlyphInfoAPIs[] = {
    {"CTGlyphInfoRef", lua_CTGlyphInfoRef},
    {"CTGlyphInfoGetTypeID", lua_CTGlyphInfoGetTypeID},
    {"CTGlyphInfoGetTypeID", lua_CTGlyphInfoGetTypeID},
    {"CTGlyphInfoCreateWithGlyphName", lua_CTGlyphInfoCreateWithGlyphName},
    {"CTGlyphInfoRef", lua_CTGlyphInfoRef},
    {"CTGlyphInfoCreateWithGlyph", lua_CTGlyphInfoCreateWithGlyph},
    {"CTGlyphInfoRef", lua_CTGlyphInfoRef},
    {"CTGlyphInfoCreateWithCharacterIdentifier", lua_CTGlyphInfoCreateWithCharacterIdentifier},
    {"CTGlyphInfoRef", lua_CTGlyphInfoRef},
    {"CTGlyphInfoGetGlyphName", lua_CTGlyphInfoGetGlyphName},
    {"CTGlyphInfoGetGlyphName", lua_CTGlyphInfoGetGlyphName},
    {"CTGlyphInfoRef", lua_CTGlyphInfoRef},
    {"CTGlyphInfoGetCharacterIdentifier", lua_CTGlyphInfoGetCharacterIdentifier},
    {"CTGlyphInfoGetCharacterIdentifier", lua_CTGlyphInfoGetCharacterIdentifier},
    {"CTGlyphInfoRef", lua_CTGlyphInfoRef},
    {"CTGlyphInfoGetCharacterCollection", lua_CTGlyphInfoGetCharacterCollection},
    {"CTGlyphInfoGetCharacterCollection", lua_CTGlyphInfoGetCharacterCollection},
    {"CTGlyphInfoRef", lua_CTGlyphInfoRef},
    {NULL, NULL},
};

int LuaOpenCTGlyphInfo(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTGlyphInfoAPIs);
    return 0;
}
