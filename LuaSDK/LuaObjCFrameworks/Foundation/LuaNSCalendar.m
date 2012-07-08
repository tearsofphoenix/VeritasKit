//
//  LuaNSCalendar.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSCalendar.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"

static const LuaSDKConst __luaNSCalendarConstants[] = 
{
    {"NSEraCalendarUnit", NSEraCalendarUnit},
    {"NSYearCalendarUnit", NSYearCalendarUnit},
    {"NSMonthCalendarUnit", NSMonthCalendarUnit},
    {"NSDayCalendarUnit", NSDayCalendarUnit},
    {"NSHourCalendarUnit", NSHourCalendarUnit},
    {"NSMinuteCalendarUnit", NSMinuteCalendarUnit},
    {"NSSecondCalendarUnit", NSSecondCalendarUnit},
    {"NSWeekCalendarUnit", NSWeekCalendarUnit},
    {"NSWeekdayCalendarUnit", NSWeekdayCalendarUnit},
    {"NSWeekdayOrdinalCalendarUnit", NSWeekdayOrdinalCalendarUnit},
    {"NSQuarterCalendarUnit", NSQuarterCalendarUnit},
    {"NSWeekOfMonthCalendarUnit", NSWeekOfMonthCalendarUnit},
    {"NSWeekOfYearCalendarUnit", NSWeekOfYearCalendarUnit},
    {"NSYearForWeekOfYearCalendarUnit", NSYearForWeekOfYearCalendarUnit},
    {"NSCalendarCalendarUnit", NSCalendarCalendarUnit},
    {"NSTimeZoneCalendarUnit", NSTimeZoneCalendarUnit},
    {"NSWrapCalendarComponents", NSWrapCalendarComponents},
    {"NSUndefinedDateComponent", NSUndefinedDateComponent},
    {NULL, 0},
};

int LuaOpenNSCalendar(lua_State *L)
{
    luaObjC_loadGlobalConstants(L, __luaNSCalendarConstants);
    return 0;
}
