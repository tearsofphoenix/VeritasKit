//
//  LuaEKError.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaEKError.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_EKErrorDomain(lua_State *L)
{
    EKErrorDomain(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorDomain(lua_State *L)
{
    EKErrorDomain(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorCode(lua_State *L)
{
    EKErrorCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorEventNotMutable(lua_State *L)
{
    EKErrorEventNotMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorNoCalendar(lua_State *L)
{
    EKErrorNoCalendar(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorNoStartDate(lua_State *L)
{
    EKErrorNoStartDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorNoEndDate(lua_State *L)
{
    EKErrorNoEndDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorDatesInverted(lua_State *L)
{
    EKErrorDatesInverted(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorInternalFailure(lua_State *L)
{
    EKErrorInternalFailure(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorCalendarReadOnly(lua_State *L)
{
    EKErrorCalendarReadOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorDurationGreaterThanRecurrence(lua_State *L)
{
    EKErrorDurationGreaterThanRecurrence(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorAlarmGreaterThanRecurrence(lua_State *L)
{
    EKErrorAlarmGreaterThanRecurrence(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorStartDateTooFarInFuture(lua_State *L)
{
    EKErrorStartDateTooFarInFuture(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorStartDateCollidesWithOtherOccurrence(lua_State *L)
{
    EKErrorStartDateCollidesWithOtherOccurrence(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorObjectBelongsToDifferentStore(lua_State *L)
{
    EKErrorObjectBelongsToDifferentStore(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorInvitesCannotBeMoved(lua_State *L)
{
    EKErrorInvitesCannotBeMoved(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorInvalidSpan(lua_State *L)
{
    EKErrorInvalidSpan(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorCalendarHasNoSource(lua_State *L)
{
    EKErrorCalendarHasNoSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorCalendarSourceCannotBeModified(lua_State *L)
{
    EKErrorCalendarSourceCannotBeModified(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorCalendarIsImmutable(lua_State *L)
{
    EKErrorCalendarIsImmutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorSourceDoesNotAllowCalendarAddDelete(lua_State *L)
{
    EKErrorSourceDoesNotAllowCalendarAddDelete(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorCode(lua_State *L)
{
    EKErrorCode(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorEventNotMutable(lua_State *L)
{
    EKErrorEventNotMutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorNoCalendar(lua_State *L)
{
    EKErrorNoCalendar(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorNoStartDate(lua_State *L)
{
    EKErrorNoStartDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorNoEndDate(lua_State *L)
{
    EKErrorNoEndDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorDatesInverted(lua_State *L)
{
    EKErrorDatesInverted(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorInternalFailure(lua_State *L)
{
    EKErrorInternalFailure(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorCalendarReadOnly(lua_State *L)
{
    EKErrorCalendarReadOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorDurationGreaterThanRecurrence(lua_State *L)
{
    EKErrorDurationGreaterThanRecurrence(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorAlarmGreaterThanRecurrence(lua_State *L)
{
    EKErrorAlarmGreaterThanRecurrence(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorStartDateTooFarInFuture(lua_State *L)
{
    EKErrorStartDateTooFarInFuture(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorStartDateCollidesWithOtherOccurrence(lua_State *L)
{
    EKErrorStartDateCollidesWithOtherOccurrence(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorObjectBelongsToDifferentStore(lua_State *L)
{
    EKErrorObjectBelongsToDifferentStore(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorInvitesCannotBeMoved(lua_State *L)
{
    EKErrorInvitesCannotBeMoved(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorInvalidSpan(lua_State *L)
{
    EKErrorInvalidSpan(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorCalendarHasNoSource(lua_State *L)
{
    EKErrorCalendarHasNoSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorCalendarSourceCannotBeModified(lua_State *L)
{
    EKErrorCalendarSourceCannotBeModified(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorCalendarIsImmutable(lua_State *L)
{
    EKErrorCalendarIsImmutable(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorSourceDoesNotAllowCalendarAddDelete(lua_State *L)
{
    EKErrorSourceDoesNotAllowCalendarAddDelete(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorLast(lua_State *L)
{
    EKErrorLast(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKErrorCode(lua_State *L)
{
    EKErrorCode(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaEKErrorAPIs[] = {
    {"EKErrorDomain", lua_EKErrorDomain},
    {"EKErrorDomain", lua_EKErrorDomain},
    {"EKErrorCode", lua_EKErrorCode},
    {"EKErrorEventNotMutable", lua_EKErrorEventNotMutable},
    {"EKErrorNoCalendar", lua_EKErrorNoCalendar},
    {"EKErrorNoStartDate", lua_EKErrorNoStartDate},
    {"EKErrorNoEndDate", lua_EKErrorNoEndDate},
    {"EKErrorDatesInverted", lua_EKErrorDatesInverted},
    {"EKErrorInternalFailure", lua_EKErrorInternalFailure},
    {"EKErrorCalendarReadOnly", lua_EKErrorCalendarReadOnly},
    {"EKErrorDurationGreaterThanRecurrence", lua_EKErrorDurationGreaterThanRecurrence},
    {"EKErrorAlarmGreaterThanRecurrence", lua_EKErrorAlarmGreaterThanRecurrence},
    {"EKErrorStartDateTooFarInFuture", lua_EKErrorStartDateTooFarInFuture},
    {"EKErrorStartDateCollidesWithOtherOccurrence", lua_EKErrorStartDateCollidesWithOtherOccurrence},
    {"EKErrorObjectBelongsToDifferentStore", lua_EKErrorObjectBelongsToDifferentStore},
    {"EKErrorInvitesCannotBeMoved", lua_EKErrorInvitesCannotBeMoved},
    {"EKErrorInvalidSpan", lua_EKErrorInvalidSpan},
    {"EKErrorCalendarHasNoSource", lua_EKErrorCalendarHasNoSource},
    {"EKErrorCalendarSourceCannotBeModified", lua_EKErrorCalendarSourceCannotBeModified},
    {"EKErrorCalendarIsImmutable", lua_EKErrorCalendarIsImmutable},
    {"EKErrorSourceDoesNotAllowCalendarAddDelete", lua_EKErrorSourceDoesNotAllowCalendarAddDelete},
    {"EKErrorCode", lua_EKErrorCode},
    {"EKErrorEventNotMutable", lua_EKErrorEventNotMutable},
    {"EKErrorNoCalendar", lua_EKErrorNoCalendar},
    {"EKErrorNoStartDate", lua_EKErrorNoStartDate},
    {"EKErrorNoEndDate", lua_EKErrorNoEndDate},
    {"EKErrorDatesInverted", lua_EKErrorDatesInverted},
    {"EKErrorInternalFailure", lua_EKErrorInternalFailure},
    {"EKErrorCalendarReadOnly", lua_EKErrorCalendarReadOnly},
    {"EKErrorDurationGreaterThanRecurrence", lua_EKErrorDurationGreaterThanRecurrence},
    {"EKErrorAlarmGreaterThanRecurrence", lua_EKErrorAlarmGreaterThanRecurrence},
    {"EKErrorStartDateTooFarInFuture", lua_EKErrorStartDateTooFarInFuture},
    {"EKErrorStartDateCollidesWithOtherOccurrence", lua_EKErrorStartDateCollidesWithOtherOccurrence},
    {"EKErrorObjectBelongsToDifferentStore", lua_EKErrorObjectBelongsToDifferentStore},
    {"EKErrorInvitesCannotBeMoved", lua_EKErrorInvitesCannotBeMoved},
    {"EKErrorInvalidSpan", lua_EKErrorInvalidSpan},
    {"EKErrorCalendarHasNoSource", lua_EKErrorCalendarHasNoSource},
    {"EKErrorCalendarSourceCannotBeModified", lua_EKErrorCalendarSourceCannotBeModified},
    {"EKErrorCalendarIsImmutable", lua_EKErrorCalendarIsImmutable},
    {"EKErrorSourceDoesNotAllowCalendarAddDelete", lua_EKErrorSourceDoesNotAllowCalendarAddDelete},
    {"EKErrorLast", lua_EKErrorLast},
    {"EKErrorCode", lua_EKErrorCode},
    {NULL, NULL},
};

int LuaOpenEKError(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaEKErrorAPIs);
    return 0;
}
