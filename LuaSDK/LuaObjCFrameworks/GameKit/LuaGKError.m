//
//  LuaGKError.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaGKError.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_GKErrorDomain(lua_State *L)
{
    GKErrorDomain(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorUnknown(lua_State *L)
{
    GKErrorUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorCancelled(lua_State *L)
{
    GKErrorCancelled(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorCommunicationsFailure(lua_State *L)
{
    GKErrorCommunicationsFailure(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorUserDenied(lua_State *L)
{
    GKErrorUserDenied(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorInvalidCredentials(lua_State *L)
{
    GKErrorInvalidCredentials(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorNotAuthenticated(lua_State *L)
{
    GKErrorNotAuthenticated(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorAuthenticationInProgress(lua_State *L)
{
    GKErrorAuthenticationInProgress(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorInvalidPlayer(lua_State *L)
{
    GKErrorInvalidPlayer(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorScoreNotSet(lua_State *L)
{
    GKErrorScoreNotSet(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorParentalControlsBlocked(lua_State *L)
{
    GKErrorParentalControlsBlocked(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorPlayerStatusExceedsMaximumLength(lua_State *L)
{
    GKErrorPlayerStatusExceedsMaximumLength(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorPlayerStatusInvalid(lua_State *L)
{
    GKErrorPlayerStatusInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorMatchRequestInvalid(lua_State *L)
{
    GKErrorMatchRequestInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorUnderage(lua_State *L)
{
    GKErrorUnderage(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorGameUnrecognized(lua_State *L)
{
    GKErrorGameUnrecognized(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorNotSupported(lua_State *L)
{
    GKErrorNotSupported(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorInvalidParameter(lua_State *L)
{
    GKErrorInvalidParameter(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorUnexpectedConnection(lua_State *L)
{
    GKErrorUnexpectedConnection(lua_touserdata(L, 1));
    return 1;
}

static int lua_GKErrorCode(lua_State *L)
{
    GKErrorCode(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaGKErrorAPIs[] = {
    {"GKErrorDomain", lua_GKErrorDomain},
    {"GKErrorUnknown", lua_GKErrorUnknown},
    {"GKErrorCancelled", lua_GKErrorCancelled},
    {"GKErrorCommunicationsFailure", lua_GKErrorCommunicationsFailure},
    {"GKErrorUserDenied", lua_GKErrorUserDenied},
    {"GKErrorInvalidCredentials", lua_GKErrorInvalidCredentials},
    {"GKErrorNotAuthenticated", lua_GKErrorNotAuthenticated},
    {"GKErrorAuthenticationInProgress", lua_GKErrorAuthenticationInProgress},
    {"GKErrorInvalidPlayer", lua_GKErrorInvalidPlayer},
    {"GKErrorScoreNotSet", lua_GKErrorScoreNotSet},
    {"GKErrorParentalControlsBlocked", lua_GKErrorParentalControlsBlocked},
    {"GKErrorPlayerStatusExceedsMaximumLength", lua_GKErrorPlayerStatusExceedsMaximumLength},
    {"GKErrorPlayerStatusInvalid", lua_GKErrorPlayerStatusInvalid},
    {"GKErrorMatchRequestInvalid", lua_GKErrorMatchRequestInvalid},
    {"GKErrorUnderage", lua_GKErrorUnderage},
    {"GKErrorGameUnrecognized", lua_GKErrorGameUnrecognized},
    {"GKErrorNotSupported", lua_GKErrorNotSupported},
    {"GKErrorInvalidParameter", lua_GKErrorInvalidParameter},
    {"GKErrorUnexpectedConnection", lua_GKErrorUnexpectedConnection},
    {"GKErrorCode", lua_GKErrorCode},
    {NULL, NULL},
};

int LuaOpenGKError(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaGKErrorAPIs);
    return 0;
}
