//
//  LuaSFNTLayoutTypes.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaSFNTLayoutTypes.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luaSFNTLayoutTypesAPIs[] = {
    {NULL, NULL},
};

int LuaOpenSFNTLayoutTypes(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaSFNTLayoutTypesAPIs);
    return 0;
}
