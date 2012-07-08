//
//  LuaNSManagedObjectContext.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSManagedObjectContext.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_NSManagedObjectContextWillSaveNotification(lua_State *L)
{
    NSManagedObjectContextWillSaveNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectContextDidSaveNotification(lua_State *L)
{
    NSManagedObjectContextDidSaveNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectContextObjectsDidChangeNotification(lua_State *L)
{
    NSManagedObjectContextObjectsDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectContextObjectsDidChangeNotification(lua_State *L)
{
    NSManagedObjectContextObjectsDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectContextObjectsDidChangeNotification(lua_State *L)
{
    NSManagedObjectContextObjectsDidChangeNotification(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectContextConcurrencyType(lua_State *L)
{
    NSManagedObjectContextConcurrencyType(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectContextConcurrencyType(lua_State *L)
{
    NSManagedObjectContextConcurrencyType(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectContextConcurrencyType(lua_State *L)
{
    NSManagedObjectContextConcurrencyType(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectContextDidSaveNotification(lua_State *L)
{
    NSManagedObjectContextDidSaveNotification(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaNSManagedObjectContextAPIs[] = {
    {"NSManagedObjectContextWillSaveNotification", lua_NSManagedObjectContextWillSaveNotification},
    {"NSManagedObjectContextDidSaveNotification", lua_NSManagedObjectContextDidSaveNotification},
    {"NSManagedObjectContextObjectsDidChangeNotification", lua_NSManagedObjectContextObjectsDidChangeNotification},
    {"NSManagedObjectContextObjectsDidChangeNotification", lua_NSManagedObjectContextObjectsDidChangeNotification},
    {"NSManagedObjectContextObjectsDidChangeNotification", lua_NSManagedObjectContextObjectsDidChangeNotification},
    {"NSManagedObjectContextConcurrencyType", lua_NSManagedObjectContextConcurrencyType},
    {"NSManagedObjectContextConcurrencyType", lua_NSManagedObjectContextConcurrencyType},
    {"NSManagedObjectContextConcurrencyType", lua_NSManagedObjectContextConcurrencyType},
    {"NSManagedObjectContextDidSaveNotification", lua_NSManagedObjectContextDidSaveNotification},
    {NULL, NULL},
};

int LuaOpenNSManagedObjectContext(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSManagedObjectContextAPIs);
    return 0;
}
