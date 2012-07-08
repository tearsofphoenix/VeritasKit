//
//  LuaAccounts.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaAccounts.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_AccountsDefines(lua_State *L)
{
    AccountsDefines(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaAccountsAPIs[] = {
    {"AccountsDefines", lua_AccountsDefines},
    {NULL, NULL},
};

int LuaOpenAccounts(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaAccountsAPIs);
    return 0;
}
