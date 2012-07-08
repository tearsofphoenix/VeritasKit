//
//  LuaQLPreviewController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaQLPreviewController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_QLPreviewControllerDelegate(lua_State *L)
{
    QLPreviewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_QLPreviewControllerDataSource(lua_State *L)
{
    QLPreviewControllerDataSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_QLPreviewControllerReserved(lua_State *L)
{
    QLPreviewControllerReserved(lua_touserdata(L, 1));
    return 1;
}

static int lua_QLPreviewControllerReserved(lua_State *L)
{
    QLPreviewControllerReserved(lua_touserdata(L, 1));
    return 1;
}

static int lua_QLPreviewControllerDataSource(lua_State *L)
{
    QLPreviewControllerDataSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_QLPreviewControllerDelegate(lua_State *L)
{
    QLPreviewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_QLPreviewControllerDelegate(lua_State *L)
{
    QLPreviewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_QLPreviewControllerDataSource(lua_State *L)
{
    QLPreviewControllerDataSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_QLPreviewControllerDataSource(lua_State *L)
{
    QLPreviewControllerDataSource(lua_touserdata(L, 1));
    return 1;
}

static int lua_QLPreviewControllerDelegate(lua_State *L)
{
    QLPreviewControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaQLPreviewControllerAPIs[] = {
    {"QLPreviewControllerDelegate", lua_QLPreviewControllerDelegate},
    {"QLPreviewControllerDataSource", lua_QLPreviewControllerDataSource},
    {"QLPreviewControllerReserved", lua_QLPreviewControllerReserved},
    {"QLPreviewControllerReserved", lua_QLPreviewControllerReserved},
    {"QLPreviewControllerDataSource", lua_QLPreviewControllerDataSource},
    {"QLPreviewControllerDelegate", lua_QLPreviewControllerDelegate},
    {"QLPreviewControllerDelegate", lua_QLPreviewControllerDelegate},
    {"QLPreviewControllerDataSource", lua_QLPreviewControllerDataSource},
    {"QLPreviewControllerDataSource", lua_QLPreviewControllerDataSource},
    {"QLPreviewControllerDelegate", lua_QLPreviewControllerDelegate},
    {NULL, NULL},
};

int LuaOpenQLPreviewController(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaQLPreviewControllerAPIs);
    return 0;
}
