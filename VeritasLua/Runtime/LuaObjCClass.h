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
extern int LuaClassGetClosureIDOfSelector(Class theClass, SEL selector);

extern void LuaClassAddClosureIDForSelector(Class theClass, int clouserID, const char* selectorName);

//register class
//
extern Class LuaClassGetRegisteredClassByName(NSString *className);

extern void LuaClassRegister(struct lua_State *L, Class theClass, NSString *className);

extern struct lua_State *LuaClassGetLuaState(Class theClass);

#pragma mark - Object observer

typedef struct __LuaObject *LuaObjectRef;

LuaObjectRef LuaObjectCreate(struct lua_State *L,
                                         id rawObject);

extern id LuaObjectGetObject(LuaObjectRef ref);

extern void LuaObjectPrint(LuaObjectRef ref);

extern NSUInteger LuaObjectGetRetainCount(LuaObjectRef ref);


LUAMOD_API int (luaopen_classSupport)(struct lua_State *L);

__END_DECLS