//
//  LuaEKEventEditViewController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaEKEventEditViewController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luaEKEventEditViewControllerAPIs[] = {
    {NULL, NULL},
};

int LuaOpenEKEventEditViewController(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaEKEventEditViewControllerAPIs);
    return 0;
}
