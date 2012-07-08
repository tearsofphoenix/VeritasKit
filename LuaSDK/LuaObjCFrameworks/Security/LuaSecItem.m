//
//  LuaSecItem.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSecItem.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_SecItemCopyMatching(lua_State *L)
{
    SecItemCopyMatching(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemAdd(lua_State *L)
{
    SecItemAdd(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemUpdate(lua_State *L)
{
    SecItemUpdate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemDelete(lua_State *L)
{
    SecItemDelete(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemAdd(lua_State *L)
{
    SecItemAdd(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemCopyMatching(lua_State *L)
{
    SecItemCopyMatching(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemCopyMatching(lua_State *L)
{
    SecItemCopyMatching(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemCopyMatching(lua_State *L)
{
    SecItemCopyMatching(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemCopyMatching(lua_State *L)
{
    SecItemCopyMatching(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemAdd(lua_State *L)
{
    SecItemAdd(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemCopyMatching(lua_State *L)
{
    SecItemCopyMatching(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemCopyMatching(lua_State *L)
{
    SecItemCopyMatching(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemAdd(lua_State *L)
{
    SecItemAdd(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemAdd(lua_State *L)
{
    SecItemAdd(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemUpdate(lua_State *L)
{
    SecItemUpdate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemUpdate(lua_State *L)
{
    SecItemUpdate(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemDelete(lua_State *L)
{
    SecItemDelete(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemCopyMatching(lua_State *L)
{
    SecItemCopyMatching(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemCopyMatching(lua_State *L)
{
    SecItemCopyMatching(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemAdd(lua_State *L)
{
    SecItemAdd(lua_touserdata(L, 1));
    return 1;
}

static int lua_SecItemDelete(lua_State *L)
{
    SecItemDelete(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaSecItemAPIs[] = {
    {"SecItemCopyMatching", lua_SecItemCopyMatching},
    {"SecItemAdd", lua_SecItemAdd},
    {"SecItemUpdate", lua_SecItemUpdate},
    {"SecItemDelete", lua_SecItemDelete},
    {"SecItemAdd", lua_SecItemAdd},
    {"SecItemCopyMatching", lua_SecItemCopyMatching},
    {"SecItemCopyMatching", lua_SecItemCopyMatching},
    {"SecItemCopyMatching", lua_SecItemCopyMatching},
    {"SecItemCopyMatching", lua_SecItemCopyMatching},
    {"SecItemAdd", lua_SecItemAdd},
    {"SecItemCopyMatching", lua_SecItemCopyMatching},
    {"SecItemCopyMatching", lua_SecItemCopyMatching},
    {"SecItemAdd", lua_SecItemAdd},
    {"SecItemAdd", lua_SecItemAdd},
    {"SecItemUpdate", lua_SecItemUpdate},
    {"SecItemUpdate", lua_SecItemUpdate},
    {"SecItemDelete", lua_SecItemDelete},
    {"SecItemCopyMatching", lua_SecItemCopyMatching},
    {"SecItemCopyMatching", lua_SecItemCopyMatching},
    {"SecItemAdd", lua_SecItemAdd},
    {"SecItemDelete", lua_SecItemDelete},
    {NULL, NULL},
};

int LuaOpenSecItem(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSecItemAPIs);
    return 0;
}
