//
//  LuaCVReturn.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCVReturn.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CVReturnSuccess(lua_State *L)
{
    CVReturnSuccess(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnFirst(lua_State *L)
{
    CVReturnFirst(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnLast(lua_State *L)
{
    CVReturnLast(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnInvalidArgument(lua_State *L)
{
    CVReturnInvalidArgument(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnAllocationFailed(lua_State *L)
{
    CVReturnAllocationFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnInvalidDisplay(lua_State *L)
{
    CVReturnInvalidDisplay(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnDisplayLinkAlreadyRunning(lua_State *L)
{
    CVReturnDisplayLinkAlreadyRunning(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnDisplayLinkNotRunning(lua_State *L)
{
    CVReturnDisplayLinkNotRunning(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnDisplayLinkCallbacksNotSet(lua_State *L)
{
    CVReturnDisplayLinkCallbacksNotSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnInvalidPixelFormat(lua_State *L)
{
    CVReturnInvalidPixelFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnInvalidSize(lua_State *L)
{
    CVReturnInvalidSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnInvalidPixelBufferAttributes(lua_State *L)
{
    CVReturnInvalidPixelBufferAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnPixelBufferNotOpenGLCompatible(lua_State *L)
{
    CVReturnPixelBufferNotOpenGLCompatible(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnWouldExceedAllocationThreshold(lua_State *L)
{
    CVReturnWouldExceedAllocationThreshold(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnPoolAllocationFailed(lua_State *L)
{
    CVReturnPoolAllocationFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnInvalidPoolAttributes(lua_State *L)
{
    CVReturnInvalidPoolAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnSuccess(lua_State *L)
{
    CVReturnSuccess(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnFirst(lua_State *L)
{
    CVReturnFirst(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnError(lua_State *L)
{
    CVReturnError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnInvalidArgument(lua_State *L)
{
    CVReturnInvalidArgument(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnAllocationFailed(lua_State *L)
{
    CVReturnAllocationFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnInvalidDisplay(lua_State *L)
{
    CVReturnInvalidDisplay(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnDisplayLinkAlreadyRunning(lua_State *L)
{
    CVReturnDisplayLinkAlreadyRunning(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnDisplayLinkNotRunning(lua_State *L)
{
    CVReturnDisplayLinkNotRunning(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnDisplayLinkCallbacksNotSet(lua_State *L)
{
    CVReturnDisplayLinkCallbacksNotSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnInvalidPixelFormat(lua_State *L)
{
    CVReturnInvalidPixelFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnInvalidSize(lua_State *L)
{
    CVReturnInvalidSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnInvalidPixelBufferAttributes(lua_State *L)
{
    CVReturnInvalidPixelBufferAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnPixelBufferNotOpenGLCompatible(lua_State *L)
{
    CVReturnPixelBufferNotOpenGLCompatible(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnWouldExceedAllocationThreshold(lua_State *L)
{
    CVReturnWouldExceedAllocationThreshold(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnPoolAllocationFailed(lua_State *L)
{
    CVReturnPoolAllocationFailed(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnInvalidPoolAttributes(lua_State *L)
{
    CVReturnInvalidPoolAttributes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CVReturnLast(lua_State *L)
{
    CVReturnLast(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCVReturnAPIs[] = {
    {"CVReturnSuccess", lua_CVReturnSuccess},
    {"CVReturnFirst", lua_CVReturnFirst},
    {"CVReturnLast", lua_CVReturnLast},
    {"CVReturnInvalidArgument", lua_CVReturnInvalidArgument},
    {"CVReturnAllocationFailed", lua_CVReturnAllocationFailed},
    {"CVReturnInvalidDisplay", lua_CVReturnInvalidDisplay},
    {"CVReturnDisplayLinkAlreadyRunning", lua_CVReturnDisplayLinkAlreadyRunning},
    {"CVReturnDisplayLinkNotRunning", lua_CVReturnDisplayLinkNotRunning},
    {"CVReturnDisplayLinkCallbacksNotSet", lua_CVReturnDisplayLinkCallbacksNotSet},
    {"CVReturnInvalidPixelFormat", lua_CVReturnInvalidPixelFormat},
    {"CVReturnInvalidSize", lua_CVReturnInvalidSize},
    {"CVReturnInvalidPixelBufferAttributes", lua_CVReturnInvalidPixelBufferAttributes},
    {"CVReturnPixelBufferNotOpenGLCompatible", lua_CVReturnPixelBufferNotOpenGLCompatible},
    {"CVReturnWouldExceedAllocationThreshold", lua_CVReturnWouldExceedAllocationThreshold},
    {"CVReturnPoolAllocationFailed", lua_CVReturnPoolAllocationFailed},
    {"CVReturnInvalidPoolAttributes", lua_CVReturnInvalidPoolAttributes},
    {"CVReturnSuccess", lua_CVReturnSuccess},
    {"CVReturnFirst", lua_CVReturnFirst},
    {"CVReturnError", lua_CVReturnError},
    {"CVReturnInvalidArgument", lua_CVReturnInvalidArgument},
    {"CVReturnAllocationFailed", lua_CVReturnAllocationFailed},
    {"CVReturnInvalidDisplay", lua_CVReturnInvalidDisplay},
    {"CVReturnDisplayLinkAlreadyRunning", lua_CVReturnDisplayLinkAlreadyRunning},
    {"CVReturnDisplayLinkNotRunning", lua_CVReturnDisplayLinkNotRunning},
    {"CVReturnDisplayLinkCallbacksNotSet", lua_CVReturnDisplayLinkCallbacksNotSet},
    {"CVReturnInvalidPixelFormat", lua_CVReturnInvalidPixelFormat},
    {"CVReturnInvalidSize", lua_CVReturnInvalidSize},
    {"CVReturnInvalidPixelBufferAttributes", lua_CVReturnInvalidPixelBufferAttributes},
    {"CVReturnPixelBufferNotOpenGLCompatible", lua_CVReturnPixelBufferNotOpenGLCompatible},
    {"CVReturnWouldExceedAllocationThreshold", lua_CVReturnWouldExceedAllocationThreshold},
    {"CVReturnPoolAllocationFailed", lua_CVReturnPoolAllocationFailed},
    {"CVReturnInvalidPoolAttributes", lua_CVReturnInvalidPoolAttributes},
    {"CVReturnLast", lua_CVReturnLast},
    {NULL, NULL},
};

int LuaOpenCVReturn(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCVReturnAPIs);
    return 0;
}
