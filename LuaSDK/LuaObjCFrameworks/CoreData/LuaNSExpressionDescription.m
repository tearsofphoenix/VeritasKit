//
//  LuaNSExpressionDescription.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSExpressionDescription.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_NSExpressionDescriptions(lua_State *L)
{
    NSExpressionDescriptions(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaNSExpressionDescriptionAPIs[] = {
    {"NSExpressionDescriptions", lua_NSExpressionDescriptions},
    {NULL, NULL},
};

int LuaOpenNSExpressionDescription(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSExpressionDescriptionAPIs);
    return 0;
}
