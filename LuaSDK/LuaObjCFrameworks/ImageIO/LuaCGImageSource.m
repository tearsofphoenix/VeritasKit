//
//  LuaCGImageSource.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGImageSource.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CGImageSourceRef(lua_State *L)
{
    CGImageSourceRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceStatus(lua_State *L)
{
    CGImageSourceStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceStatus(lua_State *L)
{
    CGImageSourceStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceRef(lua_State *L)
{
    CGImageSourceRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceTypeIdentifierHint(lua_State *L)
{
    CGImageSourceTypeIdentifierHint(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceCopyPropertiesAtIndex(lua_State *L)
{
    CGImageSourceCopyPropertiesAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceCreateImageAtIndex(lua_State *L)
{
    CGImageSourceCreateImageAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceShouldCache(lua_State *L)
{
    CGImageSourceShouldCache(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceShouldAllowFloat(lua_State *L)
{
    CGImageSourceShouldAllowFloat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceCreateThumbnailAtIndex(lua_State *L)
{
    CGImageSourceCreateThumbnailAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceThumbnailMaxPixelSize(lua_State *L)
{
    CGImageSourceThumbnailMaxPixelSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceCreateThumbnailFromImageIfAbsent(lua_State *L)
{
    CGImageSourceCreateThumbnailFromImageIfAbsent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceThumbnailMaxPixelSize(lua_State *L)
{
    CGImageSourceThumbnailMaxPixelSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceCreateThumbnailFromImageAlways(lua_State *L)
{
    CGImageSourceCreateThumbnailFromImageAlways(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceThumbnailMaxPixelSize(lua_State *L)
{
    CGImageSourceThumbnailMaxPixelSize(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceCreateThumbnailWithTransform(lua_State *L)
{
    CGImageSourceCreateThumbnailWithTransform(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSources(lua_State *L)
{
    CGImageSources(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceGetTypeID(lua_State *L)
{
    CGImageSourceGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceCopyTypeIdentifiers(lua_State *L)
{
    CGImageSourceCopyTypeIdentifiers(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceRef(lua_State *L)
{
    CGImageSourceRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceRef(lua_State *L)
{
    CGImageSourceRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceRef(lua_State *L)
{
    CGImageSourceRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceGetType(lua_State *L)
{
    CGImageSourceGetType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceGetCount(lua_State *L)
{
    CGImageSourceGetCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceCopyProperties(lua_State *L)
{
    CGImageSourceCopyProperties(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceCopyPropertiesAtIndex(lua_State *L)
{
    CGImageSourceCopyPropertiesAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceCreateImageAtIndex(lua_State *L)
{
    CGImageSourceCreateImageAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceCreateThumbnailAtIndex(lua_State *L)
{
    CGImageSourceCreateThumbnailAtIndex(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceUpdateDataProvider(lua_State *L)
{
    CGImageSourceUpdateDataProvider(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceRef(lua_State *L)
{
    CGImageSourceRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceUpdateData(lua_State *L)
{
    CGImageSourceUpdateData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceUpdateDataProvider(lua_State *L)
{
    CGImageSourceUpdateDataProvider(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceStatus(lua_State *L)
{
    CGImageSourceStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CGImageSourceStatus(lua_State *L)
{
    CGImageSourceStatus(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCGImageSourceAPIs[] = {
    {"CGImageSourceRef", lua_CGImageSourceRef},
    {"CGImageSourceStatus", lua_CGImageSourceStatus},
    {"CGImageSourceStatus", lua_CGImageSourceStatus},
    {"CGImageSourceRef", lua_CGImageSourceRef},
    {"CGImageSourceTypeIdentifierHint", lua_CGImageSourceTypeIdentifierHint},
    {"CGImageSourceCopyPropertiesAtIndex", lua_CGImageSourceCopyPropertiesAtIndex},
    {"CGImageSourceCreateImageAtIndex", lua_CGImageSourceCreateImageAtIndex},
    {"CGImageSourceShouldCache", lua_CGImageSourceShouldCache},
    {"CGImageSourceShouldAllowFloat", lua_CGImageSourceShouldAllowFloat},
    {"CGImageSourceCreateThumbnailAtIndex", lua_CGImageSourceCreateThumbnailAtIndex},
    {"CGImageSourceThumbnailMaxPixelSize", lua_CGImageSourceThumbnailMaxPixelSize},
    {"CGImageSourceCreateThumbnailFromImageIfAbsent", lua_CGImageSourceCreateThumbnailFromImageIfAbsent},
    {"CGImageSourceThumbnailMaxPixelSize", lua_CGImageSourceThumbnailMaxPixelSize},
    {"CGImageSourceCreateThumbnailFromImageAlways", lua_CGImageSourceCreateThumbnailFromImageAlways},
    {"CGImageSourceThumbnailMaxPixelSize", lua_CGImageSourceThumbnailMaxPixelSize},
    {"CGImageSourceCreateThumbnailWithTransform", lua_CGImageSourceCreateThumbnailWithTransform},
    {"CGImageSources", lua_CGImageSources},
    {"CGImageSourceGetTypeID", lua_CGImageSourceGetTypeID},
    {"CGImageSourceCopyTypeIdentifiers", lua_CGImageSourceCopyTypeIdentifiers},
    {"CGImageSourceRef", lua_CGImageSourceRef},
    {"CGImageSourceRef", lua_CGImageSourceRef},
    {"CGImageSourceRef", lua_CGImageSourceRef},
    {"CGImageSourceGetType", lua_CGImageSourceGetType},
    {"CGImageSourceGetCount", lua_CGImageSourceGetCount},
    {"CGImageSourceCopyProperties", lua_CGImageSourceCopyProperties},
    {"CGImageSourceCopyPropertiesAtIndex", lua_CGImageSourceCopyPropertiesAtIndex},
    {"CGImageSourceCreateImageAtIndex", lua_CGImageSourceCreateImageAtIndex},
    {"CGImageSourceCreateThumbnailAtIndex", lua_CGImageSourceCreateThumbnailAtIndex},
    {"CGImageSourceUpdateDataProvider", lua_CGImageSourceUpdateDataProvider},
    {"CGImageSourceRef", lua_CGImageSourceRef},
    {"CGImageSourceUpdateData", lua_CGImageSourceUpdateData},
    {"CGImageSourceUpdateDataProvider", lua_CGImageSourceUpdateDataProvider},
    {"CGImageSourceStatus", lua_CGImageSourceStatus},
    {"CGImageSourceStatus", lua_CGImageSourceStatus},
    {NULL, NULL},
};

int LuaOpenCGImageSource(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGImageSourceAPIs);
    return 0;
}
