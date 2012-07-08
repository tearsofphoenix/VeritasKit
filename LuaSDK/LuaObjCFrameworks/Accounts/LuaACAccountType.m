//
//  LuaACAccountType.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaACAccountType.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_ACAccountTypeIdentifierTwitter(lua_State *L)
{
    ACAccountTypeIdentifierTwitter(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaACAccountTypeAPIs[] = {
    {"ACAccountTypeIdentifierTwitter", lua_ACAccountTypeIdentifierTwitter},
    {NULL, NULL},
};

int LuaOpenACAccountType(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaACAccountTypeAPIs);
    return 0;
}
