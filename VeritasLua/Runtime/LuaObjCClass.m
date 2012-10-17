//
//  LuaClass.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCClass.h"

#import "LuaObjCBlock.h"

#import "LuaObjCAuxiliary.h"

#import <objc/runtime.h>

#pragma mark - cache table in lua state


static void _luaObjC_createTableWithID(lua_State *L, const char *tableID, bool isWeakTable)
{
	lua_pushstring(L, tableID);
	
	lua_newtable(L);
	lua_pushvalue(L, -1);  // table is its own metatable
	lua_setmetatable(L, -2);
    
    if (isWeakTable)
    {
        lua_pushliteral(L, "__mode");
        lua_pushliteral(L, "kv"); // make values weak, I don't think lightuserdata is strong ref'd so 'k' is optional.
        lua_settable(L, -3);   // metatable.__mode = "v"
    }
	
	// Now that we've created a new table, put it in the global registry
	lua_settable(L, LUA_REGISTRYINDEX);
	
}

static inline void _luaObjC_insertObjectInTableWithID(lua_State *L, const char *tableID, void *object, const char *key)
{
    lua_getfield(L, LUA_REGISTRYINDEX, tableID); // puts the global weak table on top of the stack
	
	lua_pushlightuserdata(L, object); // stack: [object table]
	lua_setfield(L, -2, key);
	
	// table is still on top of stack. Don't forget to pop it now that we are done with it
	lua_pop(L, 1);
}

static inline void* _luaObjC_getObjectInTableWithID(lua_State *L, const char* tableID, const char* key)
{
    lua_getfield(L, LUA_REGISTRYINDEX, tableID);
	lua_getfield(L, -1, key);
    
	if(lua_isnil(L, -1))
	{
		return NULL;
        
	}else
	{
		return lua_touserdata(L, -1);
	}
}

static const char* LuaObjCGlobalCacheTableID = "com.veritas.lua-objc.global.cachetable";

void luaObjC_initializeCacheTable(lua_State* L)
{
    _luaObjC_createTableWithID(L, LuaObjCGlobalCacheTableID, false);
}

void luaObjC_addValueInCacheTable(lua_State* L, void* object, const char *key)
{
    _luaObjC_insertObjectInTableWithID(L, LuaObjCGlobalCacheTableID, object, key);
}

void* luaObjC_getValueInCacheTable(lua_State* L, const char* key)
{
    return _luaObjC_getObjectInTableWithID(L, LuaObjCGlobalCacheTableID, key);
}


#pragma mark - type encoding support

CFDictionaryKeyCallBacks kLuaObjCCStringKeyCallBacks = {
    .equal=luaInternal_CStringEqual,
    .release=luaInternal_freeCallback,
    .hash=(CFDictionaryHashCallBack)strlen
};

static CFDictionaryValueCallBacks __LuaObjC_ValueCallbacks;

static CFMutableDictionaryRef __LuaObjC_TypeEncodingDictionary = NULL;

static inline void _LuaObjC_initTypeEncodingDictionary(CFMutableDictionaryRef dict)
{
    
#define _AddTypeEncoding(type) CFDictionaryAddValue(__LuaObjC_TypeEncodingDictionary, #type, @encode(type))
    
    _AddTypeEncoding(NSInteger);
    _AddTypeEncoding(NSUInteger);
    _AddTypeEncoding(BOOL);
    _AddTypeEncoding(id);
    _AddTypeEncoding(SEL);
    _AddTypeEncoding(CGFloat);
    _AddTypeEncoding(int);
    _AddTypeEncoding(float);
    _AddTypeEncoding(double);
    _AddTypeEncoding(char);
    _AddTypeEncoding(void);
    _AddTypeEncoding(CGRect);
    _AddTypeEncoding(CGSize);
    _AddTypeEncoding(CGPoint);
    _AddTypeEncoding(CGAffineTransform);
    _AddTypeEncoding(NSRange);
    _AddTypeEncoding(CATransform3D);
#if TARGET_OS_IPHONE
    _AddTypeEncoding(UIEdgeInsets);
    _AddTypeEncoding(UIOffset);
#endif
    
#undef _AddTypeEncoding
}

static inline void LuaObjCTypeEncodingInitialize(void)
{
    __LuaObjC_ValueCallbacks.equal = luaInternal_CStringEqual;
    
    __LuaObjC_TypeEncodingDictionary = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 32,
                                                                 &kLuaObjCCStringKeyCallBacks,
                                                                 &__LuaObjC_ValueCallbacks);
    _LuaObjC_initTypeEncodingDictionary(__LuaObjC_TypeEncodingDictionary);
    
}

void luaObjC_addEncodingForPredeclearClass(const char *className)
{
    if (!__LuaObjC_TypeEncodingDictionary)
    {
        LuaObjCTypeEncodingInitialize();
    }
    
    CFDictionaryAddValue(__LuaObjC_TypeEncodingDictionary, strdup(className), @encode(id));
}

const char * LuaObjCTypeEncodingOfType(const char *typeName)
{
    const char *typeEncoding = CFDictionaryGetValue(__LuaObjC_TypeEncodingDictionary, typeName);
    if (!typeEncoding)
    {
        typeEncoding = @encode(id);
    }
    
    return typeEncoding;
}

void luaInternal_freeCallback(CFAllocatorRef allocator, const void *value)
{
    free((void *)value);
}

Boolean luaInternal_CStringEqual(const void *value1, const void *value2)
{
    const char *str1 = value1;
    const char *str2 = value2;
    
    if(!strcmp(str1, str2))
    {
        return YES;
    }
    
    return NO;
}

