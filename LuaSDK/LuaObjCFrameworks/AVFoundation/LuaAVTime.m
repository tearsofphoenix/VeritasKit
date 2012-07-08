//
//  LuaAVTime.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAVTime.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AVTimeCoding(lua_State *L)
{
    AVTimeCoding(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAVTimeAPIs[] = {
    {"AVTimeCoding", lua_AVTimeCoding},
    {NULL, NULL},
};

int LuaOpenAVTime(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAVTimeAPIs);
    return 0;
}
