//
//  LuaCVPixelBufferPool.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCVPixelBufferPool.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CVPixelBufferPoolRef(lua_State *L)
{
    CVPixelBufferPoolRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolMinimumBufferCountKey(lua_State *L)
{
    CVPixelBufferPoolMinimumBufferCountKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolMaximumBufferAgeKey(lua_State *L)
{
    CVPixelBufferPoolMaximumBufferAgeKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolGetTypeID(lua_State *L)
{
    CVPixelBufferPoolGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRetain(lua_State *L)
{
    CVPixelBufferPoolRetain(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRef(lua_State *L)
{
    CVPixelBufferPoolRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRef(lua_State *L)
{
    CVPixelBufferPoolRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRef(lua_State *L)
{
    CVPixelBufferPoolRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRef(lua_State *L)
{
    CVPixelBufferPoolRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRelease(lua_State *L)
{
    CVPixelBufferPoolRelease(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRef(lua_State *L)
{
    CVPixelBufferPoolRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRef(lua_State *L)
{
    CVPixelBufferPoolRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRelease(lua_State *L)
{
    CVPixelBufferPoolRelease(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolCreate(lua_State *L)
{
    CVPixelBufferPoolCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolCreate(lua_State *L)
{
    CVPixelBufferPoolCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRef(lua_State *L)
{
    CVPixelBufferPoolRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolGetAttributes(lua_State *L)
{
    CVPixelBufferPoolGetAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRef(lua_State *L)
{
    CVPixelBufferPoolRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolGetAttributes(lua_State *L)
{
    CVPixelBufferPoolGetAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolGetPixelBufferAttributes(lua_State *L)
{
    CVPixelBufferPoolGetPixelBufferAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRef(lua_State *L)
{
    CVPixelBufferPoolRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolGetPixelBufferAttributes(lua_State *L)
{
    CVPixelBufferPoolGetPixelBufferAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolCreatePixelBuffer(lua_State *L)
{
    CVPixelBufferPoolCreatePixelBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolCreatePixelBuffer(lua_State *L)
{
    CVPixelBufferPoolCreatePixelBuffer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRef(lua_State *L)
{
    CVPixelBufferPoolRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(lua_State *L)
{
    CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(lua_State *L)
{
    CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolRef(lua_State *L)
{
    CVPixelBufferPoolRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(lua_State *L)
{
    CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(lua_State *L)
{
    CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolAllocationThresholdKey(lua_State *L)
{
    CVPixelBufferPoolAllocationThresholdKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolFreeBufferNotification(lua_State *L)
{
    CVPixelBufferPoolFreeBufferNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(lua_State *L)
{
    CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolAllocationThresholdKey(lua_State *L)
{
    CVPixelBufferPoolAllocationThresholdKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(lua_State *L)
{
    CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVPixelBufferPoolFreeBufferNotification(lua_State *L)
{
    CVPixelBufferPoolFreeBufferNotification(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCVPixelBufferPoolAPIs[] = {
    {"CVPixelBufferPoolRef", lua_CVPixelBufferPoolRef},
    {"CVPixelBufferPoolMinimumBufferCountKey", lua_CVPixelBufferPoolMinimumBufferCountKey},
    {"CVPixelBufferPoolMaximumBufferAgeKey", lua_CVPixelBufferPoolMaximumBufferAgeKey},
    {"CVPixelBufferPoolGetTypeID", lua_CVPixelBufferPoolGetTypeID},
    {"CVPixelBufferPoolRetain", lua_CVPixelBufferPoolRetain},
    {"CVPixelBufferPoolRef", lua_CVPixelBufferPoolRef},
    {"CVPixelBufferPoolRef", lua_CVPixelBufferPoolRef},
    {"CVPixelBufferPoolRef", lua_CVPixelBufferPoolRef},
    {"CVPixelBufferPoolRef", lua_CVPixelBufferPoolRef},
    {"CVPixelBufferPoolRelease", lua_CVPixelBufferPoolRelease},
    {"CVPixelBufferPoolRef", lua_CVPixelBufferPoolRef},
    {"CVPixelBufferPoolRef", lua_CVPixelBufferPoolRef},
    {"CVPixelBufferPoolRelease", lua_CVPixelBufferPoolRelease},
    {"CVPixelBufferPoolCreate", lua_CVPixelBufferPoolCreate},
    {"CVPixelBufferPoolCreate", lua_CVPixelBufferPoolCreate},
    {"CVPixelBufferPoolRef", lua_CVPixelBufferPoolRef},
    {"CVPixelBufferPoolGetAttributes", lua_CVPixelBufferPoolGetAttributes},
    {"CVPixelBufferPoolRef", lua_CVPixelBufferPoolRef},
    {"CVPixelBufferPoolGetAttributes", lua_CVPixelBufferPoolGetAttributes},
    {"CVPixelBufferPoolGetPixelBufferAttributes", lua_CVPixelBufferPoolGetPixelBufferAttributes},
    {"CVPixelBufferPoolRef", lua_CVPixelBufferPoolRef},
    {"CVPixelBufferPoolGetPixelBufferAttributes", lua_CVPixelBufferPoolGetPixelBufferAttributes},
    {"CVPixelBufferPoolCreatePixelBuffer", lua_CVPixelBufferPoolCreatePixelBuffer},
    {"CVPixelBufferPoolCreatePixelBuffer", lua_CVPixelBufferPoolCreatePixelBuffer},
    {"CVPixelBufferPoolRef", lua_CVPixelBufferPoolRef},
    {"CVPixelBufferPoolCreatePixelBufferWithAuxAttributes", lua_CVPixelBufferPoolCreatePixelBufferWithAuxAttributes},
    {"CVPixelBufferPoolCreatePixelBufferWithAuxAttributes", lua_CVPixelBufferPoolCreatePixelBufferWithAuxAttributes},
    {"CVPixelBufferPoolRef", lua_CVPixelBufferPoolRef},
    {"CVPixelBufferPoolCreatePixelBufferWithAuxAttributes", lua_CVPixelBufferPoolCreatePixelBufferWithAuxAttributes},
    {"CVPixelBufferPoolCreatePixelBufferWithAuxAttributes", lua_CVPixelBufferPoolCreatePixelBufferWithAuxAttributes},
    {"CVPixelBufferPoolAllocationThresholdKey", lua_CVPixelBufferPoolAllocationThresholdKey},
    {"CVPixelBufferPoolFreeBufferNotification", lua_CVPixelBufferPoolFreeBufferNotification},
    {"CVPixelBufferPoolCreatePixelBufferWithAuxAttributes", lua_CVPixelBufferPoolCreatePixelBufferWithAuxAttributes},
    {"CVPixelBufferPoolAllocationThresholdKey", lua_CVPixelBufferPoolAllocationThresholdKey},
    {"CVPixelBufferPoolCreatePixelBufferWithAuxAttributes", lua_CVPixelBufferPoolCreatePixelBufferWithAuxAttributes},
    {"CVPixelBufferPoolFreeBufferNotification", lua_CVPixelBufferPoolFreeBufferNotification},
    {NULL, NULL},
};

int LuaOpenCVPixelBufferPool(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCVPixelBufferPoolAPIs);
    return 0;
}
