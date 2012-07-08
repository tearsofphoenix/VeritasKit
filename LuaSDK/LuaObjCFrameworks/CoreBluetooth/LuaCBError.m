//
//  LuaCBError.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCBError.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CBErrorDomain(lua_State *L)
{
    CBErrorDomain(lua_touserdata(L, 1));
    return 1;
}

static int lua_CBErrorUnknown(lua_State *L)
{
    CBErrorUnknown(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCBErrorAPIs[] = {
    {"CBErrorDomain", lua_CBErrorDomain},
    {"CBErrorUnknown", lua_CBErrorUnknown},
    {NULL, NULL},
};

int LuaOpenCBError(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCBErrorAPIs);
    return 0;
}
