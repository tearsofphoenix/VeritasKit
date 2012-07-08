//
//  LuaCMAccelerometer.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCMAccelerometer.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CMAccelerometerData(lua_State *L)
{
    CMAccelerometerData(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMAccelerometerData(lua_State *L)
{
    CMAccelerometerData(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCMAccelerometerAPIs[] = {
    {"CMAccelerometerData", lua_CMAccelerometerData},
    {"CMAccelerometerData", lua_CMAccelerometerData},
    {NULL, NULL},
};

int LuaOpenCMAccelerometer(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCMAccelerometerAPIs);
    return 0;
}
