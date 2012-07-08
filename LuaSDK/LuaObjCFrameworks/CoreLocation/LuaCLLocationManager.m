//
//  LuaCLLocationManager.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCLLocationManager.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CLLocationManagerDelegate(lua_State *L)
{
    CLLocationManagerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLLocationManagerDelegate(lua_State *L)
{
    CLLocationManagerDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCLLocationManagerAPIs[] = {
    {"CLLocationManagerDelegate", lua_CLLocationManagerDelegate},
    {"CLLocationManagerDelegate", lua_CLLocationManagerDelegate},
    {NULL, NULL},
};

int LuaOpenCLLocationManager(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCLLocationManagerAPIs);
    return 0;
}
