//
//  LuaCFCalendar.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFCalendar.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFCalendarRef(lua_State *L)
{
    CFCalendarRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarGetTypeID(lua_State *L)
{
    CFCalendarGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarRef(lua_State *L)
{
    CFCalendarRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarRef(lua_State *L)
{
    CFCalendarRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarGetIdentifier(lua_State *L)
{
    CFCalendarGetIdentifier(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarCopyLocale(lua_State *L)
{
    CFCalendarCopyLocale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarSetLocale(lua_State *L)
{
    CFCalendarSetLocale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarCopyTimeZone(lua_State *L)
{
    CFCalendarCopyTimeZone(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarSetTimeZone(lua_State *L)
{
    CFCalendarSetTimeZone(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarGetFirstWeekday(lua_State *L)
{
    CFCalendarGetFirstWeekday(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarSetFirstWeekday(lua_State *L)
{
    CFCalendarSetFirstWeekday(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarGetMinimumDaysInFirstWeek(lua_State *L)
{
    CFCalendarGetMinimumDaysInFirstWeek(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarSetMinimumDaysInFirstWeek(lua_State *L)
{
    CFCalendarSetMinimumDaysInFirstWeek(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitEra(lua_State *L)
{
    CFCalendarUnitEra(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitYear(lua_State *L)
{
    CFCalendarUnitYear(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitMonth(lua_State *L)
{
    CFCalendarUnitMonth(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitDay(lua_State *L)
{
    CFCalendarUnitDay(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitHour(lua_State *L)
{
    CFCalendarUnitHour(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitMinute(lua_State *L)
{
    CFCalendarUnitMinute(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitSecond(lua_State *L)
{
    CFCalendarUnitSecond(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitWeek(lua_State *L)
{
    CFCalendarUnitWeek(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitWeekday(lua_State *L)
{
    CFCalendarUnitWeekday(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitWeekdayOrdinal(lua_State *L)
{
    CFCalendarUnitWeekdayOrdinal(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitQuarter(lua_State *L)
{
    CFCalendarUnitQuarter(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitWeekOfMonth(lua_State *L)
{
    CFCalendarUnitWeekOfMonth(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitWeekOfYear(lua_State *L)
{
    CFCalendarUnitWeekOfYear(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnitYearForWeekOfYear(lua_State *L)
{
    CFCalendarUnitYearForWeekOfYear(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarUnit(lua_State *L)
{
    CFCalendarUnit(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarGetMinimumRangeOfUnit(lua_State *L)
{
    CFCalendarGetMinimumRangeOfUnit(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarGetMaximumRangeOfUnit(lua_State *L)
{
    CFCalendarGetMaximumRangeOfUnit(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarGetRangeOfUnit(lua_State *L)
{
    CFCalendarGetRangeOfUnit(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarGetOrdinalityOfUnit(lua_State *L)
{
    CFCalendarGetOrdinalityOfUnit(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarGetTimeRangeOfUnit(lua_State *L)
{
    CFCalendarGetTimeRangeOfUnit(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarComposeAbsoluteTime(lua_State *L)
{
    CFCalendarComposeAbsoluteTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarDecomposeAbsoluteTime(lua_State *L)
{
    CFCalendarDecomposeAbsoluteTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarComponentsWrap(lua_State *L)
{
    CFCalendarComponentsWrap(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarAddComponents(lua_State *L)
{
    CFCalendarAddComponents(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFCalendarGetComponentDifference(lua_State *L)
{
    CFCalendarGetComponentDifference(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFCalendarAPIs[] = {
    {"CFCalendarRef", lua_CFCalendarRef},
    {"CFCalendarGetTypeID", lua_CFCalendarGetTypeID},
    {"CFCalendarRef", lua_CFCalendarRef},
    {"CFCalendarRef", lua_CFCalendarRef},
    {"CFCalendarGetIdentifier", lua_CFCalendarGetIdentifier},
    {"CFCalendarCopyLocale", lua_CFCalendarCopyLocale},
    {"CFCalendarSetLocale", lua_CFCalendarSetLocale},
    {"CFCalendarCopyTimeZone", lua_CFCalendarCopyTimeZone},
    {"CFCalendarSetTimeZone", lua_CFCalendarSetTimeZone},
    {"CFCalendarGetFirstWeekday", lua_CFCalendarGetFirstWeekday},
    {"CFCalendarSetFirstWeekday", lua_CFCalendarSetFirstWeekday},
    {"CFCalendarGetMinimumDaysInFirstWeek", lua_CFCalendarGetMinimumDaysInFirstWeek},
    {"CFCalendarSetMinimumDaysInFirstWeek", lua_CFCalendarSetMinimumDaysInFirstWeek},
    {"CFCalendarUnitEra", lua_CFCalendarUnitEra},
    {"CFCalendarUnitYear", lua_CFCalendarUnitYear},
    {"CFCalendarUnitMonth", lua_CFCalendarUnitMonth},
    {"CFCalendarUnitDay", lua_CFCalendarUnitDay},
    {"CFCalendarUnitHour", lua_CFCalendarUnitHour},
    {"CFCalendarUnitMinute", lua_CFCalendarUnitMinute},
    {"CFCalendarUnitSecond", lua_CFCalendarUnitSecond},
    {"CFCalendarUnitWeek", lua_CFCalendarUnitWeek},
    {"CFCalendarUnitWeekday", lua_CFCalendarUnitWeekday},
    {"CFCalendarUnitWeekdayOrdinal", lua_CFCalendarUnitWeekdayOrdinal},
    {"CFCalendarUnitQuarter", lua_CFCalendarUnitQuarter},
    {"CFCalendarUnitWeekOfMonth", lua_CFCalendarUnitWeekOfMonth},
    {"CFCalendarUnitWeekOfYear", lua_CFCalendarUnitWeekOfYear},
    {"CFCalendarUnitYearForWeekOfYear", lua_CFCalendarUnitYearForWeekOfYear},
    {"CFCalendarUnit", lua_CFCalendarUnit},
    {"CFCalendarGetMinimumRangeOfUnit", lua_CFCalendarGetMinimumRangeOfUnit},
    {"CFCalendarGetMaximumRangeOfUnit", lua_CFCalendarGetMaximumRangeOfUnit},
    {"CFCalendarGetRangeOfUnit", lua_CFCalendarGetRangeOfUnit},
    {"CFCalendarGetOrdinalityOfUnit", lua_CFCalendarGetOrdinalityOfUnit},
    {"CFCalendarGetTimeRangeOfUnit", lua_CFCalendarGetTimeRangeOfUnit},
    {"CFCalendarComposeAbsoluteTime", lua_CFCalendarComposeAbsoluteTime},
    {"CFCalendarDecomposeAbsoluteTime", lua_CFCalendarDecomposeAbsoluteTime},
    {"CFCalendarComponentsWrap", lua_CFCalendarComponentsWrap},
    {"CFCalendarAddComponents", lua_CFCalendarAddComponents},
    {"CFCalendarGetComponentDifference", lua_CFCalendarGetComponentDifference},
    {NULL, NULL},
};

int LuaOpenCFCalendar(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFCalendarAPIs);
    return 0;
}
