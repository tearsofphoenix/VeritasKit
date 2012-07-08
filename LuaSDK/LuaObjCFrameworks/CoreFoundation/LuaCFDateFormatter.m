//
//  LuaCFDateFormatter.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFDateFormatter.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFDateFormatterRef(lua_State *L)
{
    CFDateFormatterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatters(lua_State *L)
{
    CFDateFormatters(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterCreateDateFormatFromTemplate(lua_State *L)
{
    CFDateFormatterCreateDateFormatFromTemplate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterGetTypeID(lua_State *L)
{
    CFDateFormatterGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterNoStyle(lua_State *L)
{
    CFDateFormatterNoStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterShortStyle(lua_State *L)
{
    CFDateFormatterShortStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterMediumStyle(lua_State *L)
{
    CFDateFormatterMediumStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterLongStyle(lua_State *L)
{
    CFDateFormatterLongStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterFullStyle(lua_State *L)
{
    CFDateFormatterFullStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterStyle(lua_State *L)
{
    CFDateFormatterStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterRef(lua_State *L)
{
    CFDateFormatterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterGetLocale(lua_State *L)
{
    CFDateFormatterGetLocale(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterStyle(lua_State *L)
{
    CFDateFormatterStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterStyle(lua_State *L)
{
    CFDateFormatterStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterGetFormat(lua_State *L)
{
    CFDateFormatterGetFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterSetFormat(lua_State *L)
{
    CFDateFormatterSetFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterCreateStringWithDate(lua_State *L)
{
    CFDateFormatterCreateStringWithDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterCreateStringWithAbsoluteTime(lua_State *L)
{
    CFDateFormatterCreateStringWithAbsoluteTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterCreateDateFromString(lua_State *L)
{
    CFDateFormatterCreateDateFromString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterGetAbsoluteTimeFromString(lua_State *L)
{
    CFDateFormatterGetAbsoluteTimeFromString(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterSetProperty(lua_State *L)
{
    CFDateFormatterSetProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterCopyProperty(lua_State *L)
{
    CFDateFormatterCopyProperty(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterIsLenient(lua_State *L)
{
    CFDateFormatterIsLenient(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterTimeZone(lua_State *L)
{
    CFDateFormatterTimeZone(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterCalendarName(lua_State *L)
{
    CFDateFormatterCalendarName(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterDefaultFormat(lua_State *L)
{
    CFDateFormatterDefaultFormat(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterTwoDigitStartDate(lua_State *L)
{
    CFDateFormatterTwoDigitStartDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterDefaultDate(lua_State *L)
{
    CFDateFormatterDefaultDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterCalendar(lua_State *L)
{
    CFDateFormatterCalendar(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterEraSymbols(lua_State *L)
{
    CFDateFormatterEraSymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterMonthSymbols(lua_State *L)
{
    CFDateFormatterMonthSymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterShortMonthSymbols(lua_State *L)
{
    CFDateFormatterShortMonthSymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterWeekdaySymbols(lua_State *L)
{
    CFDateFormatterWeekdaySymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterShortWeekdaySymbols(lua_State *L)
{
    CFDateFormatterShortWeekdaySymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterAMSymbol(lua_State *L)
{
    CFDateFormatterAMSymbol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterPMSymbol(lua_State *L)
{
    CFDateFormatterPMSymbol(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterLongEraSymbols(lua_State *L)
{
    CFDateFormatterLongEraSymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterVeryShortMonthSymbols(lua_State *L)
{
    CFDateFormatterVeryShortMonthSymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterStandaloneMonthSymbols(lua_State *L)
{
    CFDateFormatterStandaloneMonthSymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterShortStandaloneMonthSymbols(lua_State *L)
{
    CFDateFormatterShortStandaloneMonthSymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterVeryShortStandaloneMonthSymbols(lua_State *L)
{
    CFDateFormatterVeryShortStandaloneMonthSymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterVeryShortWeekdaySymbols(lua_State *L)
{
    CFDateFormatterVeryShortWeekdaySymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterStandaloneWeekdaySymbols(lua_State *L)
{
    CFDateFormatterStandaloneWeekdaySymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterShortStandaloneWeekdaySymbols(lua_State *L)
{
    CFDateFormatterShortStandaloneWeekdaySymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterVeryShortStandaloneWeekdaySymbols(lua_State *L)
{
    CFDateFormatterVeryShortStandaloneWeekdaySymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterQuarterSymbols(lua_State *L)
{
    CFDateFormatterQuarterSymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterShortQuarterSymbols(lua_State *L)
{
    CFDateFormatterShortQuarterSymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterStandaloneQuarterSymbols(lua_State *L)
{
    CFDateFormatterStandaloneQuarterSymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterShortStandaloneQuarterSymbols(lua_State *L)
{
    CFDateFormatterShortStandaloneQuarterSymbols(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterGregorianStartDate(lua_State *L)
{
    CFDateFormatterGregorianStartDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateFormatterDoesRelativeDateFormattingKey(lua_State *L)
{
    CFDateFormatterDoesRelativeDateFormattingKey(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFDateFormatterAPIs[] = {
    {"CFDateFormatterRef", lua_CFDateFormatterRef},
    {"CFDateFormatters", lua_CFDateFormatters},
    {"CFDateFormatterCreateDateFormatFromTemplate", lua_CFDateFormatterCreateDateFormatFromTemplate},
    {"CFDateFormatterGetTypeID", lua_CFDateFormatterGetTypeID},
    {"CFDateFormatterNoStyle", lua_CFDateFormatterNoStyle},
    {"CFDateFormatterShortStyle", lua_CFDateFormatterShortStyle},
    {"CFDateFormatterMediumStyle", lua_CFDateFormatterMediumStyle},
    {"CFDateFormatterLongStyle", lua_CFDateFormatterLongStyle},
    {"CFDateFormatterFullStyle", lua_CFDateFormatterFullStyle},
    {"CFDateFormatterStyle", lua_CFDateFormatterStyle},
    {"CFDateFormatterRef", lua_CFDateFormatterRef},
    {"CFDateFormatterGetLocale", lua_CFDateFormatterGetLocale},
    {"CFDateFormatterStyle", lua_CFDateFormatterStyle},
    {"CFDateFormatterStyle", lua_CFDateFormatterStyle},
    {"CFDateFormatterGetFormat", lua_CFDateFormatterGetFormat},
    {"CFDateFormatterSetFormat", lua_CFDateFormatterSetFormat},
    {"CFDateFormatterCreateStringWithDate", lua_CFDateFormatterCreateStringWithDate},
    {"CFDateFormatterCreateStringWithAbsoluteTime", lua_CFDateFormatterCreateStringWithAbsoluteTime},
    {"CFDateFormatterCreateDateFromString", lua_CFDateFormatterCreateDateFromString},
    {"CFDateFormatterGetAbsoluteTimeFromString", lua_CFDateFormatterGetAbsoluteTimeFromString},
    {"CFDateFormatterSetProperty", lua_CFDateFormatterSetProperty},
    {"CFDateFormatterCopyProperty", lua_CFDateFormatterCopyProperty},
    {"CFDateFormatterIsLenient", lua_CFDateFormatterIsLenient},
    {"CFDateFormatterTimeZone", lua_CFDateFormatterTimeZone},
    {"CFDateFormatterCalendarName", lua_CFDateFormatterCalendarName},
    {"CFDateFormatterDefaultFormat", lua_CFDateFormatterDefaultFormat},
    {"CFDateFormatterTwoDigitStartDate", lua_CFDateFormatterTwoDigitStartDate},
    {"CFDateFormatterDefaultDate", lua_CFDateFormatterDefaultDate},
    {"CFDateFormatterCalendar", lua_CFDateFormatterCalendar},
    {"CFDateFormatterEraSymbols", lua_CFDateFormatterEraSymbols},
    {"CFDateFormatterMonthSymbols", lua_CFDateFormatterMonthSymbols},
    {"CFDateFormatterShortMonthSymbols", lua_CFDateFormatterShortMonthSymbols},
    {"CFDateFormatterWeekdaySymbols", lua_CFDateFormatterWeekdaySymbols},
    {"CFDateFormatterShortWeekdaySymbols", lua_CFDateFormatterShortWeekdaySymbols},
    {"CFDateFormatterAMSymbol", lua_CFDateFormatterAMSymbol},
    {"CFDateFormatterPMSymbol", lua_CFDateFormatterPMSymbol},
    {"CFDateFormatterLongEraSymbols", lua_CFDateFormatterLongEraSymbols},
    {"CFDateFormatterVeryShortMonthSymbols", lua_CFDateFormatterVeryShortMonthSymbols},
    {"CFDateFormatterStandaloneMonthSymbols", lua_CFDateFormatterStandaloneMonthSymbols},
    {"CFDateFormatterShortStandaloneMonthSymbols", lua_CFDateFormatterShortStandaloneMonthSymbols},
    {"CFDateFormatterVeryShortStandaloneMonthSymbols", lua_CFDateFormatterVeryShortStandaloneMonthSymbols},
    {"CFDateFormatterVeryShortWeekdaySymbols", lua_CFDateFormatterVeryShortWeekdaySymbols},
    {"CFDateFormatterStandaloneWeekdaySymbols", lua_CFDateFormatterStandaloneWeekdaySymbols},
    {"CFDateFormatterShortStandaloneWeekdaySymbols", lua_CFDateFormatterShortStandaloneWeekdaySymbols},
    {"CFDateFormatterVeryShortStandaloneWeekdaySymbols", lua_CFDateFormatterVeryShortStandaloneWeekdaySymbols},
    {"CFDateFormatterQuarterSymbols", lua_CFDateFormatterQuarterSymbols},
    {"CFDateFormatterShortQuarterSymbols", lua_CFDateFormatterShortQuarterSymbols},
    {"CFDateFormatterStandaloneQuarterSymbols", lua_CFDateFormatterStandaloneQuarterSymbols},
    {"CFDateFormatterShortStandaloneQuarterSymbols", lua_CFDateFormatterShortStandaloneQuarterSymbols},
    {"CFDateFormatterGregorianStartDate", lua_CFDateFormatterGregorianStartDate},
    {"CFDateFormatterDoesRelativeDateFormattingKey", lua_CFDateFormatterDoesRelativeDateFormattingKey},
    {NULL, NULL},
};

int LuaOpenCFDateFormatter(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFDateFormatterAPIs);
    return 0;
}
