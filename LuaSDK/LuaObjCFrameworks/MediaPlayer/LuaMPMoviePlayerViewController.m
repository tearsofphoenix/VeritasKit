//
//  LuaMPMoviePlayerViewController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMPMoviePlayerViewController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luaMPMoviePlayerViewControllerAPIs[] = {
    {NULL, NULL},
};

int LuaOpenMPMoviePlayerViewController(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMPMoviePlayerViewControllerAPIs);
    return 0;
}
