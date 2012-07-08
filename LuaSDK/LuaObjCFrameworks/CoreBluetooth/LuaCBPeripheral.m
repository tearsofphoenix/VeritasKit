//
//  LuaCBPeripheral.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCBPeripheral.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CBPeripheralDelegate(lua_State *L)
{
    CBPeripheralDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBPeripheralDelegate(lua_State *L)
{
    CBPeripheralDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBPeripheralDelegate(lua_State *L)
{
    CBPeripheralDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBPeripheralDelegate(lua_State *L)
{
    CBPeripheralDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBPeripheralDelegate(lua_State *L)
{
    CBPeripheralDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCBPeripheralAPIs[] = {
    {"CBPeripheralDelegate", lua_CBPeripheralDelegate},
    {"CBPeripheralDelegate", lua_CBPeripheralDelegate},
    {"CBPeripheralDelegate", lua_CBPeripheralDelegate},
    {"CBPeripheralDelegate", lua_CBPeripheralDelegate},
    {"CBPeripheralDelegate", lua_CBPeripheralDelegate},
    {NULL, NULL},
};

int LuaOpenCBPeripheral(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCBPeripheralAPIs);
    return 0;
}