#pragma mark - class

@class LuaObjectObserver;

static CFMutableDictionaryRef __LuaObjC_ClassDictionary = NULL;


//key for lua state on Class
//
static char __LuaObjC_KeyForLuaState;

//key for methods of the Class defined by Objective-Lua
//
static char __LuaObjC_KeyForMethods;
static char __LuaObjC_KeyForClassMethods;

static inline void _luaClassAttachDictionaryToClass(Class theClass, const void *key)
{
    CFMutableDictionaryRef classMethods = CFDictionaryCreateMutable(CFAllocatorGetDefault(),
                                                                    16, &kLuaObjCCStringKeyCallBacks, NULL);
    
    objc_setAssociatedObject(theClass, key, (id)classMethods, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    CFRelease(classMethods);
    
}

void luaObjC_allocateClass(struct lua_State *L, Class theClass, const char *className)
{
    CFDictionaryAddValue(__LuaObjC_ClassDictionary, strdup(className), theClass);
    
    objc_setAssociatedObject(theClass, &__LuaObjC_KeyForLuaState, [NSValue valueWithPointer: L], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //Notice: the Class has not been registerd into the objc runtime
    //at this time
    //
    _luaClassAttachDictionaryToClass(theClass, &__LuaObjC_KeyForMethods);
    _luaClassAttachDictionaryToClass(theClass, &__LuaObjC_KeyForClassMethods);
}

struct lua_State *luaObjC_getLuaStateOfClass(Class theClass)
{
    return [objc_getAssociatedObject(theClass, &__LuaObjC_KeyForLuaState) pointerValue];
}

Class luaObjC_getClass(const char *className)
{
    return CFDictionaryGetValue(__LuaObjC_ClassDictionary, className);
}

int luaObjC_classInitialize(lua_State *L)
{
    __LuaObjC_ClassDictionary = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 1024,
                                                          &kLuaObjCCStringKeyCallBacks,
                                                          &kCFTypeDictionaryValueCallBacks);
    
    //LuaObjCTypeEncodingInitialize();
    luaObjC_initializeCacheTable(L);
    
    return 1;
}

#pragma mark - Object observer

static char __LuaObjCAssociatedObjectKey;

@interface LuaObjectObserver : NSObject
{
@private
    LuaObjectRef _ref;
}

- (id)initWithObjectRef: (LuaObjectRef)ref;

@end

@implementation LuaObjectObserver

- (id)init
{
    [self doesNotRecognizeSelector: _cmd];
    return nil;
}

- (id)initWithObjectRef:(LuaObjectRef)ref
{
    if ((self = [super init]))
    {
        _ref = ref;
    }
    return self;
}

- (void)dealloc
{
    //NSLog(@"in func: %s self: %p", __func__, _ref);
    
    [super dealloc];
}

@end

int luaObjC_getClosureIDOfSelector(Class theClass, SEL selector, bool isClassMethod)
{
    if (theClass && selector)
    {
        const void *key = &__LuaObjC_KeyForMethods;
        
        if (isClassMethod)
        {
            key = &__LuaObjC_KeyForClassMethods;
        }
        
        CFDictionaryRef methods = (CFDictionaryRef)objc_getAssociatedObject(theClass, key);
        if (CFDictionaryContainsKey(methods, selector))
        {
            return (int)CFDictionaryGetValue(methods, selector);
        }
    }
    
    return LuaObjCInvalidClouserID;
}

void luaObjC_addClosureIDForSelector(Class theClass, int clouserID, const char* selectorName, bool isClassMethod)
{
    if (theClass && selectorName)
    {
        const void *key = &__LuaObjC_KeyForMethods;
        if (isClassMethod)
        {
            key = &__LuaObjC_KeyForClassMethods;
        }
        
        CFMutableDictionaryRef methods = (CFMutableDictionaryRef)objc_getAssociatedObject(theClass, key);
        if (methods)
        {
            CFDictionaryAddValue(methods, strdup(selectorName), (const void *)clouserID);
        }else
        {
            //this should never happen!
            //
            NSLog(@"warning: class %@ have no methods dictionary!", theClass);
        }
    }
}

#pragma mark - object api

struct __LuaObject
{
    id _obj;
    lua_State *_luaState;
    LuaObjectObserver *_objectObserver;
};

LuaObjectRef LuaObjectCreate(struct lua_State *L, id rawObject)
{
    LuaObjectRef objRef = lua_newuserdata(L, sizeof(struct __LuaObject));
    
    objRef->_luaState = L;
    objRef->_obj = rawObject;
    
    if (object_getClass(rawObject) != rawObject)
    {
        LuaObjectObserver *objectObserver = [[LuaObjectObserver alloc] initWithObjectRef: objRef];
        objc_setAssociatedObject(rawObject,
                                 &__LuaObjCAssociatedObjectKey,
                                 objectObserver,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [objectObserver release];
        
        objRef->_objectObserver = objectObserver;
    }
    
    luaL_getmetatable(L, LUA_NSOBJECT_METATABLENAME);
    lua_setmetatable(L, -2);
    
    return objRef;
}

id LuaObjectGetObject(LuaObjectRef ref)
{
    if (ref)
    {
        return ref->_obj;
    }
    return nil;
}

NSUInteger LuaObjectGetRetainCount(LuaObjectRef ref)
{
    if (ref)
    {
        return [ref->_objectObserver retainCount];
    }
    return 0;
}
