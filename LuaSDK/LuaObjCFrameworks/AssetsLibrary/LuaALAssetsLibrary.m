//
//  LuaALAssetsLibrary.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaALAssetsLibrary.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_ALAssetsLibraryGroupsEnumerationResultsBlock(lua_State *L)
{
    ALAssetsLibraryGroupsEnumerationResultsBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryAssetForURLResultBlock(lua_State *L)
{
    ALAssetsLibraryAssetForURLResultBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryGroupResultBlock(lua_State *L)
{
    ALAssetsLibraryGroupResultBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryAccessFailureBlock(lua_State *L)
{
    ALAssetsLibraryAccessFailureBlock(lua_touserdata(L, 1));
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

static int lua_ALAssetsLibraryGroupsEnumerationResultsBlock(lua_State *L)
{
    ALAssetsLibraryGroupsEnumerationResultsBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryAssetForURLResultBlock(lua_State *L)
{
    ALAssetsLibraryAssetForURLResultBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryGroupResultBlock(lua_State *L)
{
    ALAssetsLibraryGroupResultBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryGroupResultBlock(lua_State *L)
{
    ALAssetsLibraryGroupResultBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryWriteImageCompletionBlock(lua_State *L)
{
    ALAssetsLibraryWriteImageCompletionBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryWriteImageCompletionBlock(lua_State *L)
{
    ALAssetsLibraryWriteImageCompletionBlock(lua_touserdata(L, 1));
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

static int lua_ALAssetsLibraryChangedNotification(lua_State *L)
{
    ALAssetsLibraryChangedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryErrorDomain(lua_State *L)
{
    ALAssetsLibraryErrorDomain(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryUnknownError(lua_State *L)
{
    ALAssetsLibraryUnknownError(lua_touserdata(L, 1));
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

static int lua_ALAssetsLibraryWriteBusyError(lua_State *L)
{
    ALAssetsLibraryWriteBusyError(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryWriteInvalidDataError(lua_State *L)
{
    ALAssetsLibraryWriteInvalidDataError(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryWriteIncompatibleDataError(lua_State *L)
{
    ALAssetsLibraryWriteIncompatibleDataError(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryWriteDataEncodingError(lua_State *L)
{
    ALAssetsLibraryWriteDataEncodingError(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryWriteDiskSpaceError(lua_State *L)
{
    ALAssetsLibraryWriteDiskSpaceError(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryAccessFailureBlock(lua_State *L)
{
    ALAssetsLibraryAccessFailureBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryDataUnavailableError(lua_State *L)
{
    ALAssetsLibraryDataUnavailableError(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryAccessFailureBlock(lua_State *L)
{
    ALAssetsLibraryAccessFailureBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryAccessUserDeniedError(lua_State *L)
{
    ALAssetsLibraryAccessUserDeniedError(lua_touserdata(L, 1));
    return 1;
}

static int lua_ALAssetsLibraryAccessGloballyDeniedError(lua_State *L)
{
    ALAssetsLibraryAccessGloballyDeniedError(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaALAssetsLibraryAPIs[] = {
    {"ALAssetsLibraryGroupsEnumerationResultsBlock", lua_ALAssetsLibraryGroupsEnumerationResultsBlock},
    {"ALAssetsLibraryAssetForURLResultBlock", lua_ALAssetsLibraryAssetForURLResultBlock},
    {"ALAssetsLibraryGroupResultBlock", lua_ALAssetsLibraryGroupResultBlock},
    {"ALAssetsLibraryAccessFailureBlock", lua_ALAssetsLibraryAccessFailureBlock},
    {"ALAssetsLibraryWriteImageCompletionBlock", lua_ALAssetsLibraryWriteImageCompletionBlock},
    {"ALAssetsLibraryWriteVideoCompletionBlock", lua_ALAssetsLibraryWriteVideoCompletionBlock},
    {"ALAssetsLibraryGroupsEnumerationResultsBlock", lua_ALAssetsLibraryGroupsEnumerationResultsBlock},
    {"ALAssetsLibraryAssetForURLResultBlock", lua_ALAssetsLibraryAssetForURLResultBlock},
    {"ALAssetsLibraryGroupResultBlock", lua_ALAssetsLibraryGroupResultBlock},
    {"ALAssetsLibraryGroupResultBlock", lua_ALAssetsLibraryGroupResultBlock},
    {"ALAssetsLibraryWriteImageCompletionBlock", lua_ALAssetsLibraryWriteImageCompletionBlock},
    {"ALAssetsLibraryWriteImageCompletionBlock", lua_ALAssetsLibraryWriteImageCompletionBlock},
    {"ALAssetsLibraryWriteImageCompletionBlock", lua_ALAssetsLibraryWriteImageCompletionBlock},
    {"ALAssetsLibraryWriteVideoCompletionBlock", lua_ALAssetsLibraryWriteVideoCompletionBlock},
    {"ALAssetsLibraryChangedNotification", lua_ALAssetsLibraryChangedNotification},
    {"ALAssetsLibraryErrorDomain", lua_ALAssetsLibraryErrorDomain},
    {"ALAssetsLibraryUnknownError", lua_ALAssetsLibraryUnknownError},
    {"ALAssetsLibraryWriteImageCompletionBlock", lua_ALAssetsLibraryWriteImageCompletionBlock},
    {"ALAssetsLibraryWriteFailedError", lua_ALAssetsLibraryWriteFailedError},
    {"ALAssetsLibraryWriteBusyError", lua_ALAssetsLibraryWriteBusyError},
    {"ALAssetsLibraryWriteInvalidDataError", lua_ALAssetsLibraryWriteInvalidDataError},
    {"ALAssetsLibraryWriteIncompatibleDataError", lua_ALAssetsLibraryWriteIncompatibleDataError},
    {"ALAssetsLibraryWriteDataEncodingError", lua_ALAssetsLibraryWriteDataEncodingError},
    {"ALAssetsLibraryWriteDiskSpaceError", lua_ALAssetsLibraryWriteDiskSpaceError},
    {"ALAssetsLibraryAccessFailureBlock", lua_ALAssetsLibraryAccessFailureBlock},
    {"ALAssetsLibraryDataUnavailableError", lua_ALAssetsLibraryDataUnavailableError},
    {"ALAssetsLibraryAccessFailureBlock", lua_ALAssetsLibraryAccessFailureBlock},
    {"ALAssetsLibraryAccessUserDeniedError", lua_ALAssetsLibraryAccessUserDeniedError},
    {"ALAssetsLibraryAccessGloballyDeniedError", lua_ALAssetsLibraryAccessGloballyDeniedError},
    {NULL, NULL},
};

int LuaOpenALAssetsLibrary(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaALAssetsLibraryAPIs);
    return 0;
}
