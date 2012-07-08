//
//  LuaCLGeocoder.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCLGeocoder.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CLGeocoderInternal(lua_State *L)
{
    CLGeocoderInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_CLGeocoderInternal(lua_State *L)
{
    CLGeocoderInternal(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCLGeocoderAPIs[] = {
    {"CLGeocoderInternal", lua_CLGeocoderInternal},
    {"CLGeocoderInternal", lua_CLGeocoderInternal},
    {NULL, NULL},
};

int LuaOpenCLGeocoder(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCLGeocoderAPIs);
    return 0;
}
