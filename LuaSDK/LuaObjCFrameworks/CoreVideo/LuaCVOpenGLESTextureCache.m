//
//  LuaCVOpenGLESTextureCache.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCVOpenGLESTextureCache.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CVOpenGLESTextureCacheRef(lua_State *L)
{
    CVOpenGLESTextureCacheRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheRef(lua_State *L)
{
    CVOpenGLESTextureCacheRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheFlush(lua_State *L)
{
    CVOpenGLESTextureCacheFlush(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheMaximumTextureAgeKey(lua_State *L)
{
    CVOpenGLESTextureCacheMaximumTextureAgeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheGetTypeID(lua_State *L)
{
    CVOpenGLESTextureCacheGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheCreate(lua_State *L)
{
    CVOpenGLESTextureCacheCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheCreate(lua_State *L)
{
    CVOpenGLESTextureCacheCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheRef(lua_State *L)
{
    CVOpenGLESTextureCacheRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheCreateTextureFromImage(lua_State *L)
{
    CVOpenGLESTextureCacheCreateTextureFromImage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheCreateTextureFromImage(lua_State *L)
{
    CVOpenGLESTextureCacheCreateTextureFromImage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheCreateTextureFromImage(lua_State *L)
{
    CVOpenGLESTextureCacheCreateTextureFromImage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheCreateTextureFromImage(lua_State *L)
{
    CVOpenGLESTextureCacheCreateTextureFromImage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheCreateTextureFromImage(lua_State *L)
{
    CVOpenGLESTextureCacheCreateTextureFromImage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheCreateTextureFromImage(lua_State *L)
{
    CVOpenGLESTextureCacheCreateTextureFromImage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheRef(lua_State *L)
{
    CVOpenGLESTextureCacheRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheFlush(lua_State *L)
{
    CVOpenGLESTextureCacheFlush(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureCacheFlush(lua_State *L)
{
    CVOpenGLESTextureCacheFlush(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCVOpenGLESTextureCacheAPIs[] = {
    {"CVOpenGLESTextureCacheRef", lua_CVOpenGLESTextureCacheRef},
    {"CVOpenGLESTextureCacheRef", lua_CVOpenGLESTextureCacheRef},
    {"CVOpenGLESTextureCacheFlush", lua_CVOpenGLESTextureCacheFlush},
    {"CVOpenGLESTextureCacheMaximumTextureAgeKey", lua_CVOpenGLESTextureCacheMaximumTextureAgeKey},
    {"CVOpenGLESTextureCacheGetTypeID", lua_CVOpenGLESTextureCacheGetTypeID},
    {"CVOpenGLESTextureCacheCreate", lua_CVOpenGLESTextureCacheCreate},
    {"CVOpenGLESTextureCacheCreate", lua_CVOpenGLESTextureCacheCreate},
    {"CVOpenGLESTextureCacheRef", lua_CVOpenGLESTextureCacheRef},
    {"CVOpenGLESTextureCacheCreateTextureFromImage", lua_CVOpenGLESTextureCacheCreateTextureFromImage},
    {"CVOpenGLESTextureCacheCreateTextureFromImage", lua_CVOpenGLESTextureCacheCreateTextureFromImage},
    {"CVOpenGLESTextureCacheCreateTextureFromImage", lua_CVOpenGLESTextureCacheCreateTextureFromImage},
    {"CVOpenGLESTextureCacheCreateTextureFromImage", lua_CVOpenGLESTextureCacheCreateTextureFromImage},
    {"CVOpenGLESTextureCacheCreateTextureFromImage", lua_CVOpenGLESTextureCacheCreateTextureFromImage},
    {"CVOpenGLESTextureCacheCreateTextureFromImage", lua_CVOpenGLESTextureCacheCreateTextureFromImage},
    {"CVOpenGLESTextureCacheRef", lua_CVOpenGLESTextureCacheRef},
    {"CVOpenGLESTextureCacheFlush", lua_CVOpenGLESTextureCacheFlush},
    {"CVOpenGLESTextureCacheFlush", lua_CVOpenGLESTextureCacheFlush},
    {NULL, NULL},
};

int LuaOpenCVOpenGLESTextureCache(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCVOpenGLESTextureCacheAPIs);
    return 0;
}
