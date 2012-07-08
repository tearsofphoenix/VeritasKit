//
//  LuaCFFileDescriptor.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFFileDescriptor.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFFileDescriptorNativeDescriptor(lua_State *L)
{
    CFFileDescriptorNativeDescriptor(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorRef(lua_State *L)
{
    CFFileDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorReadCallBack(lua_State *L)
{
    CFFileDescriptorReadCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorWriteCallBack(lua_State *L)
{
    CFFileDescriptorWriteCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorCallBack(lua_State *L)
{
    CFFileDescriptorCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorContext(lua_State *L)
{
    CFFileDescriptorContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorGetTypeID(lua_State *L)
{
    CFFileDescriptorGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorRef(lua_State *L)
{
    CFFileDescriptorRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorNativeDescriptor(lua_State *L)
{
    CFFileDescriptorNativeDescriptor(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorGetContext(lua_State *L)
{
    CFFileDescriptorGetContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorEnableCallBacks(lua_State *L)
{
    CFFileDescriptorEnableCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorDisableCallBacks(lua_State *L)
{
    CFFileDescriptorDisableCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorInvalidate(lua_State *L)
{
    CFFileDescriptorInvalidate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorIsValid(lua_State *L)
{
    CFFileDescriptorIsValid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFFileDescriptorCreateRunLoopSource(lua_State *L)
{
    CFFileDescriptorCreateRunLoopSource(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFFileDescriptorAPIs[] = {
    {"CFFileDescriptorNativeDescriptor", lua_CFFileDescriptorNativeDescriptor},
    {"CFFileDescriptorRef", lua_CFFileDescriptorRef},
    {"CFFileDescriptorReadCallBack", lua_CFFileDescriptorReadCallBack},
    {"CFFileDescriptorWriteCallBack", lua_CFFileDescriptorWriteCallBack},
    {"CFFileDescriptorCallBack", lua_CFFileDescriptorCallBack},
    {"CFFileDescriptorContext", lua_CFFileDescriptorContext},
    {"CFFileDescriptorGetTypeID", lua_CFFileDescriptorGetTypeID},
    {"CFFileDescriptorRef", lua_CFFileDescriptorRef},
    {"CFFileDescriptorNativeDescriptor", lua_CFFileDescriptorNativeDescriptor},
    {"CFFileDescriptorGetContext", lua_CFFileDescriptorGetContext},
    {"CFFileDescriptorEnableCallBacks", lua_CFFileDescriptorEnableCallBacks},
    {"CFFileDescriptorDisableCallBacks", lua_CFFileDescriptorDisableCallBacks},
    {"CFFileDescriptorInvalidate", lua_CFFileDescriptorInvalidate},
    {"CFFileDescriptorIsValid", lua_CFFileDescriptorIsValid},
    {"CFFileDescriptorCreateRunLoopSource", lua_CFFileDescriptorCreateRunLoopSource},
    {NULL, NULL},
};

int LuaOpenCFFileDescriptor(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFFileDescriptorAPIs);
    return 0;
}
