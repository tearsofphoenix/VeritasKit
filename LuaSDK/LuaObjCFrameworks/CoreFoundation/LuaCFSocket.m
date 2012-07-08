//
//  LuaCFSocket.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFSocket.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFSocketRef(lua_State *L)
{
    CFSocketRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketReadCallBack(lua_State *L)
{
    CFSocketReadCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketAcceptCallBack(lua_State *L)
{
    CFSocketAcceptCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketNativeHandle(lua_State *L)
{
    CFSocketNativeHandle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketDataCallBack(lua_State *L)
{
    CFSocketDataCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketConnectCallBack(lua_State *L)
{
    CFSocketConnectCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketConnectToAddress(lua_State *L)
{
    CFSocketConnectToAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketConnectCallBack(lua_State *L)
{
    CFSocketConnectCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketConnectCallBack(lua_State *L)
{
    CFSocketConnectCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketWriteCallBack(lua_State *L)
{
    CFSocketWriteCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketReadCallBack(lua_State *L)
{
    CFSocketReadCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketReadCallBack(lua_State *L)
{
    CFSocketReadCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketDataCallBack(lua_State *L)
{
    CFSocketDataCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCloseOnInvalidate(lua_State *L)
{
    CFSocketCloseOnInvalidate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketError(lua_State *L)
{
    CFSocketError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketSuccess(lua_State *L)
{
    CFSocketSuccess(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketError(lua_State *L)
{
    CFSocketError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketTimeout(lua_State *L)
{
    CFSocketTimeout(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketError(lua_State *L)
{
    CFSocketError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketSignature(lua_State *L)
{
    CFSocketSignature(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCallBackType(lua_State *L)
{
    CFSocketCallBackType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketNoCallBack(lua_State *L)
{
    CFSocketNoCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketReadCallBack(lua_State *L)
{
    CFSocketReadCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketAcceptCallBack(lua_State *L)
{
    CFSocketAcceptCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketDataCallBack(lua_State *L)
{
    CFSocketDataCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketConnectCallBack(lua_State *L)
{
    CFSocketConnectCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketWriteCallBack(lua_State *L)
{
    CFSocketWriteCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCallBackType(lua_State *L)
{
    CFSocketCallBackType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketAutomaticallyReenableReadCallBack(lua_State *L)
{
    CFSocketAutomaticallyReenableReadCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketAutomaticallyReenableAcceptCallBack(lua_State *L)
{
    CFSocketAutomaticallyReenableAcceptCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketAutomaticallyReenableDataCallBack(lua_State *L)
{
    CFSocketAutomaticallyReenableDataCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketAutomaticallyReenableWriteCallBack(lua_State *L)
{
    CFSocketAutomaticallyReenableWriteCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketLeaveErrors(lua_State *L)
{
    CFSocketLeaveErrors(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCloseOnInvalidate(lua_State *L)
{
    CFSocketCloseOnInvalidate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCallBack(lua_State *L)
{
    CFSocketCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketContext(lua_State *L)
{
    CFSocketContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketNativeHandle(lua_State *L)
{
    CFSocketNativeHandle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketNativeHandle(lua_State *L)
{
    CFSocketNativeHandle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketGetTypeID(lua_State *L)
{
    CFSocketGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketRef(lua_State *L)
{
    CFSocketRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketRef(lua_State *L)
{
    CFSocketRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketRef(lua_State *L)
{
    CFSocketRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketRef(lua_State *L)
{
    CFSocketRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCreateWithSignature(lua_State *L)
{
    CFSocketCreateWithSignature(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketError(lua_State *L)
{
    CFSocketError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketError(lua_State *L)
{
    CFSocketError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketInvalidate(lua_State *L)
{
    CFSocketInvalidate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketIsValid(lua_State *L)
{
    CFSocketIsValid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCopyAddress(lua_State *L)
{
    CFSocketCopyAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCopyPeerAddress(lua_State *L)
{
    CFSocketCopyPeerAddress(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketGetContext(lua_State *L)
{
    CFSocketGetContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketNativeHandle(lua_State *L)
{
    CFSocketNativeHandle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCreateRunLoopSource(lua_State *L)
{
    CFSocketCreateRunLoopSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketGetSocketFlags(lua_State *L)
{
    CFSocketGetSocketFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketSetSocketFlags(lua_State *L)
{
    CFSocketSetSocketFlags(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketDisableCallBacks(lua_State *L)
{
    CFSocketDisableCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketEnableCallBacks(lua_State *L)
{
    CFSocketEnableCallBacks(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketError(lua_State *L)
{
    CFSocketError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketRegisterValue(lua_State *L)
{
    CFSocketRegisterValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCopyRegisteredValue(lua_State *L)
{
    CFSocketCopyRegisteredValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSockets(lua_State *L)
{
    CFSockets(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCopyRegisteredSocketData(lua_State *L)
{
    CFSocketCopyRegisteredSocketData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCopyRegisteredSocketSignature(lua_State *L)
{
    CFSocketCopyRegisteredSocketSignature(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCopyRegisteredValue(lua_State *L)
{
    CFSocketCopyRegisteredValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketUnregister(lua_State *L)
{
    CFSocketUnregister(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketError(lua_State *L)
{
    CFSocketError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketError(lua_State *L)
{
    CFSocketError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketError(lua_State *L)
{
    CFSocketError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketError(lua_State *L)
{
    CFSocketError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketError(lua_State *L)
{
    CFSocketError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketSetDefaultNameRegistryPortNumber(lua_State *L)
{
    CFSocketSetDefaultNameRegistryPortNumber(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketGetDefaultNameRegistryPortNumber(lua_State *L)
{
    CFSocketGetDefaultNameRegistryPortNumber(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketCommandKey(lua_State *L)
{
    CFSocketCommandKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketNameKey(lua_State *L)
{
    CFSocketNameKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketValueKey(lua_State *L)
{
    CFSocketValueKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketResultKey(lua_State *L)
{
    CFSocketResultKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketErrorKey(lua_State *L)
{
    CFSocketErrorKey(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketRegisterCommand(lua_State *L)
{
    CFSocketRegisterCommand(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFSocketRetrieveCommand(lua_State *L)
{
    CFSocketRetrieveCommand(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFSocketAPIs[] = {
    {"CFSocketRef", lua_CFSocketRef},
    {"CFSocketReadCallBack", lua_CFSocketReadCallBack},
    {"CFSocketAcceptCallBack", lua_CFSocketAcceptCallBack},
    {"CFSocketNativeHandle", lua_CFSocketNativeHandle},
    {"CFSocketDataCallBack", lua_CFSocketDataCallBack},
    {"CFSocketConnectCallBack", lua_CFSocketConnectCallBack},
    {"CFSocketConnectToAddress", lua_CFSocketConnectToAddress},
    {"CFSocketConnectCallBack", lua_CFSocketConnectCallBack},
    {"CFSocketConnectCallBack", lua_CFSocketConnectCallBack},
    {"CFSocketWriteCallBack", lua_CFSocketWriteCallBack},
    {"CFSocketReadCallBack", lua_CFSocketReadCallBack},
    {"CFSocketReadCallBack", lua_CFSocketReadCallBack},
    {"CFSocketDataCallBack", lua_CFSocketDataCallBack},
    {"CFSocketCloseOnInvalidate", lua_CFSocketCloseOnInvalidate},
    {"CFSocketError", lua_CFSocketError},
    {"CFSocketSuccess", lua_CFSocketSuccess},
    {"CFSocketError", lua_CFSocketError},
    {"CFSocketTimeout", lua_CFSocketTimeout},
    {"CFSocketError", lua_CFSocketError},
    {"CFSocketSignature", lua_CFSocketSignature},
    {"CFSocketCallBackType", lua_CFSocketCallBackType},
    {"CFSocketNoCallBack", lua_CFSocketNoCallBack},
    {"CFSocketReadCallBack", lua_CFSocketReadCallBack},
    {"CFSocketAcceptCallBack", lua_CFSocketAcceptCallBack},
    {"CFSocketDataCallBack", lua_CFSocketDataCallBack},
    {"CFSocketConnectCallBack", lua_CFSocketConnectCallBack},
    {"CFSocketWriteCallBack", lua_CFSocketWriteCallBack},
    {"CFSocketCallBackType", lua_CFSocketCallBackType},
    {"CFSocketAutomaticallyReenableReadCallBack", lua_CFSocketAutomaticallyReenableReadCallBack},
    {"CFSocketAutomaticallyReenableAcceptCallBack", lua_CFSocketAutomaticallyReenableAcceptCallBack},
    {"CFSocketAutomaticallyReenableDataCallBack", lua_CFSocketAutomaticallyReenableDataCallBack},
    {"CFSocketAutomaticallyReenableWriteCallBack", lua_CFSocketAutomaticallyReenableWriteCallBack},
    {"CFSocketLeaveErrors", lua_CFSocketLeaveErrors},
    {"CFSocketCloseOnInvalidate", lua_CFSocketCloseOnInvalidate},
    {"CFSocketCallBack", lua_CFSocketCallBack},
    {"CFSocketContext", lua_CFSocketContext},
    {"CFSocketNativeHandle", lua_CFSocketNativeHandle},
    {"CFSocketNativeHandle", lua_CFSocketNativeHandle},
    {"CFSocketGetTypeID", lua_CFSocketGetTypeID},
    {"CFSocketRef", lua_CFSocketRef},
    {"CFSocketRef", lua_CFSocketRef},
    {"CFSocketRef", lua_CFSocketRef},
    {"CFSocketRef", lua_CFSocketRef},
    {"CFSocketCreateWithSignature", lua_CFSocketCreateWithSignature},
    {"CFSocketError", lua_CFSocketError},
    {"CFSocketError", lua_CFSocketError},
    {"CFSocketInvalidate", lua_CFSocketInvalidate},
    {"CFSocketIsValid", lua_CFSocketIsValid},
    {"CFSocketCopyAddress", lua_CFSocketCopyAddress},
    {"CFSocketCopyPeerAddress", lua_CFSocketCopyPeerAddress},
    {"CFSocketGetContext", lua_CFSocketGetContext},
    {"CFSocketNativeHandle", lua_CFSocketNativeHandle},
    {"CFSocketCreateRunLoopSource", lua_CFSocketCreateRunLoopSource},
    {"CFSocketGetSocketFlags", lua_CFSocketGetSocketFlags},
    {"CFSocketSetSocketFlags", lua_CFSocketSetSocketFlags},
    {"CFSocketDisableCallBacks", lua_CFSocketDisableCallBacks},
    {"CFSocketEnableCallBacks", lua_CFSocketEnableCallBacks},
    {"CFSocketError", lua_CFSocketError},
    {"CFSocketRegisterValue", lua_CFSocketRegisterValue},
    {"CFSocketCopyRegisteredValue", lua_CFSocketCopyRegisteredValue},
    {"CFSockets", lua_CFSockets},
    {"CFSocketCopyRegisteredSocketData", lua_CFSocketCopyRegisteredSocketData},
    {"CFSocketCopyRegisteredSocketSignature", lua_CFSocketCopyRegisteredSocketSignature},
    {"CFSocketCopyRegisteredValue", lua_CFSocketCopyRegisteredValue},
    {"CFSocketUnregister", lua_CFSocketUnregister},
    {"CFSocketError", lua_CFSocketError},
    {"CFSocketError", lua_CFSocketError},
    {"CFSocketError", lua_CFSocketError},
    {"CFSocketError", lua_CFSocketError},
    {"CFSocketError", lua_CFSocketError},
    {"CFSocketSetDefaultNameRegistryPortNumber", lua_CFSocketSetDefaultNameRegistryPortNumber},
    {"CFSocketGetDefaultNameRegistryPortNumber", lua_CFSocketGetDefaultNameRegistryPortNumber},
    {"CFSocketCommandKey", lua_CFSocketCommandKey},
    {"CFSocketNameKey", lua_CFSocketNameKey},
    {"CFSocketValueKey", lua_CFSocketValueKey},
    {"CFSocketResultKey", lua_CFSocketResultKey},
    {"CFSocketErrorKey", lua_CFSocketErrorKey},
    {"CFSocketRegisterCommand", lua_CFSocketRegisterCommand},
    {"CFSocketRetrieveCommand", lua_CFSocketRetrieveCommand},
    {NULL, NULL},
};

int LuaOpenCFSocket(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFSocketAPIs);
    return 0;
}
