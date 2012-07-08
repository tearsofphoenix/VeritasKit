//
//  LuaEventKitUI.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaEventKitUI.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_EventKitUIDefines(lua_State *L)
{
    EventKitUIDefines(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaEventKitUIAPIs[] = {
    {"EventKitUIDefines", lua_EventKitUIDefines},
    {NULL, NULL},
};

int LuaOpenEventKitUI(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaEventKitUIAPIs);
    return 0;
}
