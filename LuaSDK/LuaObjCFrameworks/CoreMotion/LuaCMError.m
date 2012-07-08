//
//  LuaCMError.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCMError.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CMErrorNULL(lua_State *L)
{
    CMErrorNULL(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMErrorDeviceRequiresMovement(lua_State *L)
{
    CMErrorDeviceRequiresMovement(lua_touserdata(L, 1));
    return 1;
}

static int lua_CMErrorTrueNorthNotAvailable(lua_State *L)
{
    CMErrorTrueNorthNotAvailable(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCMErrorAPIs[] = {
    {"CMErrorNULL", lua_CMErrorNULL},
    {"CMErrorDeviceRequiresMovement", lua_CMErrorDeviceRequiresMovement},
    {"CMErrorTrueNorthNotAvailable", lua_CMErrorTrueNorthNotAvailable},
    {NULL, NULL},
};

int LuaOpenCMError(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCMErrorAPIs);
    return 0;
}
