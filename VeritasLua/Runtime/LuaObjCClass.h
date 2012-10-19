//
//  LuaClass.h
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

#pragma mark - cache table

VK_EXPORT	void luaObjC_initializeCacheTable(struct lua_State* L);

VK_EXPORT	void luaObjC_addValueInCacheTable(struct lua_State* L, void* object, const char *key);

VK_EXPORT	void *luaObjC_getValueInCacheTable(struct lua_State* L, const char* key);

#pragma mark - type encoding

VK_EXPORT const char * LuaObjCTypeEncodingOfType(const char *typeName);

VK_EXPORT void luaObjC_addEncodingForPredeclearClass(const char *className);

#pragma mark - project api

VK_EXPORT Boolean luaInternal_CStringEqual(const void *value1, const void *value2);

VK_EXPORT void luaInternal_freeCallback(CFAllocatorRef allocator, const void *value);

//register class
//
VK_EXPORT Class luaObjC_getClass(const char *className);

VK_EXPORT void luaObjC_allocateClass(struct lua_State *L, Class theClass, const char *className);

VK_EXPORT struct lua_State *luaObjC_getLuaStateOfClass(Class theClass);

#pragma mark - Object observer

typedef struct __LuaObject *LuaObjectRef;

VK_EXPORT LuaObjectRef LuaObjectCreate(struct lua_State *L, id rawObject);

VK_EXPORT id LuaObjectGetObject(LuaObjectRef ref);


LUAMOD_API int luaObjC_classInitialize(struct lua_State *L);

__END_DECLS
