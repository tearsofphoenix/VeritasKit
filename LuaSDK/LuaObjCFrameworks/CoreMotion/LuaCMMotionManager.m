//
//  LuaCMMotionManager.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCMMotionManager.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static const luaL_Reg __luaCMMotionManagerAPIs[] = {
    {NULL, NULL},
};

int LuaOpenCMMotionManager(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCMMotionManagerAPIs);
    return 0;
}
