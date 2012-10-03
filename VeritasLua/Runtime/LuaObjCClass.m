//
//  LuaClass.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCClass.h"

#import "LuaObjCInternal.h"
#import "LuaObjCBlock.h"
#import "LuaObjCTypeEncoding.h"
#import "LuaCGGeometry.h"

#import "LuaObjCAccelerator.h"

#import "LuaObjCAuxiliary.h"

#import <objc/runtime.h>
#import <dlfcn.h>
#import "lauxlib.h"

#import "LuaObjCCacheTable.h"

#import "LuaBridgeSupport.h"


@class LuaObjectObserver;

static NSMutableDictionary *__LuaObjC_ClassDictionary = nil;


//key for lua state on Class
//
static char __LuaObjC_KeyForLuaState;

//key for methods of the Class defined by Objective-Lua
//
static char __LuaObjC_KeyForMethods;

void LuaClassRegister(struct lua_State *L, Class theClass, NSString *className)
{
    [__LuaObjC_ClassDictionary setObject: theClass
                                  forKey: className];
    
    objc_setAssociatedObject(theClass, &__LuaObjC_KeyForLuaState, [NSValue valueWithPointer: L], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    
    NSMutableDictionary *classMethods = [[NSMutableDictionary alloc] init];

    objc_setAssociatedObject(theClass, &__LuaObjC_KeyForMethods, classMethods, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [classMethods release];
    
}

struct lua_State *LuaClassGetLuaState(Class theClass)
{
    return [objc_getAssociatedObject(theClass, &__LuaObjC_KeyForLuaState) pointerValue];
}

Class LuaClassGetRegisteredClassByName(NSString *className)
{
    return [__LuaObjC_ClassDictionary objectForKey: className];
}

int luaopen_classSupport(lua_State *L)
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, (^
                               {
                                   __LuaObjC_ClassDictionary = [[NSMutableDictionary alloc] init];
                                   
                                   LuaObjCTypeEncodingInitialize();
                                   LuaObjCCacheTableInitialize(L);
                               }));
    
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

int LuaClassGetClosureIDOfSelector(Class theClass, SEL selector)
{
    if (theClass && selector)
    {
        NSDictionary *methods = objc_getAssociatedObject(theClass, &__LuaObjC_KeyForMethods);
        
        NSNumber *closurID = [methods objectForKey: NSStringFromSelector(selector)];
        if (closurID)
        {
            return [closurID intValue];
        }
    }
    
    return LuaObjCInvalidClouserID;
}

void LuaClassAddClosureIDForSelector(Class theClass, int clouserID, const char* selectorName)
{
    if (theClass && selectorName)
    {
        NSMutableDictionary *methods = objc_getAssociatedObject(theClass, &__LuaObjC_KeyForMethods);
        
        [methods setObject: [NSNumber numberWithInt: clouserID]
                    forKey: [NSString stringWithUTF8String: selectorName]];
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
