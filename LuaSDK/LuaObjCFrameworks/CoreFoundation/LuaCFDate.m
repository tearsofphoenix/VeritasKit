//
//  LuaCFDate.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFDate.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFDateRef(lua_State *L)
{
    CFDateRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateGetTypeID(lua_State *L)
{
    CFDateGetTypeID(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateRef(lua_State *L)
{
    CFDateRef(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateGetAbsoluteTime(lua_State *L)
{
    CFDateGetAbsoluteTime(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateGetTimeIntervalSinceDate(lua_State *L)
{
    CFDateGetTimeIntervalSinceDate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFDateCompare(lua_State *L)
{
    CFDateCompare(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFDateAPIs[] = {
    {"CFDateRef", lua_CFDateRef},
    {"CFDateGetTypeID", lua_CFDateGetTypeID},
    {"CFDateRef", lua_CFDateRef},
    {"CFDateGetAbsoluteTime", lua_CFDateGetAbsoluteTime},
    {"CFDateGetTimeIntervalSinceDate", lua_CFDateGetTimeIntervalSinceDate},
    {"CFDateCompare", lua_CFDateCompare},
    {NULL, NULL},
};

int LuaOpenCFDate(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFDateAPIs);
    return 0;
}
