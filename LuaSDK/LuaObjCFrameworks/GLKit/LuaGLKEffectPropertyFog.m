//
//  LuaGLKEffectPropertyFog.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKEffectPropertyFog.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaCGContextConstants[] = {
    {"GLKFogModeExp", GLKFogModeExp},
    {"GLKFogModeExp2", GLKFogModeExp2},
    {"GLKFogModeLinear", GLKFogModeLinear},
    {NULL, 0},
};


int LuaOpenGLKEffectPropertyFog(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaCGContextConstants);
    return 0;
}
