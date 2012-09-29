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
VK_EXPORT int LuaClassGetClosureIDOfSelector(Class theClass, SEL selector);

VK_EXPORT void LuaClassAddClosureIDForSelector(Class theClass, int clouserID, const char* selectorName);

//register class
//
VK_EXPORT Class LuaClassGetRegisteredClassByName(NSString *className);

VK_EXPORT void LuaClassRegister(struct lua_State *L, Class theClass, NSString *className);

VK_EXPORT struct lua_State *LuaClassGetLuaState(Class theClass);

#pragma mark - Object observer

typedef struct __LuaObject *LuaObjectRef;

LuaObjectRef LuaObjectCreate(struct lua_State *L,
                                         id rawObject);

VK_EXPORT id LuaObjectGetObject(LuaObjectRef ref);

VK_EXPORT void LuaObjectPrint(LuaObjectRef ref);

VK_EXPORT NSUInteger LuaObjectGetRetainCount(LuaObjectRef ref);


LUAMOD_API int (luaopen_classSupport)(struct lua_State *L);

__END_DECLS