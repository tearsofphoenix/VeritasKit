//
//  LuaNSManagedObject.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "LuaNSManagedObject.h"
#import "lapi.h"
#import "lauxlib.h"
#import "LuaObjCInternal.h"

static int lua_NSManagedObjectContext(lua_State *L)
{
    NSManagedObjectContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectID(lua_State *L)
{
    NSManagedObjectID(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectContext(lua_State *L)
{
    NSManagedObjectContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectID(lua_State *L)
{
    NSManagedObjectID(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectContext(lua_State *L)
{
    NSManagedObjectContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectContext(lua_State *L)
{
    NSManagedObjectContext(lua_touserdata(L, 1));
    return 1;
}

static int lua_NSManagedObjectID(lua_State *L)
{
    NSManagedObjectID(lua_touserdata(L, 1));
    return 1;
}

static const luaL_Reg __luaNSManagedObjectAPIs[] = {
    {"NSManagedObjectContext", lua_NSManagedObjectContext},
    {"NSManagedObjectID", lua_NSManagedObjectID},
    {"NSManagedObjectContext", lua_NSManagedObjectContext},
    {"NSManagedObjectID", lua_NSManagedObjectID},
    {"NSManagedObjectContext", lua_NSManagedObjectContext},
    {"NSManagedObjectContext", lua_NSManagedObjectContext},
    {"NSManagedObjectID", lua_NSManagedObjectID},
    {NULL, NULL},
};

int LuaOpenNSManagedObject(lua_State *L)
{
    luaObjC_loadGlobalFunctions(L, __LuaNSManagedObjectAPIs);
    return 0;
}
