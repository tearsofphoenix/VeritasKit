//
//  LuaObjCCacheTable.h
//  LuaCocoa
//
//  Created by Eric Wing on 11/11/09.
//  Copyright 2009 PlayControl Software, LLC. All rights reserved.
//

#ifndef LUA_OBJC_WEAK_TABLE_H
#define LUA_OBJC_WEAK_TABLE_H

#include "LuaObjCBase.h"

__BEGIN_DECLS

//strong table
//

VK_EXPORT	void luaObjC_initializeCacheTable(struct lua_State* L);
	
VK_EXPORT	void luaObjC_addValueInCacheTable(struct lua_State* L, void* object, const char *key);
	
VK_EXPORT	void *luaObjC_getValueInCacheTable(struct lua_State* L, const char* key);
    
__END_DECLS

#endif 

