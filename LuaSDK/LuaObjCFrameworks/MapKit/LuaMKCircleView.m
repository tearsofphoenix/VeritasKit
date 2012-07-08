//
//  LuaMKCircleView.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaMKCircleView.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luaMKCircleViewAPIs[] = {
    {NULL, NULL},
};

int LuaOpenMKCircleView(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaMKCircleViewAPIs);
    return 0;
}
