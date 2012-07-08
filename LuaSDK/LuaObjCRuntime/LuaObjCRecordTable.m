//
//  LuaObjCRecordTable.m
//  LuaCocoa
//
//  Created by Eric Wing on 11/11/09.
//  Copyright 2009 PlayControl Software, LLC. All rights reserved.
//

#include "LuaObjCRecordTable.h"
#include "lua.h"

#define LUACOCOA_OBJECT_GLOBAL_WEAK_TABLE_ID "Veritas.GlobalWeakTable"

// Maps lightuserdata to (weak) container objects holding NSObjects, selectors, 
// and anything that has userdata containers around pointers.
// Allows for having unique containers (i.e. for the same NSObject, reuse the same containers)
static void _luaObjC_createWeakTableWithID(lua_State *lua_state, const char *tableID, bool isWeakTable)
{
	lua_pushstring(lua_state, tableID);
	
	// Now create (push) our weak table
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

static void _luaObjC_insertObjectInTableWithID(lua_State *lua_state, const char *tableID, int index, void *object)
{
    lua_getfield(lua_state, LUA_REGISTRYINDEX, tableID); // puts the global weak table on top of the stack
	
	lua_pushlightuserdata(lua_state, object); // stack: [object_ptr weak_table]
	if(index < 0)
	{
		// Because we pushed more items on the stack, we need to compensate for the changed relative stack index
		lua_pushvalue(lua_state, index - 2); // stack: [userdata_container object_ptr weak_table]
	}
	else
	{
		// absolute stack positions don't change
		lua_pushvalue(lua_state, index); // stack: [userdata_container object_ptr weak_table]	
	}
	
	lua_settable(lua_state, -3); // weak_table[object_ptr] = userdata_container
	
	// table is still on top of stack. Don't forget to pop it now that we are done with it
	lua_pop(lua_state, 1);
}

static void* _luaObjC_getObjectInTableWithID(lua_State *lua_state, const char* tableID, void* key)
{
    lua_getfield(lua_state, LUA_REGISTRYINDEX, tableID); // puts the global weak table on top of the stack
	
	lua_pushlightuserdata(lua_state, key); // stack: [weak_table the_object_ptr]
	lua_gettable(lua_state, -2); // get weak_table[the_object], stack: [weak_table lua_object_container_userdata]
	
	// Either nil or the lua_object_container is on the top of the stack.
	// But the weaktable is still underneath it.
	// Since I'm modifying the stack, I want to hide the weak_table as an implementation detail
	// and return so there is only 1 new item on the stack (not two). So replace the weak_table
	// with my return value and pop.
	lua_replace(lua_state, -2); // takes the top item and replaces the item at index -2 with it and pops
	
	if(lua_isnil(lua_state, -1))
	{
		return NULL;
	}
	else
	{
		return lua_touserdata(lua_state, -1);
	}
}

void luaObjCWeakTableCreateGlobalWeakObjectTable(lua_State* lua_state)
{
	// Push our key for the global registry for our weak table (so we can fetch the table later)
    _luaObjC_createWeakTableWithID(lua_state, LUACOCOA_OBJECT_GLOBAL_WEAK_TABLE_ID, true);
    
}

/**
 * #stack_position_of_userdata Where the userdata (LuaUserDataContainerForObject*) for the new object is in the Lua stack.
 * @the_object The raw Objective-C object/pointer (no lua container). Will use as the key (light userdata) the weak table.
 * Object is defined loosely as we currently use anything with a container including NSObjects and selectors.
 * I think it will actually work with any thing that is a pointer.
 */
void luaObjCWeakTableInsertObjectInGlobalWeakTable(lua_State* lua_state, int stack_position_of_userdata, void* the_object)
{
    _luaObjC_insertObjectInTableWithID(lua_state, LUACOCOA_OBJECT_GLOBAL_WEAK_TABLE_ID, stack_position_of_userdata, the_object);
}



/* Leaves result on the stack. Don't forget to pop when done.
 */
void* luaObjCWeakTableGetObjectInGlobalWeakTable(lua_State* lua_state, void* key)
{
    return _luaObjC_getObjectInTableWithID(lua_state, LUACOCOA_OBJECT_GLOBAL_WEAK_TABLE_ID, key);
}


#define LUACOCOA_OBJECT_GLOBAL_STRONG_TABLE_ID "LuaCocoa.GlobalStrongTable"
#define LUACOCOA_OBJECT_GLOBAL_STRONG_TABLE_FOR_ENVIRONMENT_TABLES_FOR_LUASUBCLASSES_ID "LuaCocoa.GlobalStrongTable.ForEnvironmentTablesForLuaSubclasses"
#define LUACOCOA_OBJECT_GLOBAL_TABLE_FOR_ENVIRONMENT_TABLES_FOR_LUASUBCLASSES_FOR_INNER_NONPROXY_ID "LuaCocoa.GlobalTable.ForEnvironmentTablesForLuaSubclassesForInnerNonProxy"


// Maps lightuserdata to (weak) container objects holding NSObjects, selectors, 
// and anything that has userdata containers around pointers.
// Allows for having unique containers (i.e. for the same NSObject, reuse the same containers)
void luaObjCStrongTableCreateGlobalStrongObjectTable(lua_State* lua_state)
{
    _luaObjC_createWeakTableWithID(lua_state, LUACOCOA_OBJECT_GLOBAL_STRONG_TABLE_ID, false);
    _luaObjC_createWeakTableWithID(lua_state, LUACOCOA_OBJECT_GLOBAL_STRONG_TABLE_FOR_ENVIRONMENT_TABLES_FOR_LUASUBCLASSES_ID, false);

	// HACK: I am normally expecting to put LuaCocoaProxyObject's in this table.
	// But I have a corner case for super where the object is not in the wrapper, but I still want to be able to get the
	// environmental table. So, for this case, I will also put the inner object in the table as a key 
	// if the object is a LuaCocoaProxyObject.
	
	// Push our key for the global registry for our weak table (so we can fetch the table later)
	// I am using a weak table because for non-proxy objects, I am a little worried about those objects not cleaning up after themselves.
	// My theory is that there should be a Proxy object with real environmental table already, so I just need to be able to find it.
	// If this isn't true, then the table risks being collected before we have a strong reference to it which may be a bug
	// (depending if there is useful information in the table or just an empty table).
    _luaObjC_createWeakTableWithID(lua_state, LUACOCOA_OBJECT_GLOBAL_TABLE_FOR_ENVIRONMENT_TABLES_FOR_LUASUBCLASSES_FOR_INNER_NONPROXY_ID, true);
}

/**
 * #stack_position_of_userdata Where the userdata (LuaUserDataContainerForObject*) for the new object is in the Lua stack.
 * @the_object The raw Objective-C object/pointer (no lua container). Will use as the key (light userdata) the strong table.
 * Object is defined loosely as we currently use anything with a container including NSObjects and selectors.
 * I think it will actually work with any thing that is a pointer.
 */
void luaObjCStrongTableInsertObjectInGlobalStrongTable(lua_State* lua_state, int stack_position_of_userdata, void* object)
{
    _luaObjC_insertObjectInTableWithID(lua_state, LUACOCOA_OBJECT_GLOBAL_STRONG_TABLE_ID, stack_position_of_userdata, object);
}



/* Leaves result on the stack. Don't forget to pop when done.
 */
void* luaObjCStrongTableGetObjectInGlobalStrongTable(lua_State* lua_state, void* key)
{
    return _luaObjC_getObjectInTableWithID(lua_state, LUACOCOA_OBJECT_GLOBAL_STRONG_TABLE_ID, key);
}

/**
 * #stack_position_of_table Where the table for the new object is in the Lua stack.
 * @the_object The raw Objective-C object/pointer (no lua container). Will use as the key (light userdata) the strong table.
 * Object is defined loosely as we currently use anything with a container including NSObjects and selectors.
 * I think it will actually work with any thing that is a pointer.
 */
void luaObjCStrongTableInsertLuaSubclassEnvironmentTableInGlobalStrongTable(lua_State* lua_state, int stack_position_of_table, void* the_object)
{
    _luaObjC_insertObjectInTableWithID(lua_state, LUACOCOA_OBJECT_GLOBAL_STRONG_TABLE_FOR_ENVIRONMENT_TABLES_FOR_LUASUBCLASSES_ID, stack_position_of_table, the_object);
		
	// HACK: I am normally expecting to put LuaCocoaProxyObject's in this table.
	// But I have a corner case for super where the object is not in the wrapper, but I still want to be able to get the
	// environmental table. So, for this case, I will also put the inner object in the table as a key 
	// if the object is a LuaCocoaProxyObject.
#if 0
#warning "Need to re-examine due to LuaCocoaProxyObject removal"
	if(LuaSubclassBridge_IsClassSubclassInLua(object_getClass(the_object)))
	{
        _luaObjC_insertObjectInTableWithID(lua_state, LUACOCOA_OBJECT_GLOBAL_TABLE_FOR_ENVIRONMENT_TABLES_FOR_LUASUBCLASSES_FOR_INNER_NONPROXY_ID, stack_position_of_table, the_object);
	}
#endif
}

/* Leaves result on the stack. Don't forget to pop when done.
 */
_Bool luaObjCStrongTableGetLuaSubclassEnvironmentTableInGlobalStrongTable(lua_State* lua_state, void* the_object)
{
	lua_getfield(lua_state, LUA_REGISTRYINDEX, LUACOCOA_OBJECT_GLOBAL_STRONG_TABLE_FOR_ENVIRONMENT_TABLES_FOR_LUASUBCLASSES_ID); // puts the global weak table on top of the stack
	
	lua_pushlightuserdata(lua_state, the_object); // stack: [strong_table the_object_ptr]
	lua_gettable(lua_state, -2); // get strong_table[the_object], stack: [strong_table lua_object_container_userdata]
	
	// Either nil or the lua_object_container is on the top of the stack.
	// But the weaktable is still underneath it.
	// Since I'm modifying the stack, I want to hide the weak_table as an implementation detail
	// and return so there is only 1 new item on the stack (not two). So replace the strong_table
	// with my return value and pop.
	lua_replace(lua_state, -2); // takes the top item and replaces the item at index -2 with it and pops
	
	if(lua_isnil(lua_state, -1))
	{
		return false;
	}
	else
	{
		return true;
	}
}

void luaObjCStrongTableRemoveLuaSubclassEnvironmentTableInGlobalStrongTable(lua_State* lua_state, void* the_object)
{
	int top0 = lua_gettop(lua_state);
    
	lua_pushnil(lua_state);
	// Note: luaObjCStrongTableInsertLuaSubclassEnvironmentTableInGlobalStrongTable should also automatically clear my hack.
	luaObjCStrongTableInsertLuaSubclassEnvironmentTableInGlobalStrongTable(lua_state, -1, the_object);
	lua_pop(lua_state, 1);
	int top1 = lua_gettop(lua_state);
	assert(top0 == top1);
}

