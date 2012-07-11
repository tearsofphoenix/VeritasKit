//
//  LuaGLKEffectPropertyLight.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKEffectPropertyLight.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaCGContextConstants[] = {
    {"GLKLightingTypePerVertex", GLKLightingTypePerVertex},
    {"GLKLightingTypePerPixel", GLKLightingTypePerPixel},
    {NULL, 0},
};

int LuaOpenGLKEffectPropertyLight(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaCGContextConstants);
    return 0;
}
