//
//  LuaObjCClass.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "luaconf.h"

struct lua_State;

extern int LuaObjCInvalidClouserID;

typedef struct __LuaObjCClass *LuaObjCClassRef;

LuaObjCClassRef LuaObjCClassInitialize(struct lua_State *L, 
                                       id rawObject, 
                                       NSString *className,
                                       bool isInstance);

bool LuaObjCClassIsInstance(LuaObjCClassRef ref);

NSString *LuaObjCClassGetClassName(LuaObjCClassRef ref);

id LuaObjCClassGetObject(LuaObjCClassRef ref);

void LuaObjCClassPrint(LuaObjCClassRef ref);

void LuaObjCClassFinalize(LuaObjCClassRef ref);

int LuaObjCClassGetClouserIDOfSelector(LuaObjCClassRef ref, SEL selector);

int LuaObjCClassGetRetainCount(LuaObjCClassRef ref);

void LuaObjCClassAddClouserIDForSelector(LuaObjCClassRef ref, int clouserID, const char* selectorName);

struct lua_State* LuaObjCClassGetLuaState(LuaObjCClassRef ref);

@interface LuaObjectObserver : NSObject

- (id)initWithClassRef: (LuaObjCClassRef)ref;

@end

LuaObjCClassRef luaObjC_getRegisteredClassByName(NSString *className);

void luaObjC_registerClass(LuaObjCClassRef obj);

int luaObjC_description(struct lua_State *L);

NSString * _LuaObjC_getTypeEncodingOfType(const char *typeName);

NSString * _LuaObjC_getTypeEncoding(NSString *typeName);

extern void _luaObjC_registerClassPredeclearation(NSString *className);

extern void _luaObjC_insertClouserIDOfBlock(int clouserID, void *block);
extern int _luaObjC_getClouserIDOfBlock(void *block);

LUAMOD_API int (luaopen_objc)(struct lua_State *L);
