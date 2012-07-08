//
//  LuaCGDataProvider.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCGDataProvider.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CGDataProviderGetTypeID(lua_State *L)
{
    lua_pushinteger(L, CGDataProviderGetTypeID());
    return 1;
}

static int lua_CGDataProviderCreateSequential(lua_State *L)
{
    lua_pushlightuserdata(L, CGDataProviderCreateSequential(lua_touserdata(L, 1), lua_touserdata(L, 2)));
    return 1;
}

static int lua_CGDataProviderCreateDirect(lua_State *L)
{
    lua_pushlightuserdata(L, CGDataProviderCreateDirect(lua_touserdata(L, 1), lua_tointeger(L, 2), lua_touserdata(L, 3)));
    return 1;
}

static int lua_CGDataProviderCreateWithData(lua_State *L)
{
    lua_pushlightuserdata(L, CGDataProviderCreateWithData(lua_touserdata(L, 1), lua_touserdata(L, 2),
                                                          lua_tointeger(L, 3), lua_touserdata(L, 4)));
    return 1;
}

static int lua_CGDataProviderCreateWithCFData(lua_State *L)
{
    lua_pushlightuserdata(L, CGDataProviderCreateWithCFData(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGDataProviderCreateWithURL(lua_State *L)
{
    lua_pushlightuserdata(L, CGDataProviderCreateWithURL(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGDataProviderCreateWithFilename(lua_State *L)
{
    lua_pushlightuserdata(L, CGDataProviderCreateWithFilename(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGDataProviderRetain(lua_State *L)
{
    lua_pushlightuserdata(L, CGDataProviderRetain(lua_touserdata(L, 1)));
    return 1;
}

static int lua_CGDataProviderRelease(lua_State *L)
{
    CGDataProviderRelease(lua_touserdata(L, 1));
    return 0;
}

static int lua_CGDataProviderCopyData(lua_State *L)
{
    lua_pushlightuserdata(L, (void*)CGDataProviderCopyData(lua_touserdata(L, 1)));
    return 1;
}

static const luaL_Reg __LuaCGDataProviderAPIs[] = 
{
    {"CGDataProviderGetTypeID", lua_CGDataProviderGetTypeID},
    {"CGDataProviderCreateSequential", lua_CGDataProviderCreateSequential},
    {"CGDataProviderCreateDirect", lua_CGDataProviderCreateDirect},
    {"CGDataProviderCreateWithData", lua_CGDataProviderCreateWithData},
    {"CGDataProviderCreateWithCFData", lua_CGDataProviderCreateWithCFData},
    {"CGDataProviderCreateWithURL", lua_CGDataProviderCreateWithURL},
    {"CGDataProviderCreateWithFilename", lua_CGDataProviderCreateWithFilename},
    {"CGDataProviderRetain", lua_CGDataProviderRetain},
    {"CGDataProviderRelease", lua_CGDataProviderRelease},
    {"CGDataProviderCopyData", lua_CGDataProviderCopyData},
    {NULL, 0},
};

int LuaOpenCGDataProvider(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCGDataProviderAPIs);
    return 0;
}
