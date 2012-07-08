//
//  LuaCoreData.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaCoreData.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_CoreDataDefines(lua_State *L)
{
    CoreDataDefines(lua_touserdata(L, 1));
    return 1;
}

static int lua_CoreDataErrors(lua_State *L)
{
    CoreDataErrors(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaCoreDataAPIs[] = {
    {"CoreDataDefines", lua_CoreDataDefines},
    {"CoreDataErrors", lua_CoreDataErrors},
    {NULL, NULL},
};

int LuaOpenCoreData(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaCoreDataAPIs);
    return 0;
}
