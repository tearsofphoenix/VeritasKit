//
//  LuaCMMagnetometer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCMMagnetometer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CMMagnetometerData(lua_State *L)
{
    CMMagnetometerData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMMagnetometerData(lua_State *L)
{
    CMMagnetometerData(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCMMagnetometerAPIs[] = {
    {"CMMagnetometerData", lua_CMMagnetometerData},
    {"CMMagnetometerData", lua_CMMagnetometerData},
    {NULL, NULL},
};

int LuaOpenCMMagnetometer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCMMagnetometerAPIs);
    return 0;
}
