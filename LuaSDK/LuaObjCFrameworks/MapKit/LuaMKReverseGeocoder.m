//
//  LuaMKReverseGeocoder.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMKReverseGeocoder.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MKReverseGeocoderInternal(lua_State *L)
{
    MKReverseGeocoderInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKReverseGeocoderDelegate(lua_State *L)
{
    MKReverseGeocoderDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKReverseGeocoderInternal(lua_State *L)
{
    MKReverseGeocoderInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKReverseGeocoderDelegate(lua_State *L)
{
    MKReverseGeocoderDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKReverseGeocoderDelegate(lua_State *L)
{
    MKReverseGeocoderDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMKReverseGeocoderAPIs[] = {
    {"MKReverseGeocoderInternal", lua_MKReverseGeocoderInternal},
    {"MKReverseGeocoderDelegate", lua_MKReverseGeocoderDelegate},
    {"MKReverseGeocoderInternal", lua_MKReverseGeocoderInternal},
    {"MKReverseGeocoderDelegate", lua_MKReverseGeocoderDelegate},
    {"MKReverseGeocoderDelegate", lua_MKReverseGeocoderDelegate},
    {NULL, NULL},
};

int LuaOpenMKReverseGeocoder(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMKReverseGeocoderAPIs);
    return 0;
}
