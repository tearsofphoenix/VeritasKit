//
//  LuaMPMediaQuery.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMPMediaQuery.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_MPMediaQuerySection(lua_State *L)
{
    MPMediaQuerySection(lua_touserdata(L, 1));
    return 1;
}

static int lua_MPMediaQueryAdditions(lua_State *L)
{
    MPMediaQueryAdditions(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaMPMediaQueryAPIs[] = {
    {"MPMediaQuerySection", lua_MPMediaQuerySection},
    {"MPMediaQueryAdditions", lua_MPMediaQueryAdditions},
    {NULL, NULL},
};

int LuaOpenMPMediaQuery(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMPMediaQueryAPIs);
    return 0;
}
