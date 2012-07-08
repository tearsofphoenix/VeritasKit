//
//  LuaSCPreferences.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSCPreferences.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SCPreferencesCreate(lua_State *L)
{
    SCPreferencesCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesNotification(lua_State *L)
{
    SCPreferencesNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCallBack(lua_State *L)
{
    SCPreferencesCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesNotificationCommit(lua_State *L)
{
    SCPreferencesNotificationCommit(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesNotificationApply(lua_State *L)
{
    SCPreferencesNotificationApply(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesNotificationCommit(lua_State *L)
{
    SCPreferencesNotificationCommit(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesNotificationApply(lua_State *L)
{
    SCPreferencesNotificationApply(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesNotification(lua_State *L)
{
    SCPreferencesNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesContext(lua_State *L)
{
    SCPreferencesContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesSetCallback(lua_State *L)
{
    SCPreferencesSetCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesContext(lua_State *L)
{
    SCPreferencesContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCallBack(lua_State *L)
{
    SCPreferencesCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCallBack(lua_State *L)
{
    SCPreferencesCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesNotification(lua_State *L)
{
    SCPreferencesNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesGetTypeID(lua_State *L)
{
    SCPreferencesGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesGetTypeID(lua_State *L)
{
    SCPreferencesGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCreate(lua_State *L)
{
    SCPreferencesCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCreate(lua_State *L)
{
    SCPreferencesCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCreateWithAuthorization(lua_State *L)
{
    SCPreferencesCreateWithAuthorization(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCreateWithAuthorization(lua_State *L)
{
    SCPreferencesCreateWithAuthorization(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesLock(lua_State *L)
{
    SCPreferencesLock(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesLock(lua_State *L)
{
    SCPreferencesLock(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCommitChanges(lua_State *L)
{
    SCPreferencesCommitChanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesLock(lua_State *L)
{
    SCPreferencesLock(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesApplyChanges(lua_State *L)
{
    SCPreferencesApplyChanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCommitChanges(lua_State *L)
{
    SCPreferencesCommitChanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesApplyChanges(lua_State *L)
{
    SCPreferencesApplyChanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesApplyChanges(lua_State *L)
{
    SCPreferencesApplyChanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesUnlock(lua_State *L)
{
    SCPreferencesUnlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesUnlock(lua_State *L)
{
    SCPreferencesUnlock(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesGetSignature(lua_State *L)
{
    SCPreferencesGetSignature(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCreate(lua_State *L)
{
    SCPreferencesCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesGetSignature(lua_State *L)
{
    SCPreferencesGetSignature(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCopyKeyList(lua_State *L)
{
    SCPreferencesCopyKeyList(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCopyKeyList(lua_State *L)
{
    SCPreferencesCopyKeyList(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesGetValue(lua_State *L)
{
    SCPreferencesGetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesLock(lua_State *L)
{
    SCPreferencesLock(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesGetValue(lua_State *L)
{
    SCPreferencesGetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesAddValue(lua_State *L)
{
    SCPreferencesAddValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCommitChanges(lua_State *L)
{
    SCPreferencesCommitChanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesAddValue(lua_State *L)
{
    SCPreferencesAddValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesSetValue(lua_State *L)
{
    SCPreferencesSetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCommitChanges(lua_State *L)
{
    SCPreferencesCommitChanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesSetValue(lua_State *L)
{
    SCPreferencesSetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRemoveValue(lua_State *L)
{
    SCPreferencesRemoveValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCommitChanges(lua_State *L)
{
    SCPreferencesCommitChanges(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRemoveValue(lua_State *L)
{
    SCPreferencesRemoveValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesSetCallback(lua_State *L)
{
    SCPreferencesSetCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesContext(lua_State *L)
{
    SCPreferencesContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesSetCallback(lua_State *L)
{
    SCPreferencesSetCallback(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesCallBack(lua_State *L)
{
    SCPreferencesCallBack(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesContext(lua_State *L)
{
    SCPreferencesContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesScheduleWithRunLoop(lua_State *L)
{
    SCPreferencesScheduleWithRunLoop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesScheduleWithRunLoop(lua_State *L)
{
    SCPreferencesScheduleWithRunLoop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesUnscheduleFromRunLoop(lua_State *L)
{
    SCPreferencesUnscheduleFromRunLoop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesUnscheduleFromRunLoop(lua_State *L)
{
    SCPreferencesUnscheduleFromRunLoop(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesSetDispatchQueue(lua_State *L)
{
    SCPreferencesSetDispatchQueue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesSetDispatchQueue(lua_State *L)
{
    SCPreferencesSetDispatchQueue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesSynchronize(lua_State *L)
{
    SCPreferencesSynchronize(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesGetValue(lua_State *L)
{
    SCPreferencesGetValue(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesSynchronize(lua_State *L)
{
    SCPreferencesSynchronize(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCPreferencesRef(lua_State *L)
{
    SCPreferencesRef(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSCPreferencesAPIs[] = {
    {"SCPreferencesCreate", lua_SCPreferencesCreate},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesNotification", lua_SCPreferencesNotification},
    {"SCPreferencesCallBack", lua_SCPreferencesCallBack},
    {"SCPreferencesNotificationCommit", lua_SCPreferencesNotificationCommit},
    {"SCPreferencesNotificationApply", lua_SCPreferencesNotificationApply},
    {"SCPreferencesNotificationCommit", lua_SCPreferencesNotificationCommit},
    {"SCPreferencesNotificationApply", lua_SCPreferencesNotificationApply},
    {"SCPreferencesNotification", lua_SCPreferencesNotification},
    {"SCPreferencesContext", lua_SCPreferencesContext},
    {"SCPreferencesSetCallback", lua_SCPreferencesSetCallback},
    {"SCPreferencesContext", lua_SCPreferencesContext},
    {"SCPreferencesCallBack", lua_SCPreferencesCallBack},
    {"SCPreferencesCallBack", lua_SCPreferencesCallBack},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesNotification", lua_SCPreferencesNotification},
    {"SCPreferencesGetTypeID", lua_SCPreferencesGetTypeID},
    {"SCPreferencesGetTypeID", lua_SCPreferencesGetTypeID},
    {"SCPreferencesCreate", lua_SCPreferencesCreate},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesCreate", lua_SCPreferencesCreate},
    {"SCPreferencesCreateWithAuthorization", lua_SCPreferencesCreateWithAuthorization},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesCreateWithAuthorization", lua_SCPreferencesCreateWithAuthorization},
    {"SCPreferencesLock", lua_SCPreferencesLock},
    {"SCPreferencesLock", lua_SCPreferencesLock},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesCommitChanges", lua_SCPreferencesCommitChanges},
    {"SCPreferencesLock", lua_SCPreferencesLock},
    {"SCPreferencesApplyChanges", lua_SCPreferencesApplyChanges},
    {"SCPreferencesCommitChanges", lua_SCPreferencesCommitChanges},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesApplyChanges", lua_SCPreferencesApplyChanges},
    {"SCPreferencesApplyChanges", lua_SCPreferencesApplyChanges},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesUnlock", lua_SCPreferencesUnlock},
    {"SCPreferencesUnlock", lua_SCPreferencesUnlock},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesGetSignature", lua_SCPreferencesGetSignature},
    {"SCPreferencesCreate", lua_SCPreferencesCreate},
    {"SCPreferencesGetSignature", lua_SCPreferencesGetSignature},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesCopyKeyList", lua_SCPreferencesCopyKeyList},
    {"SCPreferencesCopyKeyList", lua_SCPreferencesCopyKeyList},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesGetValue", lua_SCPreferencesGetValue},
    {"SCPreferencesLock", lua_SCPreferencesLock},
    {"SCPreferencesGetValue", lua_SCPreferencesGetValue},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesAddValue", lua_SCPreferencesAddValue},
    {"SCPreferencesCommitChanges", lua_SCPreferencesCommitChanges},
    {"SCPreferencesAddValue", lua_SCPreferencesAddValue},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesSetValue", lua_SCPreferencesSetValue},
    {"SCPreferencesCommitChanges", lua_SCPreferencesCommitChanges},
    {"SCPreferencesSetValue", lua_SCPreferencesSetValue},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesRemoveValue", lua_SCPreferencesRemoveValue},
    {"SCPreferencesCommitChanges", lua_SCPreferencesCommitChanges},
    {"SCPreferencesRemoveValue", lua_SCPreferencesRemoveValue},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesSetCallback", lua_SCPreferencesSetCallback},
    {"SCPreferencesContext", lua_SCPreferencesContext},
    {"SCPreferencesSetCallback", lua_SCPreferencesSetCallback},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesCallBack", lua_SCPreferencesCallBack},
    {"SCPreferencesContext", lua_SCPreferencesContext},
    {"SCPreferencesScheduleWithRunLoop", lua_SCPreferencesScheduleWithRunLoop},
    {"SCPreferencesScheduleWithRunLoop", lua_SCPreferencesScheduleWithRunLoop},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesUnscheduleFromRunLoop", lua_SCPreferencesUnscheduleFromRunLoop},
    {"SCPreferencesUnscheduleFromRunLoop", lua_SCPreferencesUnscheduleFromRunLoop},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesSetDispatchQueue", lua_SCPreferencesSetDispatchQueue},
    {"SCPreferencesSetDispatchQueue", lua_SCPreferencesSetDispatchQueue},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {"SCPreferencesSynchronize", lua_SCPreferencesSynchronize},
    {"SCPreferencesGetValue", lua_SCPreferencesGetValue},
    {"SCPreferencesSynchronize", lua_SCPreferencesSynchronize},
    {"SCPreferencesRef", lua_SCPreferencesRef},
    {NULL, NULL},
};

int LuaOpenSCPreferences(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSCPreferencesAPIs);
    return 0;
}
