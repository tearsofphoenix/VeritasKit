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
    
	void LuaObjCCacheTableInitialize(struct lua_State* L);
	
	void LuaObjCCacheTableInsertObjectForKey(struct lua_State* L, void* object, const char *key);
	
	void *LuaObjCCacheTableGetObjectForKey(struct lua_State* L, const char* key);
    
#ifdef __cplusplus
}
#endif

#endif /* LUA_OBJC_WEAK_TABLE_H */

