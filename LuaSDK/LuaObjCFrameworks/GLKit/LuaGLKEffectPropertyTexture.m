//
//  LuaGLKEffectPropertyTexture.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGLKEffectPropertyTexture.h"

#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaCGContextConstants[] = {
    {"GLKTextureTarget2D", GLKTextureTarget2D},
    {"GLKTextureTargetCubeMap", GLKTextureTargetCubeMap},
    {"GLKTextureTargetCt", GLKTextureTargetCt},
    {"GLKTextureEnvModeReplace", GLKTextureEnvModeReplace},
    {"GLKTextureEnvModeModulate", GLKTextureEnvModeModulate},
    {"GLKTextureEnvModeDecal", GLKTextureEnvModeDecal},
    {NULL, 0},
};

int LuaOpenGLKEffectPropertyTexture(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaCGContextConstants);
    return 0;
}
