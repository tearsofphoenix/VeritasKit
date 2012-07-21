//
//  LuaObjCClass.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCClass.h"

#import "LuaObjCInternal.h"

#import "LuaCGGeometry.h"

#import "LuaObjCAccelerator.h"

#import "LuaObjCAuxiliary.h"

#import <objc/runtime.h>
#import <dlfcn.h>
#import "lauxlib.h"

#import "LuaObjCCacheTable.h"
#import "LuaBridgeSupport.h"

@class LuaObjectObserver;

struct __LuaObjCClass
{
    id _obj;
    struct lua_State *_luaState;
    NSString *className;
    NSMutableDictionary *_classMethods;
    LuaObjectObserver *_objectObserver;
    bool isInstance;
};

static NSMutableDictionary *__LuaObjC_ClassDictionary = nil;

static NSMutableDictionary *__LuaObjC_TypeEncodingDictionary = nil;

static NSMutableDictionary *__LuaObjC_clouserBlockDictionary = nil;

void _luaObjC_insertClouserIDOfBlock(int clouserID, void *block)
{
    if (block)
    {
        [__LuaObjC_clouserBlockDictionary setObject: [NSNumber numberWithInteger: clouserID]
                                             forKey: [NSValue valueWithPointer: block]];
    }
}

int _luaObjC_getClouserIDOfBlock(void *block)
{
    NSNumber *clouser = [__LuaObjC_clouserBlockDictionary objectForKey: [NSValue valueWithPointer: block]];
    if (clouser)
    {
        return [clouser intValue];
    }
    return LuaObjCInvalidClouserID;
}

