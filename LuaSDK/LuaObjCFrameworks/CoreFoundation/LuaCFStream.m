//
//  LuaCFStream.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFStream.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFStreamStatusNotOpen(lua_State *L)
{
    CFStreamStatusNotOpen(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamStatusOpening(lua_State *L)
{
    CFStreamStatusOpening(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamStatusOpen(lua_State *L)
{
    CFStreamStatusOpen(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamStatusReading(lua_State *L)
{
    CFStreamStatusReading(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamStatusWriting(lua_State *L)
{
    CFStreamStatusWriting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamStatusAtEnd(lua_State *L)
{
    CFStreamStatusAtEnd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamStatusClosed(lua_State *L)
{
    CFStreamStatusClosed(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamStatusError(lua_State *L)
{
    CFStreamStatusError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamStatus(lua_State *L)
{
    CFStreamStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamEventNone(lua_State *L)
{
    CFStreamEventNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamEventOpenCompleted(lua_State *L)
{
    CFStreamEventOpenCompleted(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamEventHasBytesAvailable(lua_State *L)
{
    CFStreamEventHasBytesAvailable(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamEventCanAcceptBytes(lua_State *L)
{
    CFStreamEventCanAcceptBytes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamEventErrorOccurred(lua_State *L)
{
    CFStreamEventErrorOccurred(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamEventEndEncountered(lua_State *L)
{
    CFStreamEventEndEncountered(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamEventType(lua_State *L)
{
    CFStreamEventType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamClientContext(lua_State *L)
{
    CFStreamClientContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamEventType(lua_State *L)
{
    CFStreamEventType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamEventType(lua_State *L)
{
    CFStreamEventType(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamPropertyDataWritten(lua_State *L)
{
    CFStreamPropertyDataWritten(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamStatusAtEnd(lua_State *L)
{
    CFStreamStatusAtEnd(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamPropertyDataWritten(lua_State *L)
{
    CFStreamPropertyDataWritten(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamCreateBoundPair(lua_State *L)
{
    CFStreamCreateBoundPair(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamPropertyAppendToFile(lua_State *L)
{
    CFStreamPropertyAppendToFile(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamPropertyFileCurrentOffset(lua_State *L)
{
    CFStreamPropertyFileCurrentOffset(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamPropertySocketNativeHandle(lua_State *L)
{
    CFStreamPropertySocketNativeHandle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamPropertySocketRemoteHostName(lua_State *L)
{
    CFStreamPropertySocketRemoteHostName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamPropertySocketRemotePortNumber(lua_State *L)
{
    CFStreamPropertySocketRemotePortNumber(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamCreatePairWithSocket(lua_State *L)
{
    CFStreamCreatePairWithSocket(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamCreatePairWithSocketToHost(lua_State *L)
{
    CFStreamCreatePairWithSocketToHost(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamCreatePairWithPeerSocketSignature(lua_State *L)
{
    CFStreamCreatePairWithPeerSocketSignature(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamStatus(lua_State *L)
{
    CFStreamStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamStatus(lua_State *L)
{
    CFStreamStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamStatusOpen(lua_State *L)
{
    CFStreamStatusOpen(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamClose(lua_State *L)
{
    CFStreamClose(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamCanRead(lua_State *L)
{
    CFStreamCanRead(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamCanWrite(lua_State *L)
{
    CFStreamCanWrite(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamClientContext(lua_State *L)
{
    CFStreamClientContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamClientContext(lua_State *L)
{
    CFStreamClientContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamErrorDomainCustom(lua_State *L)
{
    CFStreamErrorDomainCustom(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamErrorDomainPOSIX(lua_State *L)
{
    CFStreamErrorDomainPOSIX(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamErrorDomainMacOSStatus(lua_State *L)
{
    CFStreamErrorDomainMacOSStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamErrorDomain(lua_State *L)
{
    CFStreamErrorDomain(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamError(lua_State *L)
{
    CFStreamError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamError(lua_State *L)
{
    CFStreamError(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFStreamError(lua_State *L)
{
    CFStreamError(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFStreamAPIs[] = {
    {"CFStreamStatusNotOpen", lua_CFStreamStatusNotOpen},
    {"CFStreamStatusOpening", lua_CFStreamStatusOpening},
    {"CFStreamStatusOpen", lua_CFStreamStatusOpen},
    {"CFStreamStatusReading", lua_CFStreamStatusReading},
    {"CFStreamStatusWriting", lua_CFStreamStatusWriting},
    {"CFStreamStatusAtEnd", lua_CFStreamStatusAtEnd},
    {"CFStreamStatusClosed", lua_CFStreamStatusClosed},
    {"CFStreamStatusError", lua_CFStreamStatusError},
    {"CFStreamStatus", lua_CFStreamStatus},
    {"CFStreamEventNone", lua_CFStreamEventNone},
    {"CFStreamEventOpenCompleted", lua_CFStreamEventOpenCompleted},
    {"CFStreamEventHasBytesAvailable", lua_CFStreamEventHasBytesAvailable},
    {"CFStreamEventCanAcceptBytes", lua_CFStreamEventCanAcceptBytes},
    {"CFStreamEventErrorOccurred", lua_CFStreamEventErrorOccurred},
    {"CFStreamEventEndEncountered", lua_CFStreamEventEndEncountered},
    {"CFStreamEventType", lua_CFStreamEventType},
    {"CFStreamClientContext", lua_CFStreamClientContext},
    {"CFStreamEventType", lua_CFStreamEventType},
    {"CFStreamEventType", lua_CFStreamEventType},
    {"CFStreamPropertyDataWritten", lua_CFStreamPropertyDataWritten},
    {"CFStreamStatusAtEnd", lua_CFStreamStatusAtEnd},
    {"CFStreamPropertyDataWritten", lua_CFStreamPropertyDataWritten},
    {"CFStreamCreateBoundPair", lua_CFStreamCreateBoundPair},
    {"CFStreamPropertyAppendToFile", lua_CFStreamPropertyAppendToFile},
    {"CFStreamPropertyFileCurrentOffset", lua_CFStreamPropertyFileCurrentOffset},
    {"CFStreamPropertySocketNativeHandle", lua_CFStreamPropertySocketNativeHandle},
    {"CFStreamPropertySocketRemoteHostName", lua_CFStreamPropertySocketRemoteHostName},
    {"CFStreamPropertySocketRemotePortNumber", lua_CFStreamPropertySocketRemotePortNumber},
    {"CFStreamCreatePairWithSocket", lua_CFStreamCreatePairWithSocket},
    {"CFStreamCreatePairWithSocketToHost", lua_CFStreamCreatePairWithSocketToHost},
    {"CFStreamCreatePairWithPeerSocketSignature", lua_CFStreamCreatePairWithPeerSocketSignature},
    {"CFStreamStatus", lua_CFStreamStatus},
    {"CFStreamStatus", lua_CFStreamStatus},
    {"CFStreamStatusOpen", lua_CFStreamStatusOpen},
    {"CFStreamClose", lua_CFStreamClose},
    {"CFStreamCanRead", lua_CFStreamCanRead},
    {"CFStreamCanWrite", lua_CFStreamCanWrite},
    {"CFStreamClientContext", lua_CFStreamClientContext},
    {"CFStreamClientContext", lua_CFStreamClientContext},
    {"CFStreamErrorDomainCustom", lua_CFStreamErrorDomainCustom},
    {"CFStreamErrorDomainPOSIX", lua_CFStreamErrorDomainPOSIX},
    {"CFStreamErrorDomainMacOSStatus", lua_CFStreamErrorDomainMacOSStatus},
    {"CFStreamErrorDomain", lua_CFStreamErrorDomain},
    {"CFStreamError", lua_CFStreamError},
    {"CFStreamError", lua_CFStreamError},
    {"CFStreamError", lua_CFStreamError},
    {NULL, NULL},
};

int LuaOpenCFStream(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFStreamAPIs);
    return 0;
}
