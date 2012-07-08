//
//  LuaCFMachPort.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFMachPort.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFMachPortRef(lua_State *L)
{
    CFMachPortRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMachPortContext(lua_State *L)
{
    CFMachPortContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMachPortCallBack(lua_State *L)
{
    CFMachPortCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMachPortInvalidationCallBack(lua_State *L)
{
    CFMachPortInvalidationCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMachPortGetTypeID(lua_State *L)
{
    CFMachPortGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMachPortRef(lua_State *L)
{
    CFMachPortRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMachPortRef(lua_State *L)
{
    CFMachPortRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMachPortGetPort(lua_State *L)
{
    CFMachPortGetPort(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMachPortGetContext(lua_State *L)
{
    CFMachPortGetContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMachPortInvalidate(lua_State *L)
{
    CFMachPortInvalidate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMachPortIsValid(lua_State *L)
{
    CFMachPortIsValid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMachPortInvalidationCallBack(lua_State *L)
{
    CFMachPortInvalidationCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMachPortSetInvalidationCallBack(lua_State *L)
{
    CFMachPortSetInvalidationCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMachPortCreateRunLoopSource(lua_State *L)
{
    CFMachPortCreateRunLoopSource(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFMachPortAPIs[] = {
    {"CFMachPortRef", lua_CFMachPortRef},
    {"CFMachPortContext", lua_CFMachPortContext},
    {"CFMachPortCallBack", lua_CFMachPortCallBack},
    {"CFMachPortInvalidationCallBack", lua_CFMachPortInvalidationCallBack},
    {"CFMachPortGetTypeID", lua_CFMachPortGetTypeID},
    {"CFMachPortRef", lua_CFMachPortRef},
    {"CFMachPortRef", lua_CFMachPortRef},
    {"CFMachPortGetPort", lua_CFMachPortGetPort},
    {"CFMachPortGetContext", lua_CFMachPortGetContext},
    {"CFMachPortInvalidate", lua_CFMachPortInvalidate},
    {"CFMachPortIsValid", lua_CFMachPortIsValid},
    {"CFMachPortInvalidationCallBack", lua_CFMachPortInvalidationCallBack},
    {"CFMachPortSetInvalidationCallBack", lua_CFMachPortSetInvalidationCallBack},
    {"CFMachPortCreateRunLoopSource", lua_CFMachPortCreateRunLoopSource},
    {NULL, NULL},
};

int LuaOpenCFMachPort(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFMachPortAPIs);
    return 0;
}
