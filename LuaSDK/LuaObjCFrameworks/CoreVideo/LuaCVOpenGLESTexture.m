//
//  LuaCVOpenGLESTexture.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCVOpenGLESTexture.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CVOpenGLESTextureRef(lua_State *L)
{
    CVOpenGLESTextureRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureRef(lua_State *L)
{
    CVOpenGLESTextureRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureGetTypeID(lua_State *L)
{
    CVOpenGLESTextureGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureGetTarget(lua_State *L)
{
    CVOpenGLESTextureGetTarget(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureGetTarget(lua_State *L)
{
    CVOpenGLESTextureGetTarget(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureGetName(lua_State *L)
{
    CVOpenGLESTextureGetName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureGetName(lua_State *L)
{
    CVOpenGLESTextureGetName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureIsFlipped(lua_State *L)
{
    CVOpenGLESTextureIsFlipped(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureIsFlipped(lua_State *L)
{
    CVOpenGLESTextureIsFlipped(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureGetCleanTexCoords(lua_State *L)
{
    CVOpenGLESTextureGetCleanTexCoords(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVOpenGLESTextureGetCleanTexCoords(lua_State *L)
{
    CVOpenGLESTextureGetCleanTexCoords(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCVOpenGLESTextureAPIs[] = {
    {"CVOpenGLESTextureRef", lua_CVOpenGLESTextureRef},
    {"CVOpenGLESTextureRef", lua_CVOpenGLESTextureRef},
    {"CVOpenGLESTextureGetTypeID", lua_CVOpenGLESTextureGetTypeID},
    {"CVOpenGLESTextureGetTarget", lua_CVOpenGLESTextureGetTarget},
    {"CVOpenGLESTextureGetTarget", lua_CVOpenGLESTextureGetTarget},
    {"CVOpenGLESTextureGetName", lua_CVOpenGLESTextureGetName},
    {"CVOpenGLESTextureGetName", lua_CVOpenGLESTextureGetName},
    {"CVOpenGLESTextureIsFlipped", lua_CVOpenGLESTextureIsFlipped},
    {"CVOpenGLESTextureIsFlipped", lua_CVOpenGLESTextureIsFlipped},
    {"CVOpenGLESTextureGetCleanTexCoords", lua_CVOpenGLESTextureGetCleanTexCoords},
    {"CVOpenGLESTextureGetCleanTexCoords", lua_CVOpenGLESTextureGetCleanTexCoords},
    {NULL, NULL},
};

int LuaOpenCVOpenGLESTexture(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCVOpenGLESTextureAPIs);
    return 0;
}
