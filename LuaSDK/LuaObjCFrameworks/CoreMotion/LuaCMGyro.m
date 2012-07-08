//
//  LuaCMGyro.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCMGyro.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CMGyroData(lua_State *L)
{
    CMGyroData(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCMGyroAPIs[] = {
    {"CMGyroData", lua_CMGyroData},
    {NULL, NULL},
};

int LuaOpenCMGyro(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCMGyroAPIs);
    return 0;
}
