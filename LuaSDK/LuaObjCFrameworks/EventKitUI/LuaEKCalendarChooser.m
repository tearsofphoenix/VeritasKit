//
//  LuaEKCalendarChooser.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaEKCalendarChooser.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_EKCalendarChooserSelectionStyleSingle(lua_State *L)
{
    EKCalendarChooserSelectionStyleSingle(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarChooserSelectionStyleMultiple(lua_State *L)
{
    EKCalendarChooserSelectionStyleMultiple(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarChooserSelectionStyle(lua_State *L)
{
    EKCalendarChooserSelectionStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarChooserDisplayAllCalendars(lua_State *L)
{
    EKCalendarChooserDisplayAllCalendars(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarChooserDisplayWritableCalendarsOnly(lua_State *L)
{
    EKCalendarChooserDisplayWritableCalendarsOnly(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarChooserDisplayStyle(lua_State *L)
{
    EKCalendarChooserDisplayStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarChooserDelegate(lua_State *L)
{
    EKCalendarChooserDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarChooserSelectionStyle(lua_State *L)
{
    EKCalendarChooserSelectionStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarChooserDisplayStyle(lua_State *L)
{
    EKCalendarChooserDisplayStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarChooserSelectionStyle(lua_State *L)
{
    EKCalendarChooserSelectionStyle(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarChooserDelegate(lua_State *L)
{
    EKCalendarChooserDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_EKCalendarChooserDelegate(lua_State *L)
{
    EKCalendarChooserDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaEKCalendarChooserAPIs[] = {
    {"EKCalendarChooserSelectionStyleSingle", lua_EKCalendarChooserSelectionStyleSingle},
    {"EKCalendarChooserSelectionStyleMultiple", lua_EKCalendarChooserSelectionStyleMultiple},
    {"EKCalendarChooserSelectionStyle", lua_EKCalendarChooserSelectionStyle},
    {"EKCalendarChooserDisplayAllCalendars", lua_EKCalendarChooserDisplayAllCalendars},
    {"EKCalendarChooserDisplayWritableCalendarsOnly", lua_EKCalendarChooserDisplayWritableCalendarsOnly},
    {"EKCalendarChooserDisplayStyle", lua_EKCalendarChooserDisplayStyle},
    {"EKCalendarChooserDelegate", lua_EKCalendarChooserDelegate},
    {"EKCalendarChooserSelectionStyle", lua_EKCalendarChooserSelectionStyle},
    {"EKCalendarChooserDisplayStyle", lua_EKCalendarChooserDisplayStyle},
    {"EKCalendarChooserSelectionStyle", lua_EKCalendarChooserSelectionStyle},
    {"EKCalendarChooserDelegate", lua_EKCalendarChooserDelegate},
    {"EKCalendarChooserDelegate", lua_EKCalendarChooserDelegate},
    {NULL, NULL},
};

int LuaOpenEKCalendarChooser(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaEKCalendarChooserAPIs);
    return 0;
}
