//
//  LuaoalMacOSX_OALExtensions.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaoalMacOSX_OALExtensions.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luaoalMacOSX_OALExtensionsAPIs[] = {
    {NULL, NULL},
};

int LuaOpenoalMacOSX_OALExtensions(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaoalMacOSX_OALExtensionsAPIs);
    return 0;
}
