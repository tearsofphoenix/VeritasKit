//
//  LuaClass.h
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

//lua function <---> Objective-C method bridge
//
VK_EXPORT int luaObjC_getClosureIDOfSelector(Class theClass, SEL selector, bool isClassMethod);

//Notice: when add Class-Method to theClass, you just pass the class itself instead of the meta class
//
VK_EXPORT void luaObjC_addClosureIDForSelector(Class theClass, int clouserID, const char* selectorName, bool isClassMethod);

//register class
//
VK_EXPORT Class luaObjC_getClass(const char *className);

VK_EXPORT void luaObjC_allocateClass(struct lua_State *L, Class theClass, const char *className);

VK_EXPORT struct lua_State *luaObjC_getLuaStateOfClass(Class theClass);

#pragma mark - Object observer

typedef struct __LuaObject *LuaObjectRef;

VK_EXPORT LuaObjectRef LuaObjectCreate(struct lua_State *L, id rawObject);

VK_EXPORT id LuaObjectGetObject(LuaObjectRef ref);

VK_EXPORT NSUInteger LuaObjectGetRetainCount(LuaObjectRef ref);


LUAMOD_API int luaObjC_classInitialize(struct lua_State *L);

__END_DECLS
