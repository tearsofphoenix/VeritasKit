//
//  LuaCFRunLoop.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFRunLoop.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFRunLoopRef(lua_State *L)
{
    CFRunLoopRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopSource(lua_State *L)
{
    CFRunLoopSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopObserver(lua_State *L)
{
    CFRunLoopObserver(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimer(lua_State *L)
{
    CFRunLoopTimer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRunInMode(lua_State *L)
{
    CFRunLoopRunInMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRunFinished(lua_State *L)
{
    CFRunLoopRunFinished(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRunStopped(lua_State *L)
{
    CFRunLoopRunStopped(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRunTimedOut(lua_State *L)
{
    CFRunLoopRunTimedOut(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRunHandledSource(lua_State *L)
{
    CFRunLoopRunHandledSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopEntry(lua_State *L)
{
    CFRunLoopEntry(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopBeforeTimers(lua_State *L)
{
    CFRunLoopBeforeTimers(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopBeforeSources(lua_State *L)
{
    CFRunLoopBeforeSources(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopBeforeWaiting(lua_State *L)
{
    CFRunLoopBeforeWaiting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopAfterWaiting(lua_State *L)
{
    CFRunLoopAfterWaiting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopExit(lua_State *L)
{
    CFRunLoopExit(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopAllActivities(lua_State *L)
{
    CFRunLoopAllActivities(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopActivity(lua_State *L)
{
    CFRunLoopActivity(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopDefaultMode(lua_State *L)
{
    CFRunLoopDefaultMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopCommonModes(lua_State *L)
{
    CFRunLoopCommonModes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopGetTypeID(lua_State *L)
{
    CFRunLoopGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRef(lua_State *L)
{
    CFRunLoopRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRef(lua_State *L)
{
    CFRunLoopRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopCopyCurrentMode(lua_State *L)
{
    CFRunLoopCopyCurrentMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopCopyAllModes(lua_State *L)
{
    CFRunLoopCopyAllModes(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopAddCommonMode(lua_State *L)
{
    CFRunLoopAddCommonMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopGetNextTimerFireDate(lua_State *L)
{
    CFRunLoopGetNextTimerFireDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRun(lua_State *L)
{
    CFRunLoopRun(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRunInMode(lua_State *L)
{
    CFRunLoopRunInMode(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopIsWaiting(lua_State *L)
{
    CFRunLoopIsWaiting(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopWakeUp(lua_State *L)
{
    CFRunLoopWakeUp(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopStop(lua_State *L)
{
    CFRunLoopStop(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopPerformBlock(lua_State *L)
{
    CFRunLoopPerformBlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopContainsSource(lua_State *L)
{
    CFRunLoopContainsSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopAddSource(lua_State *L)
{
    CFRunLoopAddSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRemoveSource(lua_State *L)
{
    CFRunLoopRemoveSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopContainsObserver(lua_State *L)
{
    CFRunLoopContainsObserver(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopAddObserver(lua_State *L)
{
    CFRunLoopAddObserver(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRemoveObserver(lua_State *L)
{
    CFRunLoopRemoveObserver(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopContainsTimer(lua_State *L)
{
    CFRunLoopContainsTimer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopAddTimer(lua_State *L)
{
    CFRunLoopAddTimer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRemoveTimer(lua_State *L)
{
    CFRunLoopRemoveTimer(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRef(lua_State *L)
{
    CFRunLoopRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopRef(lua_State *L)
{
    CFRunLoopRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopSourceContext(lua_State *L)
{
    CFRunLoopSourceContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopSourceContext1(lua_State *L)
{
    CFRunLoopSourceContext1(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopSourceGetTypeID(lua_State *L)
{
    CFRunLoopSourceGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopSourceRef(lua_State *L)
{
    CFRunLoopSourceRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopSourceGetOrder(lua_State *L)
{
    CFRunLoopSourceGetOrder(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopSourceInvalidate(lua_State *L)
{
    CFRunLoopSourceInvalidate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopSourceIsValid(lua_State *L)
{
    CFRunLoopSourceIsValid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopSourceGetContext(lua_State *L)
{
    CFRunLoopSourceGetContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopSourceSignal(lua_State *L)
{
    CFRunLoopSourceSignal(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopObserverContext(lua_State *L)
{
    CFRunLoopObserverContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopObserverCallBack(lua_State *L)
{
    CFRunLoopObserverCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopObserverGetTypeID(lua_State *L)
{
    CFRunLoopObserverGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopObserverRef(lua_State *L)
{
    CFRunLoopObserverRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopObserverRef(lua_State *L)
{
    CFRunLoopObserverRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopObserverGetActivities(lua_State *L)
{
    CFRunLoopObserverGetActivities(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopObserverDoesRepeat(lua_State *L)
{
    CFRunLoopObserverDoesRepeat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopObserverGetOrder(lua_State *L)
{
    CFRunLoopObserverGetOrder(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopObserverInvalidate(lua_State *L)
{
    CFRunLoopObserverInvalidate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopObserverIsValid(lua_State *L)
{
    CFRunLoopObserverIsValid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopObserverGetContext(lua_State *L)
{
    CFRunLoopObserverGetContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimerContext(lua_State *L)
{
    CFRunLoopTimerContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimerCallBack(lua_State *L)
{
    CFRunLoopTimerCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimerGetTypeID(lua_State *L)
{
    CFRunLoopTimerGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimerRef(lua_State *L)
{
    CFRunLoopTimerRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimerRef(lua_State *L)
{
    CFRunLoopTimerRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimerGetNextFireDate(lua_State *L)
{
    CFRunLoopTimerGetNextFireDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimerSetNextFireDate(lua_State *L)
{
    CFRunLoopTimerSetNextFireDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimerGetInterval(lua_State *L)
{
    CFRunLoopTimerGetInterval(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimerDoesRepeat(lua_State *L)
{
    CFRunLoopTimerDoesRepeat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimerGetOrder(lua_State *L)
{
    CFRunLoopTimerGetOrder(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimerInvalidate(lua_State *L)
{
    CFRunLoopTimerInvalidate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimerIsValid(lua_State *L)
{
    CFRunLoopTimerIsValid(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFRunLoopTimerGetContext(lua_State *L)
{
    CFRunLoopTimerGetContext(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFRunLoopAPIs[] = {
    {"CFRunLoopRef", lua_CFRunLoopRef},
    {"CFRunLoopSource", lua_CFRunLoopSource},
    {"CFRunLoopObserver", lua_CFRunLoopObserver},
    {"CFRunLoopTimer", lua_CFRunLoopTimer},
    {"CFRunLoopRunInMode", lua_CFRunLoopRunInMode},
    {"CFRunLoopRunFinished", lua_CFRunLoopRunFinished},
    {"CFRunLoopRunStopped", lua_CFRunLoopRunStopped},
    {"CFRunLoopRunTimedOut", lua_CFRunLoopRunTimedOut},
    {"CFRunLoopRunHandledSource", lua_CFRunLoopRunHandledSource},
    {"CFRunLoopEntry", lua_CFRunLoopEntry},
    {"CFRunLoopBeforeTimers", lua_CFRunLoopBeforeTimers},
    {"CFRunLoopBeforeSources", lua_CFRunLoopBeforeSources},
    {"CFRunLoopBeforeWaiting", lua_CFRunLoopBeforeWaiting},
    {"CFRunLoopAfterWaiting", lua_CFRunLoopAfterWaiting},
    {"CFRunLoopExit", lua_CFRunLoopExit},
    {"CFRunLoopAllActivities", lua_CFRunLoopAllActivities},
    {"CFRunLoopActivity", lua_CFRunLoopActivity},
    {"CFRunLoopDefaultMode", lua_CFRunLoopDefaultMode},
    {"CFRunLoopCommonModes", lua_CFRunLoopCommonModes},
    {"CFRunLoopGetTypeID", lua_CFRunLoopGetTypeID},
    {"CFRunLoopRef", lua_CFRunLoopRef},
    {"CFRunLoopRef", lua_CFRunLoopRef},
    {"CFRunLoopCopyCurrentMode", lua_CFRunLoopCopyCurrentMode},
    {"CFRunLoopCopyAllModes", lua_CFRunLoopCopyAllModes},
    {"CFRunLoopAddCommonMode", lua_CFRunLoopAddCommonMode},
    {"CFRunLoopGetNextTimerFireDate", lua_CFRunLoopGetNextTimerFireDate},
    {"CFRunLoopRun", lua_CFRunLoopRun},
    {"CFRunLoopRunInMode", lua_CFRunLoopRunInMode},
    {"CFRunLoopIsWaiting", lua_CFRunLoopIsWaiting},
    {"CFRunLoopWakeUp", lua_CFRunLoopWakeUp},
    {"CFRunLoopStop", lua_CFRunLoopStop},
    {"CFRunLoopPerformBlock", lua_CFRunLoopPerformBlock},
    {"CFRunLoopContainsSource", lua_CFRunLoopContainsSource},
    {"CFRunLoopAddSource", lua_CFRunLoopAddSource},
    {"CFRunLoopRemoveSource", lua_CFRunLoopRemoveSource},
    {"CFRunLoopContainsObserver", lua_CFRunLoopContainsObserver},
    {"CFRunLoopAddObserver", lua_CFRunLoopAddObserver},
    {"CFRunLoopRemoveObserver", lua_CFRunLoopRemoveObserver},
    {"CFRunLoopContainsTimer", lua_CFRunLoopContainsTimer},
    {"CFRunLoopAddTimer", lua_CFRunLoopAddTimer},
    {"CFRunLoopRemoveTimer", lua_CFRunLoopRemoveTimer},
    {"CFRunLoopRef", lua_CFRunLoopRef},
    {"CFRunLoopRef", lua_CFRunLoopRef},
    {"CFRunLoopSourceContext", lua_CFRunLoopSourceContext},
    {"CFRunLoopSourceContext1", lua_CFRunLoopSourceContext1},
    {"CFRunLoopSourceGetTypeID", lua_CFRunLoopSourceGetTypeID},
    {"CFRunLoopSourceRef", lua_CFRunLoopSourceRef},
    {"CFRunLoopSourceGetOrder", lua_CFRunLoopSourceGetOrder},
    {"CFRunLoopSourceInvalidate", lua_CFRunLoopSourceInvalidate},
    {"CFRunLoopSourceIsValid", lua_CFRunLoopSourceIsValid},
    {"CFRunLoopSourceGetContext", lua_CFRunLoopSourceGetContext},
    {"CFRunLoopSourceSignal", lua_CFRunLoopSourceSignal},
    {"CFRunLoopObserverContext", lua_CFRunLoopObserverContext},
    {"CFRunLoopObserverCallBack", lua_CFRunLoopObserverCallBack},
    {"CFRunLoopObserverGetTypeID", lua_CFRunLoopObserverGetTypeID},
    {"CFRunLoopObserverRef", lua_CFRunLoopObserverRef},
    {"CFRunLoopObserverRef", lua_CFRunLoopObserverRef},
    {"CFRunLoopObserverGetActivities", lua_CFRunLoopObserverGetActivities},
    {"CFRunLoopObserverDoesRepeat", lua_CFRunLoopObserverDoesRepeat},
    {"CFRunLoopObserverGetOrder", lua_CFRunLoopObserverGetOrder},
    {"CFRunLoopObserverInvalidate", lua_CFRunLoopObserverInvalidate},
    {"CFRunLoopObserverIsValid", lua_CFRunLoopObserverIsValid},
    {"CFRunLoopObserverGetContext", lua_CFRunLoopObserverGetContext},
    {"CFRunLoopTimerContext", lua_CFRunLoopTimerContext},
    {"CFRunLoopTimerCallBack", lua_CFRunLoopTimerCallBack},
    {"CFRunLoopTimerGetTypeID", lua_CFRunLoopTimerGetTypeID},
    {"CFRunLoopTimerRef", lua_CFRunLoopTimerRef},
    {"CFRunLoopTimerRef", lua_CFRunLoopTimerRef},
    {"CFRunLoopTimerGetNextFireDate", lua_CFRunLoopTimerGetNextFireDate},
    {"CFRunLoopTimerSetNextFireDate", lua_CFRunLoopTimerSetNextFireDate},
    {"CFRunLoopTimerGetInterval", lua_CFRunLoopTimerGetInterval},
    {"CFRunLoopTimerDoesRepeat", lua_CFRunLoopTimerDoesRepeat},
    {"CFRunLoopTimerGetOrder", lua_CFRunLoopTimerGetOrder},
    {"CFRunLoopTimerInvalidate", lua_CFRunLoopTimerInvalidate},
    {"CFRunLoopTimerIsValid", lua_CFRunLoopTimerIsValid},
    {"CFRunLoopTimerGetContext", lua_CFRunLoopTimerGetContext},
    {NULL, NULL},
};

int LuaOpenCFRunLoop(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFRunLoopAPIs);
    return 0;
}
