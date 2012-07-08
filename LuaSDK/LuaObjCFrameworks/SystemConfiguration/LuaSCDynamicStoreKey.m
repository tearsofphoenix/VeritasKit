//
//  LuaSCDynamicStoreKey.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSCDynamicStoreKey.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SCDynamicStoreKeyCreate(lua_State *L)
{
    SCDynamicStoreKeyCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreate(lua_State *L)
{
    SCDynamicStoreKeyCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreate(lua_State *L)
{
    SCDynamicStoreKeyCreate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateNetworkGlobalEntity(lua_State *L)
{
    SCDynamicStoreKeyCreateNetworkGlobalEntity(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateNetworkGlobalEntity(lua_State *L)
{
    SCDynamicStoreKeyCreateNetworkGlobalEntity(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateNetworkInterface(lua_State *L)
{
    SCDynamicStoreKeyCreateNetworkInterface(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateNetworkInterface(lua_State *L)
{
    SCDynamicStoreKeyCreateNetworkInterface(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateNetworkInterfaceEntity(lua_State *L)
{
    SCDynamicStoreKeyCreateNetworkInterfaceEntity(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateNetworkInterfaceEntity(lua_State *L)
{
    SCDynamicStoreKeyCreateNetworkInterfaceEntity(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateNetworkServiceEntity(lua_State *L)
{
    SCDynamicStoreKeyCreateNetworkServiceEntity(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateNetworkServiceEntity(lua_State *L)
{
    SCDynamicStoreKeyCreateNetworkServiceEntity(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateComputerName(lua_State *L)
{
    SCDynamicStoreKeyCreateComputerName(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateComputerName(lua_State *L)
{
    SCDynamicStoreKeyCreateComputerName(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateConsoleUser(lua_State *L)
{
    SCDynamicStoreKeyCreateConsoleUser(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateConsoleUser(lua_State *L)
{
    SCDynamicStoreKeyCreateConsoleUser(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateHostNames(lua_State *L)
{
    SCDynamicStoreKeyCreateHostNames(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateHostNames(lua_State *L)
{
    SCDynamicStoreKeyCreateHostNames(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateLocation(lua_State *L)
{
    SCDynamicStoreKeyCreateLocation(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateLocation(lua_State *L)
{
    SCDynamicStoreKeyCreateLocation(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateProxies(lua_State *L)
{
    SCDynamicStoreKeyCreateProxies(lua_touserdata(L, 1));
    return 1;
}

static int lua_SCDynamicStoreKeyCreateProxies(lua_State *L)
{
    SCDynamicStoreKeyCreateProxies(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSCDynamicStoreKeyAPIs[] = {
    {"SCDynamicStoreKeyCreate", lua_SCDynamicStoreKeyCreate},
    {"SCDynamicStoreKeyCreate", lua_SCDynamicStoreKeyCreate},
    {"SCDynamicStoreKeyCreate", lua_SCDynamicStoreKeyCreate},
    {"SCDynamicStoreKeyCreateNetworkGlobalEntity", lua_SCDynamicStoreKeyCreateNetworkGlobalEntity},
    {"SCDynamicStoreKeyCreateNetworkGlobalEntity", lua_SCDynamicStoreKeyCreateNetworkGlobalEntity},
    {"SCDynamicStoreKeyCreateNetworkInterface", lua_SCDynamicStoreKeyCreateNetworkInterface},
    {"SCDynamicStoreKeyCreateNetworkInterface", lua_SCDynamicStoreKeyCreateNetworkInterface},
    {"SCDynamicStoreKeyCreateNetworkInterfaceEntity", lua_SCDynamicStoreKeyCreateNetworkInterfaceEntity},
    {"SCDynamicStoreKeyCreateNetworkInterfaceEntity", lua_SCDynamicStoreKeyCreateNetworkInterfaceEntity},
    {"SCDynamicStoreKeyCreateNetworkServiceEntity", lua_SCDynamicStoreKeyCreateNetworkServiceEntity},
    {"SCDynamicStoreKeyCreateNetworkServiceEntity", lua_SCDynamicStoreKeyCreateNetworkServiceEntity},
    {"SCDynamicStoreKeyCreateComputerName", lua_SCDynamicStoreKeyCreateComputerName},
    {"SCDynamicStoreKeyCreateComputerName", lua_SCDynamicStoreKeyCreateComputerName},
    {"SCDynamicStoreKeyCreateConsoleUser", lua_SCDynamicStoreKeyCreateConsoleUser},
    {"SCDynamicStoreKeyCreateConsoleUser", lua_SCDynamicStoreKeyCreateConsoleUser},
    {"SCDynamicStoreKeyCreateHostNames", lua_SCDynamicStoreKeyCreateHostNames},
    {"SCDynamicStoreKeyCreateHostNames", lua_SCDynamicStoreKeyCreateHostNames},
    {"SCDynamicStoreKeyCreateLocation", lua_SCDynamicStoreKeyCreateLocation},
    {"SCDynamicStoreKeyCreateLocation", lua_SCDynamicStoreKeyCreateLocation},
    {"SCDynamicStoreKeyCreateProxies", lua_SCDynamicStoreKeyCreateProxies},
    {"SCDynamicStoreKeyCreateProxies", lua_SCDynamicStoreKeyCreateProxies},
    {NULL, NULL},
};

int LuaOpenSCDynamicStoreKey(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSCDynamicStoreKeyAPIs);
    return 0;
}
