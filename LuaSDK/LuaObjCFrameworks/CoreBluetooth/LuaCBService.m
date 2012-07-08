//
//  LuaCBService.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCBService.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CBServices(lua_State *L)
{
    CBServices(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCBServiceAPIs[] = {
    {"CBServices", lua_CBServices},
    {NULL, NULL},
};

int LuaOpenCBService(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCBServiceAPIs);
    return 0;
}
