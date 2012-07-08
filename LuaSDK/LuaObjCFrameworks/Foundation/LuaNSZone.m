//
//  LuaNSZone.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSZone.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"
#import "luasdk_utilities.h"
#import "LuaObjCAuxiliary.h"


static int lua_NSDefaultMallocZone(lua_State *L)
{
    lua_pushlightuserdata(L, NSDefaultMallocZone());
    return 1;
}

static int lua_NSCreateZone(lua_State *L)
{
    lua_pushlightuserdata(L, NSCreateZone(lua_tointeger(L, 1), 
                                          lua_tointeger(L, 2), 
                                          lua_tointeger(L, 3)));
    return 1;
}

static int lua_NSRecycleZone(lua_State *L)
{
    NSRecycleZone(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSSetZoneName(lua_State *L)
{
    NSSetZoneName(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_NSZoneFromPointer(lua_State *L)
{
   lua_pushlightuserdata(L, NSZoneFromPointer(lua_touserdata(L, 1)));
    return 1;
}

static int lua_NSZoneMalloc(lua_State *L)
{
   lua_pushlightuserdata(L,  NSZoneMalloc(lua_touserdata(L, 1), lua_tointeger(L, 2)));
    return 1;
}

static int lua_NSZoneCalloc(lua_State *L)
{
    lua_pushlightuserdata(L, NSZoneCalloc(lua_touserdata(L, 1), 
                                          lua_tointeger(L, 2), 
                                          lua_tointeger(L, 3)));
    return 1;
}

static int lua_NSZoneRealloc(lua_State *L)
{
    lua_pushlightuserdata(L, NSZoneRealloc(lua_touserdata(L, 1), 
                                           lua_touserdata(L, 2), 
                                           lua_tointeger(L, 3)));
    return 1;
}

static int lua_NSZoneFree(lua_State *L)
{
    NSZoneFree(lua_touserdata(L, 1), lua_touserdata(L, 2));
    return 0;
}

static int lua_NSPageSize(lua_State *L)
{
    lua_pushinteger(L, NSPageSize());
    return 1;
}

static int lua_NSLogPageSize(lua_State *L)
{
   lua_pushinteger(L, NSLogPageSize());
    return 1;
}

static int lua_NSRoundUpToMultipleOfPageSize(lua_State *L)
{
    lua_pushinteger(L, NSRoundUpToMultipleOfPageSize(lua_tointeger(L, 1)));
    return 1;
}

static int lua_NSRoundDownToMultipleOfPageSize(lua_State *L)
{
    lua_pushinteger(L, NSRoundDownToMultipleOfPageSize(lua_tointeger(L, 1)));
    return 1;
}

static int lua_NSAllocateMemoryPages(lua_State *L)
{
   lua_pushlightuserdata(L, NSAllocateMemoryPages(lua_tointeger(L, 1)));
    return 1;
}

static int lua_NSDeallocateMemoryPages(lua_State *L)
{
    NSDeallocateMemoryPages(lua_touserdata(L, 1), lua_tointeger(L, 2));
    return 0;
}

static int lua_NSCopyMemoryPages(lua_State *L)
{
    NSCopyMemoryPages(lua_touserdata(L, 1), lua_touserdata(L, 2), lua_tointeger(L, 3));
    return 0;
}

static int lua_NSRealMemoryAvailable(lua_State *L)
{
   lua_pushinteger(L, NSRealMemoryAvailable());
    return 1;
}

static const luaL_Reg __LuaNSZoneAPIs[] = 
{    
    {"NSDefaultMallocZone", lua_NSDefaultMallocZone},
    {"NSCreateZone", lua_NSCreateZone},
    {"NSRecycleZone", lua_NSRecycleZone},
    {"NSSetZoneName", lua_NSSetZoneName},
    {"NSZoneFromPointer", lua_NSZoneFromPointer},
    {"NSZoneMalloc", lua_NSZoneMalloc},
    {"NSZoneCalloc", lua_NSZoneCalloc},
    {"NSZoneRealloc", lua_NSZoneRealloc},
    {"NSZoneFree", lua_NSZoneFree},
    {"NSPageSize", lua_NSPageSize},
    {"NSLogPageSize", lua_NSLogPageSize},
    {"NSRoundUpToMultipleOfPageSize", lua_NSRoundUpToMultipleOfPageSize},
    {"NSRoundDownToMultipleOfPageSize", lua_NSRoundDownToMultipleOfPageSize},
    {"NSAllocateMemoryPages", lua_NSAllocateMemoryPages},
    {"NSDeallocateMemoryPages", lua_NSDeallocateMemoryPages},
    {"NSCopyMemoryPages", lua_NSCopyMemoryPages},
    {"NSRealMemoryAvailable", lua_NSRealMemoryAvailable},
    {NULL, 0},
};

int LuaOpenNSZone(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSZoneAPIs);
    return 0;
}
