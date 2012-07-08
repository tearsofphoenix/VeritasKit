//
//  LuaSCNetworkConnection.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSCNetworkConnection.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionContext(lua_State *L)
{
    SCNetworkConnectionContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCreateWithServiceID(lua_State *L)
{
    SCNetworkConnectionCreateWithServiceID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionContext(lua_State *L)
{
    SCNetworkConnectionContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionStatus(lua_State *L)
{
    SCNetworkConnectionStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionInvalid(lua_State *L)
{
    SCNetworkConnectionInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionDisconnected(lua_State *L)
{
    SCNetworkConnectionDisconnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionConnecting(lua_State *L)
{
    SCNetworkConnectionConnecting(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionConnected(lua_State *L)
{
    SCNetworkConnectionConnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionDisconnecting(lua_State *L)
{
    SCNetworkConnectionDisconnecting(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionInvalid(lua_State *L)
{
    SCNetworkConnectionInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionDisconnected(lua_State *L)
{
    SCNetworkConnectionDisconnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionConnecting(lua_State *L)
{
    SCNetworkConnectionConnecting(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionConnected(lua_State *L)
{
    SCNetworkConnectionConnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionDisconnecting(lua_State *L)
{
    SCNetworkConnectionDisconnecting(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionStatus(lua_State *L)
{
    SCNetworkConnectionStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPStatus(lua_State *L)
{
    SCNetworkConnectionPPPStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPDisconnected(lua_State *L)
{
    SCNetworkConnectionPPPDisconnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPInitializing(lua_State *L)
{
    SCNetworkConnectionPPPInitializing(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPConnectingLink(lua_State *L)
{
    SCNetworkConnectionPPPConnectingLink(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPDialOnTraffic(lua_State *L)
{
    SCNetworkConnectionPPPDialOnTraffic(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPNegotiatingLink(lua_State *L)
{
    SCNetworkConnectionPPPNegotiatingLink(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPAuthenticating(lua_State *L)
{
    SCNetworkConnectionPPPAuthenticating(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPWaitingForCallBack(lua_State *L)
{
    SCNetworkConnectionPPPWaitingForCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPNegotiatingNetwork(lua_State *L)
{
    SCNetworkConnectionPPPNegotiatingNetwork(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPConnected(lua_State *L)
{
    SCNetworkConnectionPPPConnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPTerminating(lua_State *L)
{
    SCNetworkConnectionPPPTerminating(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPDisconnectingLink(lua_State *L)
{
    SCNetworkConnectionPPPDisconnectingLink(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPHoldingLinkOff(lua_State *L)
{
    SCNetworkConnectionPPPHoldingLinkOff(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPSuspended(lua_State *L)
{
    SCNetworkConnectionPPPSuspended(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPWaitingForRedial(lua_State *L)
{
    SCNetworkConnectionPPPWaitingForRedial(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPDisconnected(lua_State *L)
{
    SCNetworkConnectionPPPDisconnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPInitializing(lua_State *L)
{
    SCNetworkConnectionPPPInitializing(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPConnectingLink(lua_State *L)
{
    SCNetworkConnectionPPPConnectingLink(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPDialOnTraffic(lua_State *L)
{
    SCNetworkConnectionPPPDialOnTraffic(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPNegotiatingLink(lua_State *L)
{
    SCNetworkConnectionPPPNegotiatingLink(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPAuthenticating(lua_State *L)
{
    SCNetworkConnectionPPPAuthenticating(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPWaitingForCallBack(lua_State *L)
{
    SCNetworkConnectionPPPWaitingForCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPNegotiatingNetwork(lua_State *L)
{
    SCNetworkConnectionPPPNegotiatingNetwork(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPConnected(lua_State *L)
{
    SCNetworkConnectionPPPConnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPTerminating(lua_State *L)
{
    SCNetworkConnectionPPPTerminating(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPDisconnectingLink(lua_State *L)
{
    SCNetworkConnectionPPPDisconnectingLink(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPHoldingLinkOff(lua_State *L)
{
    SCNetworkConnectionPPPHoldingLinkOff(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPSuspended(lua_State *L)
{
    SCNetworkConnectionPPPSuspended(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPWaitingForRedial(lua_State *L)
{
    SCNetworkConnectionPPPWaitingForRedial(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPStatus(lua_State *L)
{
    SCNetworkConnectionPPPStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCallBack(lua_State *L)
{
    SCNetworkConnectionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCallBack(lua_State *L)
{
    SCNetworkConnectionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionStatus(lua_State *L)
{
    SCNetworkConnectionStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionBytesIn(lua_State *L)
{
    SCNetworkConnectionBytesIn(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionBytesOut(lua_State *L)
{
    SCNetworkConnectionBytesOut(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPacketsIn(lua_State *L)
{
    SCNetworkConnectionPacketsIn(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPacketsOut(lua_State *L)
{
    SCNetworkConnectionPacketsOut(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionErrorsIn(lua_State *L)
{
    SCNetworkConnectionErrorsIn(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionErrorsOut(lua_State *L)
{
    SCNetworkConnectionErrorsOut(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCopyUserPreferences(lua_State *L)
{
    SCNetworkConnectionCopyUserPreferences(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionSelectionOptionOnDemandHostName(lua_State *L)
{
    SCNetworkConnectionSelectionOptionOnDemandHostName(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionSelectionOptionOnDemandHostName(lua_State *L)
{
    SCNetworkConnectionSelectionOptionOnDemandHostName(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionSelectionOptionOnDemandRetry(lua_State *L)
{
    SCNetworkConnectionSelectionOptionOnDemandRetry(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionSelectionOptionOnDemandRetry(lua_State *L)
{
    SCNetworkConnectionSelectionOptionOnDemandRetry(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionGetTypeID(lua_State *L)
{
    SCNetworkConnectionGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionGetTypeID(lua_State *L)
{
    SCNetworkConnectionGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCopyUserPreferences(lua_State *L)
{
    SCNetworkConnectionCopyUserPreferences(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCopyUserPreferences(lua_State *L)
{
    SCNetworkConnectionCopyUserPreferences(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCreateWithServiceID(lua_State *L)
{
    SCNetworkConnectionCreateWithServiceID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionContext(lua_State *L)
{
    SCNetworkConnectionContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCreateWithServiceID(lua_State *L)
{
    SCNetworkConnectionCreateWithServiceID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCallBack(lua_State *L)
{
    SCNetworkConnectionCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionContext(lua_State *L)
{
    SCNetworkConnectionContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCopyServiceID(lua_State *L)
{
    SCNetworkConnectionCopyServiceID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCopyServiceID(lua_State *L)
{
    SCNetworkConnectionCopyServiceID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionGetStatus(lua_State *L)
{
    SCNetworkConnectionGetStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionInvalid(lua_State *L)
{
    SCNetworkConnectionInvalid(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionDisconnected(lua_State *L)
{
    SCNetworkConnectionDisconnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionConnecting(lua_State *L)
{
    SCNetworkConnectionConnecting(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionDisconnecting(lua_State *L)
{
    SCNetworkConnectionDisconnecting(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionConnected(lua_State *L)
{
    SCNetworkConnectionConnected(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionStatus(lua_State *L)
{
    SCNetworkConnectionStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionGetStatus(lua_State *L)
{
    SCNetworkConnectionGetStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCopyExtendedStatus(lua_State *L)
{
    SCNetworkConnectionCopyExtendedStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionPPPStatus(lua_State *L)
{
    SCNetworkConnectionPPPStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionIPSecStatus(lua_State *L)
{
    SCNetworkConnectionIPSecStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCopyExtendedStatus(lua_State *L)
{
    SCNetworkConnectionCopyExtendedStatus(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCopyStatistics(lua_State *L)
{
    SCNetworkConnectionCopyStatistics(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCopyStatistics(lua_State *L)
{
    SCNetworkConnectionCopyStatistics(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionStart(lua_State *L)
{
    SCNetworkConnectionStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionStart(lua_State *L)
{
    SCNetworkConnectionStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionStart(lua_State *L)
{
    SCNetworkConnectionStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionStop(lua_State *L)
{
    SCNetworkConnectionStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionStart(lua_State *L)
{
    SCNetworkConnectionStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionStop(lua_State *L)
{
    SCNetworkConnectionStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionStop(lua_State *L)
{
    SCNetworkConnectionStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCopyUserOptions(lua_State *L)
{
    SCNetworkConnectionCopyUserOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionStart(lua_State *L)
{
    SCNetworkConnectionStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionCopyUserOptions(lua_State *L)
{
    SCNetworkConnectionCopyUserOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionScheduleWithRunLoop(lua_State *L)
{
    SCNetworkConnectionScheduleWithRunLoop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionScheduleWithRunLoop(lua_State *L)
{
    SCNetworkConnectionScheduleWithRunLoop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionUnscheduleFromRunLoop(lua_State *L)
{
    SCNetworkConnectionUnscheduleFromRunLoop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionUnscheduleFromRunLoop(lua_State *L)
{
    SCNetworkConnectionUnscheduleFromRunLoop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionSetDispatchQueue(lua_State *L)
{
    SCNetworkConnectionSetDispatchQueue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionSetDispatchQueue(lua_State *L)
{
    SCNetworkConnectionSetDispatchQueue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCNetworkConnectionRef(lua_State *L)
{
    SCNetworkConnectionRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSCNetworkConnectionAPIs[] = {
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {"SCNetworkConnectionContext", lua_SCNetworkConnectionContext},
    {"SCNetworkConnectionCreateWithServiceID", lua_SCNetworkConnectionCreateWithServiceID},
    {"SCNetworkConnectionContext", lua_SCNetworkConnectionContext},
    {"SCNetworkConnectionStatus", lua_SCNetworkConnectionStatus},
    {"SCNetworkConnectionInvalid", lua_SCNetworkConnectionInvalid},
    {"SCNetworkConnectionDisconnected", lua_SCNetworkConnectionDisconnected},
    {"SCNetworkConnectionConnecting", lua_SCNetworkConnectionConnecting},
    {"SCNetworkConnectionConnected", lua_SCNetworkConnectionConnected},
    {"SCNetworkConnectionDisconnecting", lua_SCNetworkConnectionDisconnecting},
    {"SCNetworkConnectionInvalid", lua_SCNetworkConnectionInvalid},
    {"SCNetworkConnectionDisconnected", lua_SCNetworkConnectionDisconnected},
    {"SCNetworkConnectionConnecting", lua_SCNetworkConnectionConnecting},
    {"SCNetworkConnectionConnected", lua_SCNetworkConnectionConnected},
    {"SCNetworkConnectionDisconnecting", lua_SCNetworkConnectionDisconnecting},
    {"SCNetworkConnectionStatus", lua_SCNetworkConnectionStatus},
    {"SCNetworkConnectionPPPStatus", lua_SCNetworkConnectionPPPStatus},
    {"SCNetworkConnectionPPPDisconnected", lua_SCNetworkConnectionPPPDisconnected},
    {"SCNetworkConnectionPPPInitializing", lua_SCNetworkConnectionPPPInitializing},
    {"SCNetworkConnectionPPPConnectingLink", lua_SCNetworkConnectionPPPConnectingLink},
    {"SCNetworkConnectionPPPDialOnTraffic", lua_SCNetworkConnectionPPPDialOnTraffic},
    {"SCNetworkConnectionPPPNegotiatingLink", lua_SCNetworkConnectionPPPNegotiatingLink},
    {"SCNetworkConnectionPPPAuthenticating", lua_SCNetworkConnectionPPPAuthenticating},
    {"SCNetworkConnectionPPPWaitingForCallBack", lua_SCNetworkConnectionPPPWaitingForCallBack},
    {"SCNetworkConnectionPPPNegotiatingNetwork", lua_SCNetworkConnectionPPPNegotiatingNetwork},
    {"SCNetworkConnectionPPPConnected", lua_SCNetworkConnectionPPPConnected},
    {"SCNetworkConnectionPPPTerminating", lua_SCNetworkConnectionPPPTerminating},
    {"SCNetworkConnectionPPPDisconnectingLink", lua_SCNetworkConnectionPPPDisconnectingLink},
    {"SCNetworkConnectionPPPHoldingLinkOff", lua_SCNetworkConnectionPPPHoldingLinkOff},
    {"SCNetworkConnectionPPPSuspended", lua_SCNetworkConnectionPPPSuspended},
    {"SCNetworkConnectionPPPWaitingForRedial", lua_SCNetworkConnectionPPPWaitingForRedial},
    {"SCNetworkConnectionPPPDisconnected", lua_SCNetworkConnectionPPPDisconnected},
    {"SCNetworkConnectionPPPInitializing", lua_SCNetworkConnectionPPPInitializing},
    {"SCNetworkConnectionPPPConnectingLink", lua_SCNetworkConnectionPPPConnectingLink},
    {"SCNetworkConnectionPPPDialOnTraffic", lua_SCNetworkConnectionPPPDialOnTraffic},
    {"SCNetworkConnectionPPPNegotiatingLink", lua_SCNetworkConnectionPPPNegotiatingLink},
    {"SCNetworkConnectionPPPAuthenticating", lua_SCNetworkConnectionPPPAuthenticating},
    {"SCNetworkConnectionPPPWaitingForCallBack", lua_SCNetworkConnectionPPPWaitingForCallBack},
    {"SCNetworkConnectionPPPNegotiatingNetwork", lua_SCNetworkConnectionPPPNegotiatingNetwork},
    {"SCNetworkConnectionPPPConnected", lua_SCNetworkConnectionPPPConnected},
    {"SCNetworkConnectionPPPTerminating", lua_SCNetworkConnectionPPPTerminating},
    {"SCNetworkConnectionPPPDisconnectingLink", lua_SCNetworkConnectionPPPDisconnectingLink},
    {"SCNetworkConnectionPPPHoldingLinkOff", lua_SCNetworkConnectionPPPHoldingLinkOff},
    {"SCNetworkConnectionPPPSuspended", lua_SCNetworkConnectionPPPSuspended},
    {"SCNetworkConnectionPPPWaitingForRedial", lua_SCNetworkConnectionPPPWaitingForRedial},
    {"SCNetworkConnectionPPPStatus", lua_SCNetworkConnectionPPPStatus},
    {"SCNetworkConnectionCallBack", lua_SCNetworkConnectionCallBack},
    {"SCNetworkConnectionCallBack", lua_SCNetworkConnectionCallBack},
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {"SCNetworkConnectionStatus", lua_SCNetworkConnectionStatus},
    {"SCNetworkConnectionBytesIn", lua_SCNetworkConnectionBytesIn},
    {"SCNetworkConnectionBytesOut", lua_SCNetworkConnectionBytesOut},
    {"SCNetworkConnectionPacketsIn", lua_SCNetworkConnectionPacketsIn},
    {"SCNetworkConnectionPacketsOut", lua_SCNetworkConnectionPacketsOut},
    {"SCNetworkConnectionErrorsIn", lua_SCNetworkConnectionErrorsIn},
    {"SCNetworkConnectionErrorsOut", lua_SCNetworkConnectionErrorsOut},
    {"SCNetworkConnectionCopyUserPreferences", lua_SCNetworkConnectionCopyUserPreferences},
    {"SCNetworkConnectionSelectionOptionOnDemandHostName", lua_SCNetworkConnectionSelectionOptionOnDemandHostName},
    {"SCNetworkConnectionSelectionOptionOnDemandHostName", lua_SCNetworkConnectionSelectionOptionOnDemandHostName},
    {"SCNetworkConnectionSelectionOptionOnDemandRetry", lua_SCNetworkConnectionSelectionOptionOnDemandRetry},
    {"SCNetworkConnectionSelectionOptionOnDemandRetry", lua_SCNetworkConnectionSelectionOptionOnDemandRetry},
    {"SCNetworkConnectionGetTypeID", lua_SCNetworkConnectionGetTypeID},
    {"SCNetworkConnectionGetTypeID", lua_SCNetworkConnectionGetTypeID},
    {"SCNetworkConnectionCopyUserPreferences", lua_SCNetworkConnectionCopyUserPreferences},
    {"SCNetworkConnectionCopyUserPreferences", lua_SCNetworkConnectionCopyUserPreferences},
    {"SCNetworkConnectionCreateWithServiceID", lua_SCNetworkConnectionCreateWithServiceID},
    {"SCNetworkConnectionContext", lua_SCNetworkConnectionContext},
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {"SCNetworkConnectionCreateWithServiceID", lua_SCNetworkConnectionCreateWithServiceID},
    {"SCNetworkConnectionCallBack", lua_SCNetworkConnectionCallBack},
    {"SCNetworkConnectionContext", lua_SCNetworkConnectionContext},
    {"SCNetworkConnectionCopyServiceID", lua_SCNetworkConnectionCopyServiceID},
    {"SCNetworkConnectionCopyServiceID", lua_SCNetworkConnectionCopyServiceID},
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {"SCNetworkConnectionGetStatus", lua_SCNetworkConnectionGetStatus},
    {"SCNetworkConnectionInvalid", lua_SCNetworkConnectionInvalid},
    {"SCNetworkConnectionDisconnected", lua_SCNetworkConnectionDisconnected},
    {"SCNetworkConnectionConnecting", lua_SCNetworkConnectionConnecting},
    {"SCNetworkConnectionDisconnecting", lua_SCNetworkConnectionDisconnecting},
    {"SCNetworkConnectionConnected", lua_SCNetworkConnectionConnected},
    {"SCNetworkConnectionStatus", lua_SCNetworkConnectionStatus},
    {"SCNetworkConnectionGetStatus", lua_SCNetworkConnectionGetStatus},
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {"SCNetworkConnectionCopyExtendedStatus", lua_SCNetworkConnectionCopyExtendedStatus},
    {"SCNetworkConnectionPPPStatus", lua_SCNetworkConnectionPPPStatus},
    {"SCNetworkConnectionIPSecStatus", lua_SCNetworkConnectionIPSecStatus},
    {"SCNetworkConnectionCopyExtendedStatus", lua_SCNetworkConnectionCopyExtendedStatus},
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {"SCNetworkConnectionCopyStatistics", lua_SCNetworkConnectionCopyStatistics},
    {"SCNetworkConnectionCopyStatistics", lua_SCNetworkConnectionCopyStatistics},
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {"SCNetworkConnectionStart", lua_SCNetworkConnectionStart},
    {"SCNetworkConnectionStart", lua_SCNetworkConnectionStart},
    {"SCNetworkConnectionStart", lua_SCNetworkConnectionStart},
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {"SCNetworkConnectionStop", lua_SCNetworkConnectionStop},
    {"SCNetworkConnectionStart", lua_SCNetworkConnectionStart},
    {"SCNetworkConnectionStop", lua_SCNetworkConnectionStop},
    {"SCNetworkConnectionStop", lua_SCNetworkConnectionStop},
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {"SCNetworkConnectionCopyUserOptions", lua_SCNetworkConnectionCopyUserOptions},
    {"SCNetworkConnectionStart", lua_SCNetworkConnectionStart},
    {"SCNetworkConnectionCopyUserOptions", lua_SCNetworkConnectionCopyUserOptions},
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {"SCNetworkConnectionScheduleWithRunLoop", lua_SCNetworkConnectionScheduleWithRunLoop},
    {"SCNetworkConnectionScheduleWithRunLoop", lua_SCNetworkConnectionScheduleWithRunLoop},
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {"SCNetworkConnectionUnscheduleFromRunLoop", lua_SCNetworkConnectionUnscheduleFromRunLoop},
    {"SCNetworkConnectionUnscheduleFromRunLoop", lua_SCNetworkConnectionUnscheduleFromRunLoop},
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {"SCNetworkConnectionSetDispatchQueue", lua_SCNetworkConnectionSetDispatchQueue},
    {"SCNetworkConnectionSetDispatchQueue", lua_SCNetworkConnectionSetDispatchQueue},
    {"SCNetworkConnectionRef", lua_SCNetworkConnectionRef},
    {NULL, NULL},
};

int LuaOpenSCNetworkConnection(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSCNetworkConnectionAPIs);
    return 0;
}
