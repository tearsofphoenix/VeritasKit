//
//  LuaMKAnnotationView.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMKAnnotationView.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MKAnnotationViewDragStateNone(lua_State *L)
{
    MKAnnotationViewDragStateNone(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKAnnotationViewDragStateStarting(lua_State *L)
{
    MKAnnotationViewDragStateStarting(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKAnnotationViewDragStateDragging(lua_State *L)
{
    MKAnnotationViewDragStateDragging(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKAnnotationViewDragStateCanceling(lua_State *L)
{
    MKAnnotationViewDragStateCanceling(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKAnnotationViewDragStateEnding(lua_State *L)
{
    MKAnnotationViewDragStateEnding(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKAnnotationViewDragState(lua_State *L)
{
    MKAnnotationViewDragState(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKAnnotationViewInternal(lua_State *L)
{
    MKAnnotationViewInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKAnnotationViewInternal(lua_State *L)
{
    MKAnnotationViewInternal(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKAnnotationViewDragStateStarting(lua_State *L)
{
    MKAnnotationViewDragStateStarting(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKAnnotationViewDragState(lua_State *L)
{
    MKAnnotationViewDragState(lua_touserdata(L, 1));
    return 1;
}

static int lua_MKAnnotationViewDragState(lua_State *L)
{
    MKAnnotationViewDragState(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMKAnnotationViewAPIs[] = {
    {"MKAnnotationViewDragStateNone", lua_MKAnnotationViewDragStateNone},
    {"MKAnnotationViewDragStateStarting", lua_MKAnnotationViewDragStateStarting},
    {"MKAnnotationViewDragStateDragging", lua_MKAnnotationViewDragStateDragging},
    {"MKAnnotationViewDragStateCanceling", lua_MKAnnotationViewDragStateCanceling},
    {"MKAnnotationViewDragStateEnding", lua_MKAnnotationViewDragStateEnding},
    {"MKAnnotationViewDragState", lua_MKAnnotationViewDragState},
    {"MKAnnotationViewInternal", lua_MKAnnotationViewInternal},
    {"MKAnnotationViewInternal", lua_MKAnnotationViewInternal},
    {"MKAnnotationViewDragStateStarting", lua_MKAnnotationViewDragStateStarting},
    {"MKAnnotationViewDragState", lua_MKAnnotationViewDragState},
    {"MKAnnotationViewDragState", lua_MKAnnotationViewDragState},
    {NULL, NULL},
};

int LuaOpenMKAnnotationView(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMKAnnotationViewAPIs);
    return 0;
}
