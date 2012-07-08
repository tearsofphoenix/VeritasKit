//
//  LuaCFMessagePort.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFMessagePort.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFMessagePortRef(lua_State *L)
{
    CFMessagePortRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortSuccess(lua_State *L)
{
    CFMessagePortSuccess(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortSendTimeout(lua_State *L)
{
    CFMessagePortSendTimeout(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortReceiveTimeout(lua_State *L)
{
    CFMessagePortReceiveTimeout(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortIsInvalid(lua_State *L)
{
    CFMessagePortIsInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortTransportError(lua_State *L)
{
    CFMessagePortTransportError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortBecameInvalidError(lua_State *L)
{
    CFMessagePortBecameInvalidError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortContext(lua_State *L)
{
    CFMessagePortContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortCallBack(lua_State *L)
{
    CFMessagePortCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortInvalidationCallBack(lua_State *L)
{
    CFMessagePortInvalidationCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortGetTypeID(lua_State *L)
{
    CFMessagePortGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortRef(lua_State *L)
{
    CFMessagePortRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortRef(lua_State *L)
{
    CFMessagePortRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortIsRemote(lua_State *L)
{
    CFMessagePortIsRemote(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortGetName(lua_State *L)
{
    CFMessagePortGetName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortSetName(lua_State *L)
{
    CFMessagePortSetName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortGetContext(lua_State *L)
{
    CFMessagePortGetContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortInvalidate(lua_State *L)
{
    CFMessagePortInvalidate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortIsValid(lua_State *L)
{
    CFMessagePortIsValid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortInvalidationCallBack(lua_State *L)
{
    CFMessagePortInvalidationCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortSetInvalidationCallBack(lua_State *L)
{
    CFMessagePortSetInvalidationCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortSendRequest(lua_State *L)
{
    CFMessagePortSendRequest(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortCreateRunLoopSource(lua_State *L)
{
    CFMessagePortCreateRunLoopSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFMessagePortSetDispatchQueue(lua_State *L)
{
    CFMessagePortSetDispatchQueue(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFMessagePortAPIs[] = {
    {"CFMessagePortRef", lua_CFMessagePortRef},
    {"CFMessagePortSuccess", lua_CFMessagePortSuccess},
    {"CFMessagePortSendTimeout", lua_CFMessagePortSendTimeout},
    {"CFMessagePortReceiveTimeout", lua_CFMessagePortReceiveTimeout},
    {"CFMessagePortIsInvalid", lua_CFMessagePortIsInvalid},
    {"CFMessagePortTransportError", lua_CFMessagePortTransportError},
    {"CFMessagePortBecameInvalidError", lua_CFMessagePortBecameInvalidError},
    {"CFMessagePortContext", lua_CFMessagePortContext},
    {"CFMessagePortCallBack", lua_CFMessagePortCallBack},
    {"CFMessagePortInvalidationCallBack", lua_CFMessagePortInvalidationCallBack},
    {"CFMessagePortGetTypeID", lua_CFMessagePortGetTypeID},
    {"CFMessagePortRef", lua_CFMessagePortRef},
    {"CFMessagePortRef", lua_CFMessagePortRef},
    {"CFMessagePortIsRemote", lua_CFMessagePortIsRemote},
    {"CFMessagePortGetName", lua_CFMessagePortGetName},
    {"CFMessagePortSetName", lua_CFMessagePortSetName},
    {"CFMessagePortGetContext", lua_CFMessagePortGetContext},
    {"CFMessagePortInvalidate", lua_CFMessagePortInvalidate},
    {"CFMessagePortIsValid", lua_CFMessagePortIsValid},
    {"CFMessagePortInvalidationCallBack", lua_CFMessagePortInvalidationCallBack},
    {"CFMessagePortSetInvalidationCallBack", lua_CFMessagePortSetInvalidationCallBack},
    {"CFMessagePortSendRequest", lua_CFMessagePortSendRequest},
    {"CFMessagePortCreateRunLoopSource", lua_CFMessagePortCreateRunLoopSource},
    {"CFMessagePortSetDispatchQueue", lua_CFMessagePortSetDispatchQueue},
    {NULL, NULL},
};

int LuaOpenCFMessagePort(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFMessagePortAPIs);
    return 0;
}
