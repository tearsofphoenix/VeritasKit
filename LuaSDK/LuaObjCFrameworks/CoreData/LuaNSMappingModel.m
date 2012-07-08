//
//  LuaNSMappingModel.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSMappingModel.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luaNSMappingModelAPIs[] = {
    {NULL, NULL},
};

int LuaOpenNSMappingModel(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSMappingModelAPIs);
    return 0;
}
