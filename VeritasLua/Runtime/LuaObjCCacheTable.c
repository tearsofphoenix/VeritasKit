//
//  LuaObjCRecordTable.m
//  LuaCocoa
//
//  Created by Eric Wing on 11/11/09.
//  Copyright 2009 PlayControl Software, LLC. All rights reserved.
//

#include "LuaObjCCacheTable.h"
#include "lua.h"
#include <stdbool.h>

static void _luaObjC_createTableWithID(lua_State *L, const char *tableID, bool isWeakTable)
{
	lua_pushstring(L, tableID);
	
	lua_newtable(L);
	lua_pushvalue(L, -1);  // table is its own metatable
	lua_setmetatable(L, -2);
    
    if (isWeakTable)
    {
        lua_pushliteral(L, "__mode");
        lua_pushliteral(L, "kv"); // make values weak, I don't think lightuserdata is strong ref'd so 'k' is optional.
        lua_settable(L, -3);   // metatable.__mode = "v"
    }
	
	// Now that we've created a new table, put it in the global registry
	lua_settable(L, LUA_REGISTRYINDEX);
	
}

static void _luaObjC_insertObjectInTableWithID(lua_State *L, const char *tableID, void *object, const char *key)
{
    lua_getfield(L, LUA_REGISTRYINDEX, tableID); // puts the global weak table on top of the stack
	
	lua_pushlightuserdata(L, object); // stack: [object table]
	lua_setfield(L, -2, key);
	
	// table is still on top of stack. Don't forget to pop it now that we are done with it
	lua_pop(L, 1);
}

static void* _luaObjC_getObjectInTableWithID(lua_State *L, const char* tableID, const char* key)
{
    lua_getfield(L, LUA_REGISTRYINDEX, tableID);
	lua_getfield(L, -1, key);

	if(lua_isnil(L, -1))
	{
		return NULL;
        
	}else
	{
		return lua_touserdata(L, -1);
	}
}

static const char* LuaObjCGlobalCacheTableID = "com.veritas.lua-objc.global.cachetable";

void LuaObjCCacheTableInitialize(lua_State* L)
{
    _luaObjC_createTableWithID(L, LuaObjCGlobalCacheTableID, false);
}

void LuaObjCCacheTableInsertObjectForKey(lua_State* L, void* object, const char *key)
{
    _luaObjC_insertObjectInTableWithID(L, LuaObjCGlobalCacheTableID, object, key);
}

void* LuaObjCCacheTableGetObjectForKey(lua_State* L, const char* key)
{
    return _luaObjC_getObjectInTableWithID(L, LuaObjCGlobalCacheTableID, key);
}


