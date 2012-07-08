//
//  LuaNSEntityMigrationPolicy.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSEntityMigrationPolicy.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luaNSEntityMigrationPolicyAPIs[] = {
    {NULL, NULL},
};

int LuaOpenNSEntityMigrationPolicy(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSEntityMigrationPolicyAPIs);
    return 0;
}
