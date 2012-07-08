//
//  LuaCMAttitude.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCMAttitude.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CMAttitudeReferenceFrame(lua_State *L)
{
    CMAttitudeReferenceFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttitudeReferenceFrame(lua_State *L)
{
    CMAttitudeReferenceFrame(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttitudeReferenceFrameXArbitraryZVertical(lua_State *L)
{
    CMAttitudeReferenceFrameXArbitraryZVertical(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttitudeReferenceFrameXArbitraryCorrectedZVertical(lua_State *L)
{
    CMAttitudeReferenceFrameXArbitraryCorrectedZVertical(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttitudeReferenceFrameXArbitraryZVertical(lua_State *L)
{
    CMAttitudeReferenceFrameXArbitraryZVertical(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttitudeReferenceFrameXArbitraryZVertical(lua_State *L)
{
    CMAttitudeReferenceFrameXArbitraryZVertical(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttitudeReferenceFrameXMagneticNorthZVertical(lua_State *L)
{
    CMAttitudeReferenceFrameXMagneticNorthZVertical(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttitudeReferenceFrameXTrueNorthZVertical(lua_State *L)
{
    CMAttitudeReferenceFrameXTrueNorthZVertical(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttitudeReferenceFrameXArbitraryZVertical(lua_State *L)
{
    CMAttitudeReferenceFrameXArbitraryZVertical(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttitudeReferenceFrameXArbitraryCorrectedZVertical(lua_State *L)
{
    CMAttitudeReferenceFrameXArbitraryCorrectedZVertical(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttitudeReferenceFrameXMagneticNorthZVertical(lua_State *L)
{
    CMAttitudeReferenceFrameXMagneticNorthZVertical(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttitudeReferenceFrameXTrueNorthZVertical(lua_State *L)
{
    CMAttitudeReferenceFrameXTrueNorthZVertical(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAttitudeReferenceFrame(lua_State *L)
{
    CMAttitudeReferenceFrame(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCMAttitudeAPIs[] = {
    {"CMAttitudeReferenceFrame", lua_CMAttitudeReferenceFrame},
    {"CMAttitudeReferenceFrame", lua_CMAttitudeReferenceFrame},
    {"CMAttitudeReferenceFrameXArbitraryZVertical", lua_CMAttitudeReferenceFrameXArbitraryZVertical},
    {"CMAttitudeReferenceFrameXArbitraryCorrectedZVertical", lua_CMAttitudeReferenceFrameXArbitraryCorrectedZVertical},
    {"CMAttitudeReferenceFrameXArbitraryZVertical", lua_CMAttitudeReferenceFrameXArbitraryZVertical},
    {"CMAttitudeReferenceFrameXArbitraryZVertical", lua_CMAttitudeReferenceFrameXArbitraryZVertical},
    {"CMAttitudeReferenceFrameXMagneticNorthZVertical", lua_CMAttitudeReferenceFrameXMagneticNorthZVertical},
    {"CMAttitudeReferenceFrameXTrueNorthZVertical", lua_CMAttitudeReferenceFrameXTrueNorthZVertical},
    {"CMAttitudeReferenceFrameXArbitraryZVertical", lua_CMAttitudeReferenceFrameXArbitraryZVertical},
    {"CMAttitudeReferenceFrameXArbitraryCorrectedZVertical", lua_CMAttitudeReferenceFrameXArbitraryCorrectedZVertical},
    {"CMAttitudeReferenceFrameXMagneticNorthZVertical", lua_CMAttitudeReferenceFrameXMagneticNorthZVertical},
    {"CMAttitudeReferenceFrameXTrueNorthZVertical", lua_CMAttitudeReferenceFrameXTrueNorthZVertical},
    {"CMAttitudeReferenceFrame", lua_CMAttitudeReferenceFrame},
    {NULL, NULL},
};

int LuaOpenCMAttitude(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCMAttitudeAPIs);
    return 0;
}
