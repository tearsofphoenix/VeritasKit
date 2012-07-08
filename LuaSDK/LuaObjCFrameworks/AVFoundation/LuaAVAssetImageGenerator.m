//
//  LuaAVAssetImageGenerator.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVAssetImageGenerator.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVAssetImageGeneratorInternal(lua_State *L)
{
    AVAssetImageGeneratorInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorApertureModeCleanAperture(lua_State *L)
{
    AVAssetImageGeneratorApertureModeCleanAperture(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorApertureModeCleanAperture(lua_State *L)
{
    AVAssetImageGeneratorApertureModeCleanAperture(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorApertureModeProductionAperture(lua_State *L)
{
    AVAssetImageGeneratorApertureModeProductionAperture(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorApertureModeProductionAperture(lua_State *L)
{
    AVAssetImageGeneratorApertureModeProductionAperture(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorApertureModeEncodedPixels(lua_State *L)
{
    AVAssetImageGeneratorApertureModeEncodedPixels(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorApertureModeEncodedPixels(lua_State *L)
{
    AVAssetImageGeneratorApertureModeEncodedPixels(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorSucceeded(lua_State *L)
{
    AVAssetImageGeneratorSucceeded(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorFailed(lua_State *L)
{
    AVAssetImageGeneratorFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorCancelled(lua_State *L)
{
    AVAssetImageGeneratorCancelled(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorResult(lua_State *L)
{
    AVAssetImageGeneratorResult(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorInternal(lua_State *L)
{
    AVAssetImageGeneratorInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorApertureModeCleanAperture(lua_State *L)
{
    AVAssetImageGeneratorApertureModeCleanAperture(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorFailed(lua_State *L)
{
    AVAssetImageGeneratorFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorCompletionHandler(lua_State *L)
{
    AVAssetImageGeneratorCompletionHandler(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorCompletionHandler(lua_State *L)
{
    AVAssetImageGeneratorCompletionHandler(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVAssetImageGeneratorCancelled(lua_State *L)
{
    AVAssetImageGeneratorCancelled(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVAssetImageGeneratorAPIs[] = {
    {"AVAssetImageGeneratorInternal", lua_AVAssetImageGeneratorInternal},
    {"AVAssetImageGeneratorApertureModeCleanAperture", lua_AVAssetImageGeneratorApertureModeCleanAperture},
    {"AVAssetImageGeneratorApertureModeCleanAperture", lua_AVAssetImageGeneratorApertureModeCleanAperture},
    {"AVAssetImageGeneratorApertureModeProductionAperture", lua_AVAssetImageGeneratorApertureModeProductionAperture},
    {"AVAssetImageGeneratorApertureModeProductionAperture", lua_AVAssetImageGeneratorApertureModeProductionAperture},
    {"AVAssetImageGeneratorApertureModeEncodedPixels", lua_AVAssetImageGeneratorApertureModeEncodedPixels},
    {"AVAssetImageGeneratorApertureModeEncodedPixels", lua_AVAssetImageGeneratorApertureModeEncodedPixels},
    {"AVAssetImageGeneratorSucceeded", lua_AVAssetImageGeneratorSucceeded},
    {"AVAssetImageGeneratorFailed", lua_AVAssetImageGeneratorFailed},
    {"AVAssetImageGeneratorCancelled", lua_AVAssetImageGeneratorCancelled},
    {"AVAssetImageGeneratorResult", lua_AVAssetImageGeneratorResult},
    {"AVAssetImageGeneratorInternal", lua_AVAssetImageGeneratorInternal},
    {"AVAssetImageGeneratorApertureModeCleanAperture", lua_AVAssetImageGeneratorApertureModeCleanAperture},
    {"AVAssetImageGeneratorFailed", lua_AVAssetImageGeneratorFailed},
    {"AVAssetImageGeneratorCompletionHandler", lua_AVAssetImageGeneratorCompletionHandler},
    {"AVAssetImageGeneratorCompletionHandler", lua_AVAssetImageGeneratorCompletionHandler},
    {"AVAssetImageGeneratorCancelled", lua_AVAssetImageGeneratorCancelled},
    {NULL, NULL},
};

int LuaOpenAVAssetImageGenerator(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVAssetImageGeneratorAPIs);
    return 0;
}