static void _LuaObjC_initTypeEncodingDictionary(NSMutableDictionary *dict)
{
#define _AddTypeEncoding(dict, type) [dict setObject: [NSString stringWithUTF8String: @encode(type)] \
forKey: [NSString stringWithUTF8String: #type]];
    
    _AddTypeEncoding(dict, NSInteger);
    _AddTypeEncoding(dict, NSUInteger);
    _AddTypeEncoding(dict, BOOL);
    _AddTypeEncoding(dict, id);
    _AddTypeEncoding(dict, SEL);
    _AddTypeEncoding(dict, CGFloat);
    _AddTypeEncoding(dict, int);
    _AddTypeEncoding(dict, void);
    
#undef _AddTypeEncoding
}

void _luaObjC_registerClassPredeclearation(NSString *className)
{
    [__LuaObjC_TypeEncodingDictionary setObject: [NSString stringWithUTF8String: @encode(id)]
                                         forKey: className];
}

NSString * _LuaObjC_getTypeEncoding(NSString *typeName)
{
    NSString *typeEncoding = [__LuaObjC_TypeEncodingDictionary objectForKey: typeName];
    if (!typeEncoding)
    {
        typeEncoding = [NSString stringWithUTF8String: @encode(id)];
    }
    return typeEncoding;
}

NSString * _LuaObjC_getTypeEncodingOfType(const char *typeName)
{
    return _LuaObjC_getTypeEncoding([NSString stringWithUTF8String: typeName]);
}

void luaObjC_registerClass(LuaObjCClassRef obj)
{
    [__LuaObjC_ClassDictionary setObject: [NSValue valueWithPointer: obj]
                                  forKey: obj->className];
}

LuaObjCClassRef luaObjC_getRegisteredClassByName(NSString *className)
{
    return [[__LuaObjC_ClassDictionary objectForKey: className] pointerValue];
}

static int _luaEngine_resolveName(lua_State *L)
{
    const char* name = lua_tostring(L, 2);
    //printf("revolve: %s\n", name);
    
    if (!_luaObjCCacheTableGetObjectForKey(L, name))
    {
        printf("not got, in function: %s line: %d name: %s\n", __func__, __LINE__, name);
        Class theClass = objc_getClass(name);
        if (theClass)
        {
            LuaObjCClassRef classRef = LuaObjCClassInitialize(L, theClass, nil, false);
            _luaObjCCacheTableInsertObjectForKey(L, classRef, name);
            luaObjC_pushNSObject(L, theClass);
        }else
        {
            //this maybe a function, such as glEnable(...)
            [LuaBridgeSupport tryToResolveName: [NSString stringWithUTF8String: name]
                                  intoLuaState: L];
        }
    }
    
    return 1;
}

static const luaL_Reg __luaObjC_Functions[] =
{
    {"resolveName", _luaEngine_resolveName},
    {NULL, NULL},
};

static int _luaObjC_openIndexSupport(lua_State *L)
{
    luaL_newlib(L, __luaObjC_Functions);
    return 1;
}

int luaopen_objc(lua_State *L)
{
    if (!__LuaObjC_ClassDictionary)
    {
        __LuaObjC_ClassDictionary = [[NSMutableDictionary alloc] init];
    }
    
    if (!__LuaObjC_TypeEncodingDictionary)
    {
        __LuaObjC_TypeEncodingDictionary = [[NSMutableDictionary alloc] init];
        _LuaObjC_initTypeEncodingDictionary(__LuaObjC_TypeEncodingDictionary);
    }
    
    if (!__LuaObjC_clouserBlockDictionary)
    {
        __LuaObjC_clouserBlockDictionary = [[NSMutableDictionary alloc] init];
    }
    
    _luaObjCCacheTableCreate(L);
    
    luaL_requiref(L, "ObjC", _luaObjC_openIndexSupport, 1);
    
    static const char* s_ResolveNameMetaTable = "setmetatable(_G, { __index = ObjC.resolveName, "
                                                "                 })";
	luaL_loadstring(L, s_ResolveNameMetaTable);
	lua_pcall(L, 0, 0, 0);
    
    return 1;
    
}

#pragma mark - Object observer

static char __LuaObjCAssociatedObjectKey;

static IMP _deallocIMPOfRootClass = NULL;



@interface LuaObjectObserver : NSObject
{
@private
    LuaObjCClassRef _ref;
}

- (id)initWithClassRef: (LuaObjCClassRef)ref;

- (void)_clearUp;

@end


static void _luaObjC_runtimeDeallocMethod(id obj, SEL selector)
{
    LuaObjectObserver *observer = objc_getAssociatedObject(obj, &__LuaObjCAssociatedObjectKey);
    if (observer)
    {
        objc_removeAssociatedObjects(obj);
        [observer _clearUp];
    }
    
    _deallocIMPOfRootClass(obj, selector);
}

void luaObjC_modifyRootClass(void)
{
    _deallocIMPOfRootClass = class_replaceMethod(objc_getClass("NSObject"), @selector(dealloc), (IMP)_luaObjC_runtimeDeallocMethod, "v@:");
}

@implementation LuaObjectObserver

- (id)initWithClassRef: (LuaObjCClassRef)ref
{
    if ((self = [super init]))
    {
        _ref = ref;
    }
    return self;
}

- (void)_clearUp
{
    //LuaObjCClassFinalize(_ref);
    _deallocIMPOfRootClass(self, _cmd);
}

@end

#pragma mark - Object wrapper lift cycle

LuaObjCClassRef LuaObjCClassInitialize(struct lua_State *L,
                                       id rawObject,
                                       NSString *className,
                                       bool isInstance)
{
    LuaObjCClassRef obj = lua_newuserdata(L, sizeof(struct __LuaObjCClass));

    obj->className = [className retain];
    obj->_luaState = L;
    
    if (isInstance)
    {
        obj->_classMethods = nil;
    }else
    {
        obj->_classMethods = [[NSMutableDictionary alloc] init];
    }
    obj->_objectObserver = [[LuaObjectObserver alloc] initWithClassRef: obj];
    objc_setAssociatedObject(rawObject, &__LuaObjCAssociatedObjectKey, obj->_objectObserver, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    obj->isInstance = isInstance;
    obj->_obj = rawObject;
    
    luaL_getmetatable(L, LUA_NSOBJECT_METATABLENAME);
    lua_setmetatable(L, -2);
    
    return obj;
}

void LuaObjCClassFinalize(LuaObjCClassRef ref)
{
    if (ref)
    {
        switch ([ref->_objectObserver retainCount])
        {
            case 1:
            {
                [ref->_objectObserver release];
                ref->_objectObserver = nil;
                break;
            }
            case 2:
            {
                //[ref->_obj release];
                objc_removeAssociatedObjects(ref->_obj);
                [ref->_objectObserver dealloc];
                ref->_objectObserver = nil;
                break;
            }
            default:
            {
                break;
            }
        }
        //why crash here?
        //
        //free(ref);
    }
}

bool LuaObjCClassIsInstance(LuaObjCClassRef ref)
{
    if (ref)
    {
        return ref->isInstance;
    }
    return false;
}

NSString *LuaObjCClassGetClassName(LuaObjCClassRef ref)
{
    if (ref)
    {
        return ref->className;
    }
    return nil;
}

id LuaObjCClassGetObject(LuaObjCClassRef ref)
{
    if (ref)
    {
        return ref->_obj;
    }
    return nil;
}

NSUInteger LuaObjCClassGetRetainCount(LuaObjCClassRef ref)
{
    if (ref)
    {
        return [ref->_objectObserver retainCount];
    }
    return 0;
}

void LuaObjCClassPrint(LuaObjCClassRef ref)
{
    if (ref)
    {
#if TARGET_OS_EMBEDDED || TARGET_OS_IPHONE
        NSLog(@"Class: %@ instance: %p retainCount: %d",
              [ref->_obj class], ref->_obj, [ref->_obj retainCount]);
#else
        NSLog(@"Class: %@ instance: %p retainCount: %lu",
              [ref->_obj class], ref->_obj, [ref->_obj retainCount]);
#endif
    }
}

int LuaObjCClassGetClouserIDOfSelector(LuaObjCClassRef ref, SEL selector)
{
    if (ref && selector)
    {
        return [[ref->_classMethods objectForKey: NSStringFromSelector(selector)] intValue];
    }
    
    return LuaObjCInvalidClouserID;
}

void LuaObjCClassAddClouserIDForSelector(LuaObjCClassRef ref, int clouserID, const char* selectorName)
{
    if (ref && selectorName)
    {
        [ref->_classMethods setObject: [NSNumber numberWithInt: clouserID]
                               forKey: [NSString stringWithUTF8String: selectorName]];
    }
}

struct lua_State* LuaObjCClassGetLuaState(LuaObjCClassRef ref)
{
    if (ref)
    {
        return ref->_luaState;
    }
    return NULL;
}

int LuaObjCInvalidClouserID = -1;

