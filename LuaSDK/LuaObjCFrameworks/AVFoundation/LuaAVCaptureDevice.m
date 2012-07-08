//
//  LuaAVCaptureDevice.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVCaptureDevice.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVCaptureDeviceWasConnectedNotification(lua_State *L)
{
    AVCaptureDeviceWasConnectedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceWasConnectedNotification(lua_State *L)
{
    AVCaptureDeviceWasConnectedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceWasDisconnectedNotification(lua_State *L)
{
    AVCaptureDeviceWasDisconnectedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceWasDisconnectedNotification(lua_State *L)
{
    AVCaptureDeviceWasDisconnectedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceSubjectAreaDidChangeNotification(lua_State *L)
{
    AVCaptureDeviceSubjectAreaDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceSubjectAreaDidChangeNotification(lua_State *L)
{
    AVCaptureDeviceSubjectAreaDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceSubjectAreaDidChangeNotification(lua_State *L)
{
    AVCaptureDeviceSubjectAreaDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceInternal(lua_State *L)
{
    AVCaptureDeviceInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceInput(lua_State *L)
{
    AVCaptureDeviceInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceInternal(lua_State *L)
{
    AVCaptureDeviceInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceWasConnectedNotification(lua_State *L)
{
    AVCaptureDeviceWasConnectedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceWasConnectedNotification(lua_State *L)
{
    AVCaptureDeviceWasConnectedNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDevicePosition(lua_State *L)
{
    AVCaptureDevicePosition(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDevicePositionBack(lua_State *L)
{
    AVCaptureDevicePositionBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDevicePositionFront(lua_State *L)
{
    AVCaptureDevicePositionFront(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDevicePositionBack(lua_State *L)
{
    AVCaptureDevicePositionBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDevicePositionFront(lua_State *L)
{
    AVCaptureDevicePositionFront(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDevicePosition(lua_State *L)
{
    AVCaptureDevicePosition(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDevicePosition(lua_State *L)
{
    AVCaptureDevicePosition(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDevicePosition(lua_State *L)
{
    AVCaptureDevicePosition(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDevicePosition(lua_State *L)
{
    AVCaptureDevicePosition(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceFlash(lua_State *L)
{
    AVCaptureDeviceFlash(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceTorch(lua_State *L)
{
    AVCaptureDeviceTorch(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceFocus(lua_State *L)
{
    AVCaptureDeviceFocus(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceExposure(lua_State *L)
{
    AVCaptureDeviceExposure(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceWhiteBalance(lua_State *L)
{
    AVCaptureDeviceWhiteBalance(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceSubjectAreaChangeMonitoring(lua_State *L)
{
    AVCaptureDeviceSubjectAreaChangeMonitoring(lua_touserdata(L, 1));
    return 1;
}

static int lua_AVCaptureDeviceSubjectAreaDidChangeNotification(lua_State *L)
{
    AVCaptureDeviceSubjectAreaDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVCaptureDeviceAPIs[] = {
    {"AVCaptureDeviceWasConnectedNotification", lua_AVCaptureDeviceWasConnectedNotification},
    {"AVCaptureDeviceWasConnectedNotification", lua_AVCaptureDeviceWasConnectedNotification},
    {"AVCaptureDeviceWasDisconnectedNotification", lua_AVCaptureDeviceWasDisconnectedNotification},
    {"AVCaptureDeviceWasDisconnectedNotification", lua_AVCaptureDeviceWasDisconnectedNotification},
    {"AVCaptureDeviceSubjectAreaDidChangeNotification", lua_AVCaptureDeviceSubjectAreaDidChangeNotification},
    {"AVCaptureDeviceSubjectAreaDidChangeNotification", lua_AVCaptureDeviceSubjectAreaDidChangeNotification},
    {"AVCaptureDeviceSubjectAreaDidChangeNotification", lua_AVCaptureDeviceSubjectAreaDidChangeNotification},
    {"AVCaptureDeviceInternal", lua_AVCaptureDeviceInternal},
    {"AVCaptureDeviceInput", lua_AVCaptureDeviceInput},
    {"AVCaptureDeviceInternal", lua_AVCaptureDeviceInternal},
    {"AVCaptureDeviceWasConnectedNotification", lua_AVCaptureDeviceWasConnectedNotification},
    {"AVCaptureDeviceWasConnectedNotification", lua_AVCaptureDeviceWasConnectedNotification},
    {"AVCaptureDevicePosition", lua_AVCaptureDevicePosition},
    {"AVCaptureDevicePositionBack", lua_AVCaptureDevicePositionBack},
    {"AVCaptureDevicePositionFront", lua_AVCaptureDevicePositionFront},
    {"AVCaptureDevicePositionBack", lua_AVCaptureDevicePositionBack},
    {"AVCaptureDevicePositionFront", lua_AVCaptureDevicePositionFront},
    {"AVCaptureDevicePosition", lua_AVCaptureDevicePosition},
    {"AVCaptureDevicePosition", lua_AVCaptureDevicePosition},
    {"AVCaptureDevicePosition", lua_AVCaptureDevicePosition},
    {"AVCaptureDevicePosition", lua_AVCaptureDevicePosition},
    {"AVCaptureDeviceFlash", lua_AVCaptureDeviceFlash},
    {"AVCaptureDeviceTorch", lua_AVCaptureDeviceTorch},
    {"AVCaptureDeviceFocus", lua_AVCaptureDeviceFocus},
    {"AVCaptureDeviceExposure", lua_AVCaptureDeviceExposure},
    {"AVCaptureDeviceWhiteBalance", lua_AVCaptureDeviceWhiteBalance},
    {"AVCaptureDeviceSubjectAreaChangeMonitoring", lua_AVCaptureDeviceSubjectAreaChangeMonitoring},
    {"AVCaptureDeviceSubjectAreaDidChangeNotification", lua_AVCaptureDeviceSubjectAreaDidChangeNotification},
    {NULL, NULL},
};

int LuaOpenAVCaptureDevice(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVCaptureDeviceAPIs);
    return 0;
}
