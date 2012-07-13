//
//  LuaObjCCacheTable.h
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

#pragma mark - strong table	
    
	void _luaObjCCacheTableCreate(struct lua_State* lua_state);
	
	void _luaObjCCacheTableInsertObjectForKey(struct lua_State* lua_state, void* the_object, const char *key);
	
	void *_luaObjCCacheTableGetObjectForKey(struct lua_State* lua_state, const char* key);
    
#ifdef __cplusplus
}
#endif

#endif /* LUA_OBJC_WEAK_TABLE_H */

