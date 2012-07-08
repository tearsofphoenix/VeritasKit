//
//  LuaObjCRecordTable.h
//  LuaCocoa
//
//  Created by Eric Wing on 11/11/09.
//  Copyright 2009 PlayControl Software, LLC. All rights reserved.
//

#ifndef LUA_OBJC_WEAK_TABLE_H
#define LUA_OBJC_WEAK_TABLE_H

#ifdef __cplusplus
extern "C" {
#endif
    
    struct lua_State;
    
#pragma mark - weak table
    
    void luaObjCWeakTableCreateGlobalWeakObjectTable(struct lua_State* lua_state);
    
    void luaObjCWeakTableInsertObjectInGlobalWeakTable(struct lua_State* lua_state, int stack_position_of_userdata, void* the_object);
    
    void* luaObjCWeakTableGetObjectInGlobalWeakTable(struct lua_State* lua_state, void* the_object);
    
#pragma mark - strong table	
    
	void luaObjCStrongTableCreateGlobalStrongObjectTable(struct lua_State* lua_state);
	
	void luaObjCStrongTableInsertObjectInGlobalStrongTable(struct lua_State* lua_state, int stack_position_of_userdata, void* the_object);
	
	void* luaObjCStrongTableGetObjectInGlobalStrongTable(struct lua_State* lua_state, void* the_object);
	
	
	void luaObjCStrongTableInsertLuaSubclassEnvironmentTableInGlobalStrongTable(struct lua_State* lua_state, int stack_position_of_table, void* the_object);
	_Bool luaObjCStrongTableGetLuaSubclassEnvironmentTableInGlobalStrongTable(struct lua_State* lua_state, void* the_object);
	void luaObjCStrongTableRemoveLuaSubclassEnvironmentTableInGlobalStrongTable(struct lua_State* lua_state, void* the_object);
    
#ifdef __cplusplus
}
#endif

#endif /* LUA_OBJC_WEAK_TABLE_H */

