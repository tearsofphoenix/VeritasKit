//
//  LuaAUGraph.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAUGraph.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AUGraphOpen(lua_State *L)
{
    AUGraphOpen(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphErr_NodeNotFound(lua_State *L)
{
    AUGraphErr_NodeNotFound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphErr_InvalidConnection(lua_State *L)
{
    AUGraphErr_InvalidConnection(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphErr_OutputNodeErr(lua_State *L)
{
    AUGraphErr_OutputNodeErr(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphs(lua_State *L)
{
    AUGraphs(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphErr_CannotDoInCurrentContext(lua_State *L)
{
    AUGraphErr_CannotDoInCurrentContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphErr_CannotDoInCurrentContext(lua_State *L)
{
    AUGraphErr_CannotDoInCurrentContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphErr_InvalidAudioUnit(lua_State *L)
{
    AUGraphErr_InvalidAudioUnit(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphErr_NodeNotFound(lua_State *L)
{
    AUGraphErr_NodeNotFound(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphErr_InvalidConnection(lua_State *L)
{
    AUGraphErr_InvalidConnection(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphErr_OutputNodeErr(lua_State *L)
{
    AUGraphErr_OutputNodeErr(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphErr_CannotDoInCurrentContext(lua_State *L)
{
    AUGraphErr_CannotDoInCurrentContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphErr_InvalidAudioUnit(lua_State *L)
{
    AUGraphErr_InvalidAudioUnit(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphAddNode(lua_State *L)
{
    AUGraphAddNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphAddNode(lua_State *L)
{
    AUGraphAddNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphRemoveNode(lua_State *L)
{
    AUGraphRemoveNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphRemoveNode(lua_State *L)
{
    AUGraphRemoveNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNodeCount(lua_State *L)
{
    AUGraphGetNodeCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNodeCount(lua_State *L)
{
    AUGraphGetNodeCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetIndNode(lua_State *L)
{
    AUGraphGetIndNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNodeCount(lua_State *L)
{
    AUGraphGetNodeCount(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetIndNode(lua_State *L)
{
    AUGraphGetIndNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphNodeInfo(lua_State *L)
{
    AUGraphNodeInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphNodeInfo(lua_State *L)
{
    AUGraphNodeInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphNewNodeSubGraph(lua_State *L)
{
    AUGraphNewNodeSubGraph(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphNewNodeSubGraph(lua_State *L)
{
    AUGraphNewNodeSubGraph(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNodeInfoSubGraph(lua_State *L)
{
    AUGraphGetNodeInfoSubGraph(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNodeInfoSubGraph(lua_State *L)
{
    AUGraphGetNodeInfoSubGraph(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphIsNodeSubGraph(lua_State *L)
{
    AUGraphIsNodeSubGraph(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphIsNodeSubGraph(lua_State *L)
{
    AUGraphIsNodeSubGraph(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphConnectNodeInput(lua_State *L)
{
    AUGraphConnectNodeInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphConnectNodeInput(lua_State *L)
{
    AUGraphConnectNodeInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphSetNodeInputCallback(lua_State *L)
{
    AUGraphSetNodeInputCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphSetNodeInputCallback(lua_State *L)
{
    AUGraphSetNodeInputCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphDisconnectNodeInput(lua_State *L)
{
    AUGraphDisconnectNodeInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphDisconnectNodeInput(lua_State *L)
{
    AUGraphDisconnectNodeInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphClearConnections(lua_State *L)
{
    AUGraphClearConnections(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphClearConnections(lua_State *L)
{
    AUGraphClearConnections(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNumberOfInteractions(lua_State *L)
{
    AUGraphGetNumberOfInteractions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNumberOfInteractions(lua_State *L)
{
    AUGraphGetNumberOfInteractions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetInteractionInfo(lua_State *L)
{
    AUGraphGetInteractionInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetInteractionInfo(lua_State *L)
{
    AUGraphGetInteractionInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetInteractionInfo(lua_State *L)
{
    AUGraphGetInteractionInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphCountNodeInteractions(lua_State *L)
{
    AUGraphCountNodeInteractions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNodeInteractions(lua_State *L)
{
    AUGraphGetNodeInteractions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNodeInteractions(lua_State *L)
{
    AUGraphGetNodeInteractions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphUpdate(lua_State *L)
{
    AUGraphUpdate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphConnectNodeInput(lua_State *L)
{
    AUGraphConnectNodeInput(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphUpdate(lua_State *L)
{
    AUGraphUpdate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphRenderNotification(lua_State *L)
{
    AUGraphRenderNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphErr_CannotDoInCurrentContext(lua_State *L)
{
    AUGraphErr_CannotDoInCurrentContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphUpdate(lua_State *L)
{
    AUGraphUpdate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphUpdate(lua_State *L)
{
    AUGraphUpdate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphUpdate(lua_State *L)
{
    AUGraphUpdate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphUpdate(lua_State *L)
{
    AUGraphUpdate(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphOpen(lua_State *L)
{
    AUGraphOpen(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphOpen(lua_State *L)
{
    AUGraphOpen(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphClose(lua_State *L)
{
    AUGraphClose(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphClose(lua_State *L)
{
    AUGraphClose(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphInitialize(lua_State *L)
{
    AUGraphInitialize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphInitialize(lua_State *L)
{
    AUGraphInitialize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphUninitialize(lua_State *L)
{
    AUGraphUninitialize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphUninitialize(lua_State *L)
{
    AUGraphUninitialize(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphStart(lua_State *L)
{
    AUGraphStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphStart(lua_State *L)
{
    AUGraphStart(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphStop(lua_State *L)
{
    AUGraphStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphStop(lua_State *L)
{
    AUGraphStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphIsOpen(lua_State *L)
{
    AUGraphIsOpen(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphIsOpen(lua_State *L)
{
    AUGraphIsOpen(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphIsInitialized(lua_State *L)
{
    AUGraphIsInitialized(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphIsInitialized(lua_State *L)
{
    AUGraphIsInitialized(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphIsRunning(lua_State *L)
{
    AUGraphIsRunning(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphIsRunning(lua_State *L)
{
    AUGraphIsRunning(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetCPULoad(lua_State *L)
{
    AUGraphGetCPULoad(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetCPULoad(lua_State *L)
{
    AUGraphGetCPULoad(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetMaxCPULoad(lua_State *L)
{
    AUGraphGetMaxCPULoad(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetMaxCPULoad(lua_State *L)
{
    AUGraphGetMaxCPULoad(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphAddRenderNotify(lua_State *L)
{
    AUGraphAddRenderNotify(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphAddRenderNotify(lua_State *L)
{
    AUGraphAddRenderNotify(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphRemoveRenderNotify(lua_State *L)
{
    AUGraphRemoveRenderNotify(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphRemoveRenderNotify(lua_State *L)
{
    AUGraphRemoveRenderNotify(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphNewNode(lua_State *L)
{
    AUGraphNewNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphAddNode(lua_State *L)
{
    AUGraphAddNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphNewNode(lua_State *L)
{
    AUGraphNewNode(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNodeInfo(lua_State *L)
{
    AUGraphGetNodeInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphNodeInfo(lua_State *L)
{
    AUGraphNodeInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNodeInfo(lua_State *L)
{
    AUGraphGetNodeInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNumberOfConnections(lua_State *L)
{
    AUGraphGetNumberOfConnections(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNumberOfInteractions(lua_State *L)
{
    AUGraphGetNumberOfInteractions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNumberOfConnections(lua_State *L)
{
    AUGraphGetNumberOfConnections(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetConnectionInfo(lua_State *L)
{
    AUGraphGetConnectionInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetInteractionInfo(lua_State *L)
{
    AUGraphGetInteractionInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetConnectionInfo(lua_State *L)
{
    AUGraphGetConnectionInfo(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphCountNodeConnections(lua_State *L)
{
    AUGraphCountNodeConnections(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphCountNodeInteractions(lua_State *L)
{
    AUGraphCountNodeInteractions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphCountNodeConnections(lua_State *L)
{
    AUGraphCountNodeConnections(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNodeConnections(lua_State *L)
{
    AUGraphGetNodeConnections(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNodeInteractions(lua_State *L)
{
    AUGraphGetNodeInteractions(lua_touserdata(L, 1));
    return 1;
}

static int lua_AUGraphGetNodeConnections(lua_State *L)
{
    AUGraphGetNodeConnections(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAUGraphAPIs[] = {
    {"AUGraphOpen", lua_AUGraphOpen},
    {"AUGraphErr_NodeNotFound", lua_AUGraphErr_NodeNotFound},
    {"AUGraphErr_InvalidConnection", lua_AUGraphErr_InvalidConnection},
    {"AUGraphErr_OutputNodeErr", lua_AUGraphErr_OutputNodeErr},
    {"AUGraphs", lua_AUGraphs},
    {"AUGraphErr_CannotDoInCurrentContext", lua_AUGraphErr_CannotDoInCurrentContext},
    {"AUGraphErr_CannotDoInCurrentContext", lua_AUGraphErr_CannotDoInCurrentContext},
    {"AUGraphErr_InvalidAudioUnit", lua_AUGraphErr_InvalidAudioUnit},
    {"AUGraphErr_NodeNotFound", lua_AUGraphErr_NodeNotFound},
    {"AUGraphErr_InvalidConnection", lua_AUGraphErr_InvalidConnection},
    {"AUGraphErr_OutputNodeErr", lua_AUGraphErr_OutputNodeErr},
    {"AUGraphErr_CannotDoInCurrentContext", lua_AUGraphErr_CannotDoInCurrentContext},
    {"AUGraphErr_InvalidAudioUnit", lua_AUGraphErr_InvalidAudioUnit},
    {"AUGraphAddNode", lua_AUGraphAddNode},
    {"AUGraphAddNode", lua_AUGraphAddNode},
    {"AUGraphRemoveNode", lua_AUGraphRemoveNode},
    {"AUGraphRemoveNode", lua_AUGraphRemoveNode},
    {"AUGraphGetNodeCount", lua_AUGraphGetNodeCount},
    {"AUGraphGetNodeCount", lua_AUGraphGetNodeCount},
    {"AUGraphGetIndNode", lua_AUGraphGetIndNode},
    {"AUGraphGetNodeCount", lua_AUGraphGetNodeCount},
    {"AUGraphGetIndNode", lua_AUGraphGetIndNode},
    {"AUGraphNodeInfo", lua_AUGraphNodeInfo},
    {"AUGraphNodeInfo", lua_AUGraphNodeInfo},
    {"AUGraphNewNodeSubGraph", lua_AUGraphNewNodeSubGraph},
    {"AUGraphNewNodeSubGraph", lua_AUGraphNewNodeSubGraph},
    {"AUGraphGetNodeInfoSubGraph", lua_AUGraphGetNodeInfoSubGraph},
    {"AUGraphGetNodeInfoSubGraph", lua_AUGraphGetNodeInfoSubGraph},
    {"AUGraphIsNodeSubGraph", lua_AUGraphIsNodeSubGraph},
    {"AUGraphIsNodeSubGraph", lua_AUGraphIsNodeSubGraph},
    {"AUGraphConnectNodeInput", lua_AUGraphConnectNodeInput},
    {"AUGraphConnectNodeInput", lua_AUGraphConnectNodeInput},
    {"AUGraphSetNodeInputCallback", lua_AUGraphSetNodeInputCallback},
    {"AUGraphSetNodeInputCallback", lua_AUGraphSetNodeInputCallback},
    {"AUGraphDisconnectNodeInput", lua_AUGraphDisconnectNodeInput},
    {"AUGraphDisconnectNodeInput", lua_AUGraphDisconnectNodeInput},
    {"AUGraphClearConnections", lua_AUGraphClearConnections},
    {"AUGraphClearConnections", lua_AUGraphClearConnections},
    {"AUGraphGetNumberOfInteractions", lua_AUGraphGetNumberOfInteractions},
    {"AUGraphGetNumberOfInteractions", lua_AUGraphGetNumberOfInteractions},
    {"AUGraphGetInteractionInfo", lua_AUGraphGetInteractionInfo},
    {"AUGraphGetInteractionInfo", lua_AUGraphGetInteractionInfo},
    {"AUGraphGetInteractionInfo", lua_AUGraphGetInteractionInfo},
    {"AUGraphCountNodeInteractions", lua_AUGraphCountNodeInteractions},
    {"AUGraphGetNodeInteractions", lua_AUGraphGetNodeInteractions},
    {"AUGraphGetNodeInteractions", lua_AUGraphGetNodeInteractions},
    {"AUGraphUpdate", lua_AUGraphUpdate},
    {"AUGraphConnectNodeInput", lua_AUGraphConnectNodeInput},
    {"AUGraphUpdate", lua_AUGraphUpdate},
    {"AUGraphRenderNotification", lua_AUGraphRenderNotification},
    {"AUGraphErr_CannotDoInCurrentContext", lua_AUGraphErr_CannotDoInCurrentContext},
    {"AUGraphUpdate", lua_AUGraphUpdate},
    {"AUGraphUpdate", lua_AUGraphUpdate},
    {"AUGraphUpdate", lua_AUGraphUpdate},
    {"AUGraphUpdate", lua_AUGraphUpdate},
    {"AUGraphOpen", lua_AUGraphOpen},
    {"AUGraphOpen", lua_AUGraphOpen},
    {"AUGraphClose", lua_AUGraphClose},
    {"AUGraphClose", lua_AUGraphClose},
    {"AUGraphInitialize", lua_AUGraphInitialize},
    {"AUGraphInitialize", lua_AUGraphInitialize},
    {"AUGraphUninitialize", lua_AUGraphUninitialize},
    {"AUGraphUninitialize", lua_AUGraphUninitialize},
    {"AUGraphStart", lua_AUGraphStart},
    {"AUGraphStart", lua_AUGraphStart},
    {"AUGraphStop", lua_AUGraphStop},
    {"AUGraphStop", lua_AUGraphStop},
    {"AUGraphIsOpen", lua_AUGraphIsOpen},
    {"AUGraphIsOpen", lua_AUGraphIsOpen},
    {"AUGraphIsInitialized", lua_AUGraphIsInitialized},
    {"AUGraphIsInitialized", lua_AUGraphIsInitialized},
    {"AUGraphIsRunning", lua_AUGraphIsRunning},
    {"AUGraphIsRunning", lua_AUGraphIsRunning},
    {"AUGraphGetCPULoad", lua_AUGraphGetCPULoad},
    {"AUGraphGetCPULoad", lua_AUGraphGetCPULoad},
    {"AUGraphGetMaxCPULoad", lua_AUGraphGetMaxCPULoad},
    {"AUGraphGetMaxCPULoad", lua_AUGraphGetMaxCPULoad},
    {"AUGraphAddRenderNotify", lua_AUGraphAddRenderNotify},
    {"AUGraphAddRenderNotify", lua_AUGraphAddRenderNotify},
    {"AUGraphRemoveRenderNotify", lua_AUGraphRemoveRenderNotify},
    {"AUGraphRemoveRenderNotify", lua_AUGraphRemoveRenderNotify},
    {"AUGraphNewNode", lua_AUGraphNewNode},
    {"AUGraphAddNode", lua_AUGraphAddNode},
    {"AUGraphNewNode", lua_AUGraphNewNode},
    {"AUGraphGetNodeInfo", lua_AUGraphGetNodeInfo},
    {"AUGraphNodeInfo", lua_AUGraphNodeInfo},
    {"AUGraphGetNodeInfo", lua_AUGraphGetNodeInfo},
    {"AUGraphGetNumberOfConnections", lua_AUGraphGetNumberOfConnections},
    {"AUGraphGetNumberOfInteractions", lua_AUGraphGetNumberOfInteractions},
    {"AUGraphGetNumberOfConnections", lua_AUGraphGetNumberOfConnections},
    {"AUGraphGetConnectionInfo", lua_AUGraphGetConnectionInfo},
    {"AUGraphGetInteractionInfo", lua_AUGraphGetInteractionInfo},
    {"AUGraphGetConnectionInfo", lua_AUGraphGetConnectionInfo},
    {"AUGraphCountNodeConnections", lua_AUGraphCountNodeConnections},
    {"AUGraphCountNodeInteractions", lua_AUGraphCountNodeInteractions},
    {"AUGraphCountNodeConnections", lua_AUGraphCountNodeConnections},
    {"AUGraphGetNodeConnections", lua_AUGraphGetNodeConnections},
    {"AUGraphGetNodeInteractions", lua_AUGraphGetNodeInteractions},
    {"AUGraphGetNodeConnections", lua_AUGraphGetNodeConnections},
    {NULL, NULL},
};

int LuaOpenAUGraph(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAUGraphAPIs);
    return 0;
}
