//
//  LuaClass.h
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "luaconf.h"

struct lua_State;

//lua function <---> Objective-C method bridge
//
extern int LuaClassGetClosureIDOfSelector(Class theClass, SEL selector);

extern void LuaClassAddClosureIDForSelector(Class theClass, int clouserID, const char* selectorName);

// replace the -dealloc method of Root class (NSObject)
//
extern void luaObjCInternal_modifyRootClass(void);

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

extern void LuaObjectFinalize(LuaObjectRef ref);

extern NSUInteger LuaObjectGetRetainCount(LuaObjectRef ref);


LUAMOD_API int (luaopen_classSupport)(struct lua_State *L);
