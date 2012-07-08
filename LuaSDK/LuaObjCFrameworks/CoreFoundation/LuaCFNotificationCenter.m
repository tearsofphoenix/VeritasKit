//
//  LuaCFNotificationCenter.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFNotificationCenter.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFNotificationCenterRef(lua_State *L)
{
    CFNotificationCenterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterRef(lua_State *L)
{
    CFNotificationCenterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterGetTypeID(lua_State *L)
{
    CFNotificationCenterGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterRef(lua_State *L)
{
    CFNotificationCenterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterRef(lua_State *L)
{
    CFNotificationCenterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterRef(lua_State *L)
{
    CFNotificationCenterRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterAddObserver(lua_State *L)
{
    CFNotificationCenterAddObserver(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterAddObserver(lua_State *L)
{
    CFNotificationCenterAddObserver(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterRemoveObserver(lua_State *L)
{
    CFNotificationCenterRemoveObserver(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterPostNotification(lua_State *L)
{
    CFNotificationCenterPostNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterPostNotificationWithOptions(lua_State *L)
{
    CFNotificationCenterPostNotificationWithOptions(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterAddObserver(lua_State *L)
{
    CFNotificationCenterAddObserver(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterRemoveObserver(lua_State *L)
{
    CFNotificationCenterRemoveObserver(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterRemoveEveryObserver(lua_State *L)
{
    CFNotificationCenterRemoveEveryObserver(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterPostNotification(lua_State *L)
{
    CFNotificationCenterPostNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFNotificationCenterPostNotificationWithOptions(lua_State *L)
{
    CFNotificationCenterPostNotificationWithOptions(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFNotificationCenterAPIs[] = {
    {"CFNotificationCenterRef", lua_CFNotificationCenterRef},
    {"CFNotificationCenterRef", lua_CFNotificationCenterRef},
    {"CFNotificationCenterGetTypeID", lua_CFNotificationCenterGetTypeID},
    {"CFNotificationCenterRef", lua_CFNotificationCenterRef},
    {"CFNotificationCenterRef", lua_CFNotificationCenterRef},
    {"CFNotificationCenterRef", lua_CFNotificationCenterRef},
    {"CFNotificationCenterAddObserver", lua_CFNotificationCenterAddObserver},
    {"CFNotificationCenterAddObserver", lua_CFNotificationCenterAddObserver},
    {"CFNotificationCenterRemoveObserver", lua_CFNotificationCenterRemoveObserver},
    {"CFNotificationCenterPostNotification", lua_CFNotificationCenterPostNotification},
    {"CFNotificationCenterPostNotificationWithOptions", lua_CFNotificationCenterPostNotificationWithOptions},
    {"CFNotificationCenterAddObserver", lua_CFNotificationCenterAddObserver},
    {"CFNotificationCenterRemoveObserver", lua_CFNotificationCenterRemoveObserver},
    {"CFNotificationCenterRemoveEveryObserver", lua_CFNotificationCenterRemoveEveryObserver},
    {"CFNotificationCenterPostNotification", lua_CFNotificationCenterPostNotification},
    {"CFNotificationCenterPostNotificationWithOptions", lua_CFNotificationCenterPostNotificationWithOptions},
    {NULL, NULL},
};

int LuaOpenCFNotificationCenter(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFNotificationCenterAPIs);
    return 0;
}
