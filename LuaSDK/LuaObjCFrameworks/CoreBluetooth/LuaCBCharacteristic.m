//
//  LuaCBCharacteristic.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCBCharacteristic.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CBCharacteristicProperties(lua_State *L)
{
    CBCharacteristicProperties(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCharacteristicPropertyBroadcast(lua_State *L)
{
    CBCharacteristicPropertyBroadcast(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCharacteristicPropertyRead(lua_State *L)
{
    CBCharacteristicPropertyRead(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCharacteristicPropertyWriteWithoutResponse(lua_State *L)
{
    CBCharacteristicPropertyWriteWithoutResponse(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCharacteristicPropertyWrite(lua_State *L)
{
    CBCharacteristicPropertyWrite(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCharacteristicPropertyNotify(lua_State *L)
{
    CBCharacteristicPropertyNotify(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCharacteristicPropertyIndicate(lua_State *L)
{
    CBCharacteristicPropertyIndicate(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCharacteristicPropertyAuthenticatedSignedWrites(lua_State *L)
{
    CBCharacteristicPropertyAuthenticatedSignedWrites(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCharacteristicPropertyExtendedProperties(lua_State *L)
{
    CBCharacteristicPropertyExtendedProperties(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCharacteristicProperties(lua_State *L)
{
    CBCharacteristicProperties(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCharacteristicProperties(lua_State *L)
{
    CBCharacteristicProperties(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBCharacteristicProperties(lua_State *L)
{
    CBCharacteristicProperties(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCBCharacteristicAPIs[] = {
    {"CBCharacteristicProperties", lua_CBCharacteristicProperties},
    {"CBCharacteristicPropertyBroadcast", lua_CBCharacteristicPropertyBroadcast},
    {"CBCharacteristicPropertyRead", lua_CBCharacteristicPropertyRead},
    {"CBCharacteristicPropertyWriteWithoutResponse", lua_CBCharacteristicPropertyWriteWithoutResponse},
    {"CBCharacteristicPropertyWrite", lua_CBCharacteristicPropertyWrite},
    {"CBCharacteristicPropertyNotify", lua_CBCharacteristicPropertyNotify},
    {"CBCharacteristicPropertyIndicate", lua_CBCharacteristicPropertyIndicate},
    {"CBCharacteristicPropertyAuthenticatedSignedWrites", lua_CBCharacteristicPropertyAuthenticatedSignedWrites},
    {"CBCharacteristicPropertyExtendedProperties", lua_CBCharacteristicPropertyExtendedProperties},
    {"CBCharacteristicProperties", lua_CBCharacteristicProperties},
    {"CBCharacteristicProperties", lua_CBCharacteristicProperties},
    {"CBCharacteristicProperties", lua_CBCharacteristicProperties},
    {NULL, NULL},
};

int LuaOpenCBCharacteristic(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCBCharacteristicAPIs);
    return 0;
}
