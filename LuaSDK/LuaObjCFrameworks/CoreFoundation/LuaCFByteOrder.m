//
//  LuaCFByteOrder.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCFByteOrder.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CFByteOrderUnknown(lua_State *L)
{
    CFByteOrderUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFByteOrderLittleEndian(lua_State *L)
{
    CFByteOrderLittleEndian(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFByteOrderBigEndian(lua_State *L)
{
    CFByteOrderBigEndian(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFByteOrderGetCurrent(lua_State *L)
{
    CFByteOrderGetCurrent(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFByteOrderLittleEndian(lua_State *L)
{
    CFByteOrderLittleEndian(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFByteOrderBigEndian(lua_State *L)
{
    CFByteOrderBigEndian(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFByteOrderUnknown(lua_State *L)
{
    CFByteOrderUnknown(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFByteOrderLittleEndian(lua_State *L)
{
    CFByteOrderLittleEndian(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFByteOrderBigEndian(lua_State *L)
{
    CFByteOrderBigEndian(lua_touserdata(L, 1));
    return 1;
}

static int lua_CFByteOrderUnknown(lua_State *L)
{
    CFByteOrderUnknown(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCFByteOrderAPIs[] = {
    {"CFByteOrderUnknown", lua_CFByteOrderUnknown},
    {"CFByteOrderLittleEndian", lua_CFByteOrderLittleEndian},
    {"CFByteOrderBigEndian", lua_CFByteOrderBigEndian},
    {"CFByteOrderGetCurrent", lua_CFByteOrderGetCurrent},
    {"CFByteOrderLittleEndian", lua_CFByteOrderLittleEndian},
    {"CFByteOrderBigEndian", lua_CFByteOrderBigEndian},
    {"CFByteOrderUnknown", lua_CFByteOrderUnknown},
    {"CFByteOrderLittleEndian", lua_CFByteOrderLittleEndian},
    {"CFByteOrderBigEndian", lua_CFByteOrderBigEndian},
    {"CFByteOrderUnknown", lua_CFByteOrderUnknown},
    {NULL, NULL},
};

int LuaOpenCFByteOrder(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCFByteOrderAPIs);
    return 0;
}
