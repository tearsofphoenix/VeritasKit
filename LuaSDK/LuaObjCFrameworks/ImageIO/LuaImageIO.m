//
//  LuaImageIO.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaImageIO.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_ImageIOBase(lua_State *L)
{
    ImageIOBase(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaImageIOAPIs[] = {
    {"ImageIOBase", lua_ImageIOBase},
    {NULL, NULL},
};

int LuaOpenImageIO(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaImageIOAPIs);
    return 0;
}
