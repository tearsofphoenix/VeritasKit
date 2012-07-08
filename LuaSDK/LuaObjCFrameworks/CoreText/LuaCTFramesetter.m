//
//  LuaCTFramesetter.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCTFramesetter.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CTFramesetterRef(lua_State *L)
{
    CTFramesetterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterGetTypeID(lua_State *L)
{
    CTFramesetterGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterGetTypeID(lua_State *L)
{
    CTFramesetterGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterCreateWithAttributedString(lua_State *L)
{
    CTFramesetterCreateWithAttributedString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterCreateFrame(lua_State *L)
{
    CTFramesetterCreateFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterRef(lua_State *L)
{
    CTFramesetterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterCreateFrame(lua_State *L)
{
    CTFramesetterCreateFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterCreateFrame(lua_State *L)
{
    CTFramesetterCreateFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterRef(lua_State *L)
{
    CTFramesetterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterGetTypesetter(lua_State *L)
{
    CTFramesetterGetTypesetter(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterGetTypesetter(lua_State *L)
{
    CTFramesetterGetTypesetter(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterRef(lua_State *L)
{
    CTFramesetterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterSuggestFrameSizeWithConstraints(lua_State *L)
{
    CTFramesetterSuggestFrameSizeWithConstraints(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterSuggestFrameSizeWithConstraints(lua_State *L)
{
    CTFramesetterSuggestFrameSizeWithConstraints(lua_touserdata(L, 1));
    return 1;
}

static int lua_CTFramesetterRef(lua_State *L)
{
    CTFramesetterRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCTFramesetterAPIs[] = {
    {"CTFramesetterRef", lua_CTFramesetterRef},
    {"CTFramesetterGetTypeID", lua_CTFramesetterGetTypeID},
    {"CTFramesetterGetTypeID", lua_CTFramesetterGetTypeID},
    {"CTFramesetterCreateWithAttributedString", lua_CTFramesetterCreateWithAttributedString},
    {"CTFramesetterCreateFrame", lua_CTFramesetterCreateFrame},
    {"CTFramesetterRef", lua_CTFramesetterRef},
    {"CTFramesetterCreateFrame", lua_CTFramesetterCreateFrame},
    {"CTFramesetterCreateFrame", lua_CTFramesetterCreateFrame},
    {"CTFramesetterRef", lua_CTFramesetterRef},
    {"CTFramesetterGetTypesetter", lua_CTFramesetterGetTypesetter},
    {"CTFramesetterGetTypesetter", lua_CTFramesetterGetTypesetter},
    {"CTFramesetterRef", lua_CTFramesetterRef},
    {"CTFramesetterSuggestFrameSizeWithConstraints", lua_CTFramesetterSuggestFrameSizeWithConstraints},
    {"CTFramesetterSuggestFrameSizeWithConstraints", lua_CTFramesetterSuggestFrameSizeWithConstraints},
    {"CTFramesetterRef", lua_CTFramesetterRef},
    {NULL, NULL},
};

int LuaOpenCTFramesetter(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCTFramesetterAPIs);
    return 0;
}
