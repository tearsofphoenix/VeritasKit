//
//  LuaExternalAccessory.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaExternalAccessory.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_ExternalAccessoryDefines(lua_State *L)
{
    ExternalAccessoryDefines(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaExternalAccessoryAPIs[] = {
    {"ExternalAccessoryDefines", lua_ExternalAccessoryDefines},
    {NULL, NULL},
};

int LuaOpenExternalAccessory(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaExternalAccessoryAPIs);
    return 0;
}
