//
//  LuaGLKView.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKView.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaGLKConstants[] = {
    {"GLKViewDrawableColorFormatRGBA8888", GLKViewDrawableColorFormatRGBA8888},
    {"GLKViewDrawableColorFormatRGB565", GLKViewDrawableColorFormatRGB565},
    {"GLKViewDrawableDepthFormatNone", GLKViewDrawableDepthFormatNone},
    {"GLKViewDrawableDepthFormat16", GLKViewDrawableDepthFormat16},
    {"GLKViewDrawableDepthFormat24", GLKViewDrawableDepthFormat24},
    {"GLKViewDrawableStencilFormatNone", GLKViewDrawableStencilFormatNone},
    {"GLKViewDrawableStencilFormat8", GLKViewDrawableStencilFormat8},
    {"GLKViewDrawableMultisampleNone", GLKViewDrawableMultisampleNone},
    {"GLKViewDrawableMultisample4X", GLKViewDrawableMultisample4X},
    {NULL, 0},
};

int LuaOpenGLKView(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaGLKConstants);
    return 0;
}
