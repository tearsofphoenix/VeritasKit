//
//  LuaCIDetector.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCIDetector.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CIDetectorImageOrientation(lua_State *L)
{
    CIDetectorImageOrientation(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIDetectorTypeFace(lua_State *L)
{
    CIDetectorTypeFace(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIDetectorAccuracy(lua_State *L)
{
    CIDetectorAccuracy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIDetectorAccuracy(lua_State *L)
{
    CIDetectorAccuracy(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIDetectorAccuracyLow(lua_State *L)
{
    CIDetectorAccuracyLow(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIDetectorAccuracyHigh(lua_State *L)
{
    CIDetectorAccuracyHigh(lua_touserdata(L, 1));
    return 1;
}

static int lua_CIDetectorImageOrientation(lua_State *L)
{
    CIDetectorImageOrientation(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCIDetectorAPIs[] = {
    {"CIDetectorImageOrientation", lua_CIDetectorImageOrientation},
    {"CIDetectorTypeFace", lua_CIDetectorTypeFace},
    {"CIDetectorAccuracy", lua_CIDetectorAccuracy},
    {"CIDetectorAccuracy", lua_CIDetectorAccuracy},
    {"CIDetectorAccuracyLow", lua_CIDetectorAccuracyLow},
    {"CIDetectorAccuracyHigh", lua_CIDetectorAccuracyHigh},
    {"CIDetectorImageOrientation", lua_CIDetectorImageOrientation},
    {NULL, NULL},
};

int LuaOpenCIDetector(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCIDetectorAPIs);
    return 0;
}
