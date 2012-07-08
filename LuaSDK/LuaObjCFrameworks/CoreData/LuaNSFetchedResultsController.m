//
//  LuaNSFetchedResultsController.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSFetchedResultsController.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_NSFetchedResultsControllerDelegate(lua_State *L)
{
    NSFetchedResultsControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSFetchedResultsControllerDelegate(lua_State *L)
{
    NSFetchedResultsControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSFetchedResultsControllerDelegate(lua_State *L)
{
    NSFetchedResultsControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSFetchedResultsControllerDelegate(lua_State *L)
{
    NSFetchedResultsControllerDelegate(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaNSFetchedResultsControllerAPIs[] = {
    {"NSFetchedResultsControllerDelegate", lua_NSFetchedResultsControllerDelegate},
    {"NSFetchedResultsControllerDelegate", lua_NSFetchedResultsControllerDelegate},
    {"NSFetchedResultsControllerDelegate", lua_NSFetchedResultsControllerDelegate},
    {"NSFetchedResultsControllerDelegate", lua_NSFetchedResultsControllerDelegate},
    {NULL, NULL},
};

int LuaOpenNSFetchedResultsController(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSFetchedResultsControllerAPIs);
    return 0;
}
