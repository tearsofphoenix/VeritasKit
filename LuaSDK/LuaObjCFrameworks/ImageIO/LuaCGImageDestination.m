//
//  LuaCGImageDestination.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGImageDestination.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CGImageDestinationRef(lua_State *L)
{
    CGImageDestinationRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinationAddImage(lua_State *L)
{
    CGImageDestinationAddImage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinationAddImageFromSource(lua_State *L)
{
    CGImageDestinationAddImageFromSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinationLossyCompressionQuality(lua_State *L)
{
    CGImageDestinationLossyCompressionQuality(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinationBackgroundColor(lua_State *L)
{
    CGImageDestinationBackgroundColor(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinations(lua_State *L)
{
    CGImageDestinations(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinationGetTypeID(lua_State *L)
{
    CGImageDestinationGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinationCopyTypeIdentifiers(lua_State *L)
{
    CGImageDestinationCopyTypeIdentifiers(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinationRef(lua_State *L)
{
    CGImageDestinationRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinationRef(lua_State *L)
{
    CGImageDestinationRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinationRef(lua_State *L)
{
    CGImageDestinationRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinationSetProperties(lua_State *L)
{
    CGImageDestinationSetProperties(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinationAddImage(lua_State *L)
{
    CGImageDestinationAddImage(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinationAddImageFromSource(lua_State *L)
{
    CGImageDestinationAddImageFromSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageDestinationFinalize(lua_State *L)
{
    CGImageDestinationFinalize(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCGImageDestinationAPIs[] = {
    {"CGImageDestinationRef", lua_CGImageDestinationRef},
    {"CGImageDestinationAddImage", lua_CGImageDestinationAddImage},
    {"CGImageDestinationAddImageFromSource", lua_CGImageDestinationAddImageFromSource},
    {"CGImageDestinationLossyCompressionQuality", lua_CGImageDestinationLossyCompressionQuality},
    {"CGImageDestinationBackgroundColor", lua_CGImageDestinationBackgroundColor},
    {"CGImageDestinations", lua_CGImageDestinations},
    {"CGImageDestinationGetTypeID", lua_CGImageDestinationGetTypeID},
    {"CGImageDestinationCopyTypeIdentifiers", lua_CGImageDestinationCopyTypeIdentifiers},
    {"CGImageDestinationRef", lua_CGImageDestinationRef},
    {"CGImageDestinationRef", lua_CGImageDestinationRef},
    {"CGImageDestinationRef", lua_CGImageDestinationRef},
    {"CGImageDestinationSetProperties", lua_CGImageDestinationSetProperties},
    {"CGImageDestinationAddImage", lua_CGImageDestinationAddImage},
    {"CGImageDestinationAddImageFromSource", lua_CGImageDestinationAddImageFromSource},
    {"CGImageDestinationFinalize", lua_CGImageDestinationFinalize},
    {NULL, NULL},
};

int LuaOpenCGImageDestination(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGImageDestinationAPIs);
    return 0;
}
