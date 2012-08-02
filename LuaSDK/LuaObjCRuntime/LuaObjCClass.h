//
//  LuaClass.h
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "luaconf.h"

struct lua_State;

extern int LuaClassGetClouserIDOfSelector(Class theClass, SEL selector);

extern void LuaClassAddClouserIDForSelector(Class theClass, int clouserID, const char* selectorName);


#pragma - Object

typedef struct __LuaObject *LuaObjectRef;

LuaObjectRef LuaObjectInitialize(struct lua_State *L,
                                 id rawObject);

extern id LuaObjectGetObject(LuaObjectRef ref);

extern void LuaObjectPrint(LuaObjectRef ref);

extern void LuaObjectFinalize(LuaObjectRef ref);

extern NSUInteger LuaObjectGetRetainCount(LuaObjectRef ref);

extern struct lua_State* LuaObjectGetLuaState(LuaObjectRef ref);

// replace the -dealloc method of Root class (NSObject)
//
extern void luaObjCInternal_modifyRootClass(void);

extern Class luaObjC_getRegisteredClassByName(NSString *className);

extern void luaObjC_registerClass(struct lua_State *L, Class theClass, NSString *className);

extern struct lua_State *luaObjC_getStateOfClass(Class theClass);

LUAMOD_API int (luaopen_classSupport)(struct lua_State *L);
