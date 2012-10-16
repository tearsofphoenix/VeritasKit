//
//  LuaClass.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCClass.h"

#import "LuaObjCBlock.h"

#import "LuaObjCTypeEncoding.h"

#import "LuaObjCAuxiliary.h"

#import <objc/runtime.h>

#import "lauxlib.h"

#import "LuaObjCCacheTable.h"

@class LuaObjectObserver;

static CFDictionaryKeyCallBacks __LuaObjC_ClassKeyCallbacks;

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
                                                                    16, &__LuaObjC_ClassKeyCallbacks, NULL);
    
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

int luaObjC_openClassSupport(lua_State *L)
{
    
    __LuaObjC_ClassKeyCallbacks.equal = _luaObjCCStringEqual;
    __LuaObjC_ClassKeyCallbacks.release = _luaObjCFreeCallback;
    __LuaObjC_ClassKeyCallbacks.hash = (CFDictionaryHashCallBack)strlen;
    
    __LuaObjC_ClassDictionary = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 1024,
                                                          &__LuaObjC_ClassKeyCallbacks,
                                                          &kCFTypeDictionaryValueCallBacks);
    
    LuaObjCTypeEncodingInitialize();
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
