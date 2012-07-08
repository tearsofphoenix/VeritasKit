//
//  LuaMKMapView.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMKMapView.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MKMapViewInternal(lua_State *L)
{
    MKMapViewInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKMapViewDelegate(lua_State *L)
{
    MKMapViewDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKMapViewInternal(lua_State *L)
{
    MKMapViewInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKMapViewDelegate(lua_State *L)
{
    MKMapViewDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKMapViewDelegate(lua_State *L)
{
    MKMapViewDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKMapViewDelegate(lua_State *L)
{
    MKMapViewDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKMapViewDelegate(lua_State *L)
{
    MKMapViewDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMKMapViewAPIs[] = {
    {"MKMapViewInternal", lua_MKMapViewInternal},
    {"MKMapViewDelegate", lua_MKMapViewDelegate},
    {"MKMapViewInternal", lua_MKMapViewInternal},
    {"MKMapViewDelegate", lua_MKMapViewDelegate},
    {"MKMapViewDelegate", lua_MKMapViewDelegate},
    {"MKMapViewDelegate", lua_MKMapViewDelegate},
    {"MKMapViewDelegate", lua_MKMapViewDelegate},
    {NULL, NULL},
};

int LuaOpenMKMapView(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMKMapViewAPIs);
    return 0;
}
