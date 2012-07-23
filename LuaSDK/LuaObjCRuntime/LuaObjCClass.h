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

@interface LuaClassInfo : NSObject

- (id)initWithClass: (Class)luaClass
          className: (NSString *)className
         superClass: (Class)superClass;

- (void)addClassMethod: (int)closureID
       forSelectorName: (const char*)selectorName;
- (int)classMethodForSelector: (SEL)selector;

- (void)addInstanceMethod: (int)closureID
          forSelectorName: (const char*)selectorName;
- (int)instanceMethodForSelector: (SEL)selector;

- (Class)luaClass;

- (Class)superLuaClass;

@end

//int LuaClassGetClouserIDOfSelector(LuaObjectRef ref, SEL selector);
//
void LuaClassAddClouserIDForSelector(Class theClass, int clouserID, const char* selectorName);


#pragma - Object

typedef struct __LuaObject *LuaObjectRef;

LuaObjectRef LuaObjectInitialize(struct lua_State *L,
                                 id rawObject);

id LuaObjectGetObject(LuaObjectRef ref);

void LuaObjectPrint(LuaObjectRef ref);

void LuaObjectFinalize(LuaObjectRef ref);

NSUInteger LuaObjectGetRetainCount(LuaObjectRef ref);

struct lua_State* LuaObjectGetLuaState(LuaObjectRef ref);

int LuaObjectGetClouserIDOfSelector(id object, SEL selector);

#pragma - replace the -dealloc method of Root class (NSObject)
//
extern void luaObjC_modifyRootClass(void);

extern LuaClassInfo *luaObjC_getRegisteredClassByName(NSString *className);

void luaObjC_registerClass(Class theClass, NSString *className, Class superClass);

int luaObjC_description(struct lua_State *L);

NSString * _LuaObjC_getTypeEncodingOfType(const char *typeName);

NSString * _LuaObjC_getTypeEncoding(NSString *typeName);

extern void _luaObjC_registerClassPredeclearation(NSString *className);

extern void _luaObjC_insertClouserIDOfBlock(int clouserID, void *block);
extern int _luaObjC_getClouserIDOfBlock(void *block);

LUAMOD_API int (luaopen_objc)(struct lua_State *L);
