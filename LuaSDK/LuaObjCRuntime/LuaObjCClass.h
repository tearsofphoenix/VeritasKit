//
//  LuaClass.h
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "luaconf.h"

struct lua_State;

extern int LuaObjCInvalidClouserID;

typedef struct __LuaClass *LuaClassRef;

#pragma mark - Class 

LuaClassRef LuaClassInitialize(struct lua_State *L,
                                       id rawObject, 
                                       NSString *className,
                                       bool isInstance);

NSString *LuaClassGetClassName(LuaClassRef ref);

id LuaClassGetObject(LuaClassRef ref);

void LuaClassPrint(LuaClassRef ref);

int LuaClassGetClouserIDOfSelector(LuaClassRef ref, SEL selector);

void LuaClassAddClouserIDForSelector(LuaClassRef ref, int clouserID, const char* selectorName);

struct lua_State* LuaClassGetLuaState(LuaClassRef ref);

#pragma - Object

typedef struct __LuaObject *LuaObjectRef;

LuaObjectRef LuaObjectInitialize(struct lua_State *L,
                                         id rawObject);

id LuaObjectGetObject(LuaObjectRef ref);

void LuaObjectPrint(LuaObjectRef ref);

void LuaObjectFinalize(LuaObjectRef ref);

NSUInteger LuaObjectGetRetainCount(LuaObjectRef ref);

struct lua_State* LuaObjectGetLuaState(LuaClassRef ref);

#pragma - replace the -dealloc method of Root class (NSObject)
//
extern void luaObjC_modifyRootClass(void);

extern LuaClassRef luaObjC_getRegisteredClassByName(NSString *className);

void luaObjC_registerClass(LuaClassRef obj);

int luaObjC_description(struct lua_State *L);

NSString * _LuaObjC_getTypeEncodingOfType(const char *typeName);

NSString * _LuaObjC_getTypeEncoding(NSString *typeName);

extern void _luaObjC_registerClassPredeclearation(NSString *className);

extern void _luaObjC_insertClouserIDOfBlock(int clouserID, void *block);
extern int _luaObjC_getClouserIDOfBlock(void *block);

LUAMOD_API int (luaopen_objc)(struct lua_State *L);
