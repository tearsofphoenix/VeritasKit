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

#define LUACOCOA_OBJECT_GLOBAL_WEAK_TABLE_ID "Veritas.GlobalWeakTable"

static void _luaObjC_createTableWithID(lua_State *lua_state, const char *tableID, bool isWeakTable)
{
	lua_pushstring(lua_state, tableID);
	
	lua_newtable(lua_state);
	lua_pushvalue(lua_state, -1);  // table is its own metatable
	lua_setmetatable(lua_state, -2);
    if (isWeakTable)
    {
        lua_pushliteral(lua_state, "__mode");
        lua_pushliteral(lua_state, "kv"); // make values weak, I don't think lightuserdata is strong ref'd so 'k' is optional.
        lua_settable(lua_state, -3);   // metatable.__mode = "v"
    }
	
	// Now that we've created a new table, put it in the global registry
	lua_settable(lua_state, LUA_REGISTRYINDEX); /* registry[LUACOCOA_OBJECT_GLOBAL_WEAK_TABLE_ID] = weak_table */
	
}

static void _luaObjC_insertObjectInTableWithID(lua_State *lua_state, const char *tableID, void *object, const char *key)
{
    lua_getfield(lua_state, LUA_REGISTRYINDEX, tableID); // puts the global weak table on top of the stack
	
	lua_pushlightuserdata(lua_state, object); // stack: [object_ptr weak_table]
	lua_setfield(lua_state, -2, key);
	
	// table is still on top of stack. Don't forget to pop it now that we are done with it
	lua_pop(lua_state, 1);
}

static void* _luaObjC_getObjectInTableWithID(lua_State *lua_state, const char* tableID, const char* key)
{
    lua_getfield(lua_state, LUA_REGISTRYINDEX, tableID); // puts the global weak table on top of the stack
	lua_getfield(lua_state, -1, key);

	if(lua_isnil(lua_state, -1))
	{
		return NULL;
	}
	else
	{
		return lua_touserdata(lua_state, -1);
	}
}

#define LUACOCOA_OBJECT_GLOBAL_STRONG_TABLE_ID "LuaCocoa.GlobalStrongTable"

void _luaObjCCacheTableCreate(lua_State* lua_state)
{
    _luaObjC_createTableWithID(lua_state, LUACOCOA_OBJECT_GLOBAL_STRONG_TABLE_ID, false);
}

void _luaObjCCacheTableInsertObjectForKey(lua_State* lua_state, void* object, const char *key)
{
    _luaObjC_insertObjectInTableWithID(lua_state, LUACOCOA_OBJECT_GLOBAL_STRONG_TABLE_ID, object, key);
}

void* _luaObjCCacheTableGetObjectForKey(lua_State* lua_state, const char* key)
{
    return _luaObjC_getObjectInTableWithID(lua_state, LUACOCOA_OBJECT_GLOBAL_STRONG_TABLE_ID, key);
}


