//
//  LuaALAsset.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaALAsset.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_ALAssetsLibrary(lua_State *L)
{
    ALAssetsLibrary(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetPropertyType(lua_State *L)
{
    ALAssetPropertyType(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetPropertyLocation(lua_State *L)
{
    ALAssetPropertyLocation(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetPropertyDuration(lua_State *L)
{
    ALAssetPropertyDuration(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetPropertyOrientation(lua_State *L)
{
    ALAssetPropertyOrientation(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetPropertyDate(lua_State *L)
{
    ALAssetPropertyDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetPropertyRepresentations(lua_State *L)
{
    ALAssetPropertyRepresentations(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetPropertyURLs(lua_State *L)
{
    ALAssetPropertyURLs(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetTypePhoto(lua_State *L)
{
    ALAssetTypePhoto(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetTypeVideo(lua_State *L)
{
    ALAssetTypeVideo(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetTypeUnknown(lua_State *L)
{
    ALAssetTypeUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetRepresentation(lua_State *L)
{
    ALAssetRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetRepresentation(lua_State *L)
{
    ALAssetRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetRepresentation(lua_State *L)
{
    ALAssetRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetRepresentation(lua_State *L)
{
    ALAssetRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetRepresentation(lua_State *L)
{
    ALAssetRepresentation(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryWriteImageCompletionBlock(lua_State *L)
{
    ALAssetsLibraryWriteImageCompletionBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryWriteVideoCompletionBlock(lua_State *L)
{
    ALAssetsLibraryWriteVideoCompletionBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryWriteFailedError(lua_State *L)
{
    ALAssetsLibraryWriteFailedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryWriteImageCompletionBlock(lua_State *L)
{
    ALAssetsLibraryWriteImageCompletionBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryWriteFailedError(lua_State *L)
{
    ALAssetsLibraryWriteFailedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryWriteVideoCompletionBlock(lua_State *L)
{
    ALAssetsLibraryWriteVideoCompletionBlock(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaALAssetAPIs[] = {
    {"ALAssetsLibrary", lua_ALAssetsLibrary},
    {"ALAssetPropertyType", lua_ALAssetPropertyType},
    {"ALAssetPropertyLocation", lua_ALAssetPropertyLocation},
    {"ALAssetPropertyDuration", lua_ALAssetPropertyDuration},
    {"ALAssetPropertyOrientation", lua_ALAssetPropertyOrientation},
    {"ALAssetPropertyDate", lua_ALAssetPropertyDate},
    {"ALAssetPropertyRepresentations", lua_ALAssetPropertyRepresentations},
    {"ALAssetPropertyURLs", lua_ALAssetPropertyURLs},
    {"ALAssetTypePhoto", lua_ALAssetTypePhoto},
    {"ALAssetTypeVideo", lua_ALAssetTypeVideo},
    {"ALAssetTypeUnknown", lua_ALAssetTypeUnknown},
    {"ALAssetRepresentation", lua_ALAssetRepresentation},
    {"ALAssetRepresentation", lua_ALAssetRepresentation},
    {"ALAssetRepresentation", lua_ALAssetRepresentation},
    {"ALAssetRepresentation", lua_ALAssetRepresentation},
    {"ALAssetRepresentation", lua_ALAssetRepresentation},
    {"ALAssetsLibraryWriteImageCompletionBlock", lua_ALAssetsLibraryWriteImageCompletionBlock},
    {"ALAssetsLibraryWriteVideoCompletionBlock", lua_ALAssetsLibraryWriteVideoCompletionBlock},
    {"ALAssetsLibraryWriteFailedError", lua_ALAssetsLibraryWriteFailedError},
    {"ALAssetsLibraryWriteImageCompletionBlock", lua_ALAssetsLibraryWriteImageCompletionBlock},
    {"ALAssetsLibraryWriteFailedError", lua_ALAssetsLibraryWriteFailedError},
    {"ALAssetsLibraryWriteVideoCompletionBlock", lua_ALAssetsLibraryWriteVideoCompletionBlock},
    {NULL, NULL},
};

int LuaOpenALAsset(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaALAssetAPIs);
    return 0;
}
