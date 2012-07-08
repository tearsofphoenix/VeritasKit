//
//  Luagssapi.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "Luagssapi.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_gssapi_spi(lua_State *L)
{
    gssapi_spi(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luagssapiAPIs[] = {
    {"gssapi_spi", lua_gssapi_spi},
    {NULL, NULL},
};

int LuaOpengssapi(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuagssapiAPIs);
    return 0;
}
