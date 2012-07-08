//
//  LuaEventKit.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaEventKit.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_EventKitDefines(lua_State *L)
{
    EventKitDefines(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaEventKitAPIs[] = {
    {"EventKitDefines", lua_EventKitDefines},
    {NULL, NULL},
};

int LuaOpenEventKit(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaEventKitAPIs);
    return 0;
}
