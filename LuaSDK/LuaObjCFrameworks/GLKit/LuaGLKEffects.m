//
//  LuaGLKEffects.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKEffects.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaCGContextConstants[] = {
    {"GLKVertexAttribPosition", GLKVertexAttribPosition},
    {"GLKVertexAttribNormal", GLKVertexAttribNormal},
    {"GLKVertexAttribColor", GLKVertexAttribColor},
    {"GLKVertexAttribTexCoord0", GLKVertexAttribTexCoord0},
    {"GLKVertexAttribTexCoord1", GLKVertexAttribTexCoord1},
    {NULL, 0},
};


int LuaOpenGLKEffects(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaCGContextConstants);
    return 0;
}
