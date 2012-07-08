//
//  LuaNSFetchRequestExpression.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSFetchRequestExpression.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_NSFetchRequestExpressionType(lua_State *L)
{
    NSFetchRequestExpressionType(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaNSFetchRequestExpressionAPIs[] = {
    {"NSFetchRequestExpressionType", lua_NSFetchRequestExpressionType},
    {NULL, NULL},
};

int LuaOpenNSFetchRequestExpression(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSFetchRequestExpressionAPIs);
    return 0;
}
