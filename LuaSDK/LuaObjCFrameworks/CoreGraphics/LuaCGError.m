//
//  LuaCGError.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGError.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaCGErrorConstants[] = 
{
    {"kCGErrorSuccess", kCGErrorSuccess},
    {"kCGErrorFailure", kCGErrorFailure},
    {"kCGErrorIllegalArgument", kCGErrorIllegalArgument},
    {"kCGErrorInvalidConnection", kCGErrorInvalidConnection},
    {"kCGErrorInvalidContext", kCGErrorInvalidContext},
    {"kCGErrorCannotComplete", kCGErrorCannotComplete},
    {"kCGErrorNotImplemented", kCGErrorNotImplemented},
    {"kCGErrorRangeCheck", kCGErrorRangeCheck},
    {"kCGErrorTypeCheck", kCGErrorTypeCheck},
    {"kCGErrorInvalidOperation", kCGErrorInvalidOperation},
    {"kCGErrorNoneAvailable", kCGErrorNoneAvailable},
#ifndef __IPHONE_6_0
    {"kCGErrorNameTooLong", kCGErrorNameTooLong},
    {"kCGErrorNoCurrentPoint", kCGErrorNoCurrentPoint},
    {"kCGErrorApplicationRequiresNewerSystem", kCGErrorApplicationRequiresNewerSystem},
    {"kCGErrorApplicationNotPermittedToExecute", kCGErrorApplicationNotPermittedToExecute},
    {"kCGErrorApplicationIncorrectExecutableFormatFound", kCGErrorApplicationIncorrectExecutableFormatFound},
    {"kCGErrorApplicationIsLaunching", kCGErrorApplicationIsLaunching},
    {"kCGErrorApplicationAlreadyRunning", kCGErrorApplicationAlreadyRunning},
    {"kCGErrorApplicationCanOnlyBeRunInOneSessionAtATime", kCGErrorApplicationCanOnlyBeRunInOneSessionAtATime},
    {"kCGErrorClassicApplicationsMustBeLaunchedByClassic", kCGErrorClassicApplicationsMustBeLaunchedByClassic},
    {"kCGErrorForkFailed", kCGErrorForkFailed},
    {"kCGErrorRetryRegistration", kCGErrorRetryRegistration},
    {"kCGErrorFirst", kCGErrorFirst},
    {"kCGErrorLast", kCGErrorLast},
#endif
    {NULL, 0},
};

int LuaOpenCGError(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaCGErrorConstants);
    return 0;
}
