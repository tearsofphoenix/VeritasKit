//
//  Luagssapi_spnego.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "Luagssapi_spnego.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luagssapi_spnegoAPIs[] = {
    {NULL, NULL},
};

int LuaOpengssapi_spnego(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __Luagssapi_spnegoAPIs);
    return 0;
}
