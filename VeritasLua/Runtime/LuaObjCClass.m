//
//  LuaClass.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCClass.h"

#import "LuaObjCAuxiliary.h"

#import "LuaObjCRuntime.h"

#import "LuaCGGeometry.h"

#import "LuaObjCInternal.h"

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

#pragma mark - @selector <--> lua function bridge

static int luaObjC_getClosureIDOfSelector(Class theClass, SEL selector, bool isClassMethod)
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

static void luaObjC_addClosureIDForSelector(Class theClass, int clouserID, const char* selectorName, bool isClassMethod)
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

#pragma mark - IMP implementation

static inline NSUInteger LuaObjCInternal_argumentCountOfSelector(SEL selector)
{
    const char* charLooper = (const char*)selector;
    NSUInteger count = 0;
    
    while (*charLooper)
    {
        if (*charLooper == ':')
        {
            ++count;
        }
        
        ++charLooper;
    }
    
    return count;
}


static void __luaClass_IMP_preprocess(lua_State **returnedLuaState, id obj, SEL sel, va_list ap)
{
    Class theClass = object_getClass(obj);
    bool isClassMethod = (theClass == obj);
    
    LuaClosureType clouserID = luaObjC_getClosureIDOfSelector(theClass, sel, isClassMethod);
    lua_State *luaState = luaObjC_getLuaStateOfClass(theClass);
    
    if (clouserID != LuaObjCInvalidClouserID)
    {
        //preprare arguments
        //
        if (returnedLuaState)
        {
            *returnedLuaState = luaState;
        }
        
        //lua_settop(luaState, 0);
        
        //push lua function into stack
        //
        lua_rawgeti(luaState, LUA_REGISTRYINDEX, clouserID);
        
        NSUInteger numberOfArgument = LuaObjCInternal_argumentCountOfSelector(sel);
        
        const char* methodTypeEncoding = method_getTypeEncoding(class_getInstanceMethod(theClass, sel));
        
        //jump over return type, id, SEL
        //
        const char* typeLooper = methodTypeEncoding + 1 + 1;
        
        
        //push 'self' argument first
        //
        luaObjC_pushNSObject(luaState, obj, true);
        
        //push '_cmd' argument next
        //
        luaObjC_pushSelector(luaState, sel);
        
        //push real arguments
        //
        for (NSUInteger iLooper = 0; iLooper < numberOfArgument; ++iLooper)
        {
            ++typeLooper;
            switch (*typeLooper)
            {
                case _C_CHR:
                case _C_INT:
                case _C_SHT:
                case _C_LNG:
                case _C_LNG_LNG:
                case _C_UCHR:
                case _C_UINT:
                case _C_USHT:
                case _C_ULNG:
                case _C_ULNG_LNG:
                case _C_BOOL:
                {
                    NSInteger integerPara = va_arg(ap, NSInteger);
                    lua_pushinteger(luaState, integerPara);
                    break;
                }
                case _C_FLT:
                case _C_DBL:
                {
                    CGFloat doublePara = (CGFloat)va_arg(ap, double);
                    lua_pushnumber(luaState, doublePara);
                    break;
                }
                case _C_CHARPTR:
                {
                    const char *str = va_arg(ap, const char*);
                    lua_pushstring(luaState, str);
                    break;
                }
                case _C_ID:
                {
                    id argLooper = va_arg(ap,  id);
                    luaObjC_pushNSObject(luaState, argLooper, true);
                    break;
                }
                case _C_SEL:
                {
                    SEL sel = va_arg(ap, SEL);
                    luaObjC_pushSelector(luaState, sel);
                    break;
                }
                case _C_STRUCT_B:
                {
                    if (!strncmp(typeLooper, @encode(CGRect), strlen(@encode(CGRect))))
                    {
                        lua_pushCGRect(luaState, va_arg(ap, CGRect));
                        
                    }else if (!strncmp(typeLooper, @encode(CGPoint), strlen(@encode(CGPoint))))
                    {
                        lua_pushCGPoint(luaState, va_arg(ap, CGPoint));
                        
                    }else if (!strncmp(typeLooper, @encode(CGSize), strlen(@encode(CGSize))))
                    {
                        lua_pushCGSize(luaState, va_arg(ap, CGSize));
                    }
                    break;
                }
                case _C_PTR:
                case _C_ARY_B:
                {
                    void *p = va_arg(ap, void*);
                    lua_pushlightuserdata(luaState, p);
                    break;
                }
                default:
                {
                    break;
                }
            }
        }
        
        //why +1 +1 ? we have an implicit 'self' argument and '_cmd' arguemnt for method
        //
        int status = lua_pcall(luaState, (int)numberOfArgument + 1 + 1, 1, 0);
        if (status != LUA_OK)
        {
            luaL_error(luaState, "error in call @selector: %s", (const char*)sel);
        }
        
        return ;
    }
    /*if is property*/
    IMP imp = class_getMethodImplementation(theClass, sel);
    if (imp)
    {
        luaObjC_pushNSObject(luaState, imp(obj, sel, luaObjC_checkNSObject(luaState, 1)), true);
        
    }else
    {
        NSLog(@"call stack:%@", [NSThread callStackSymbols]);
        [obj doesNotRecognizeSelector: sel];
    }
}

#define __LuaClassPreprocess(obj, sel, state)     va_list ap;\
va_start(ap, sel);\
lua_State *state = NULL;\
__luaClass_IMP_preprocess(&state, obj, sel, ap);\
va_end(ap);

static NSInteger __luaClass_IMP_integer_return(id obj, SEL sel, ...)
{
    __LuaClassPreprocess(obj, sel, L);
    
    NSInteger ret = 0;
    int returnIndexOfLuaFunction = -1;
    switch (lua_type(L, returnIndexOfLuaFunction))
    {
        case LUA_TNUMBER:
        {
            ret = lua_tonumber(L, returnIndexOfLuaFunction);
            break;
        }
        case LUA_TBOOLEAN:
        {
            ret = lua_toboolean(L, returnIndexOfLuaFunction);
            break;
        }
        default:
        {
            //TODO
            //bad-cast here, so should throw an error
            //
            break;
        }
    }
    return ret;
    
}

static CGFloat __luaClass_IMP_float_return(id obj, SEL sel, ...)
{
    __LuaClassPreprocess(obj, sel, L);
    
    return lua_tonumber(L, -1);
}

static void __luaClass_IMP_struct_return(id obj, SEL sel, ...)
{
    __LuaClassPreprocess(obj, sel, L);
    
    //store struct type as userdata type
    //
    //void *returnData = lua_touserdata(L, -1);
    
    Class objClass = object_getClass(obj);
    Method method = NULL;
    
    if (objClass == obj)
    {
        method = class_getClassMethod(objClass, sel);
        
    }else
    {
        method = class_getInstanceMethod(objClass, sel);
    }
    
    char* returnType = method_copyReturnType(method);
    
    NSUInteger size;
    NSGetSizeAndAlignment(returnType, &size, NULL);
    
    //free(returnType);
    
    //return returnData;
    lua_pushvalue(L, -1);
}

static id __luaClass_IMP_gerneral(id obj, SEL sel, ...)
{
    __LuaClassPreprocess(obj, sel, L);
    
    return luaObjC_checkNSObject(L, -1);
}

#undef __LuaClassPreprocess

static int luaObjC_class_addMethod(lua_State *L, BOOL isObjectMethod)
{
    int argCount = lua_gettop(L);
    
    const char * className = lua_tostring(L, 1);
    const char* selectorName = luaObjC_checkString(L, 2);
    
    NSMutableString *typeEncoding = [[NSMutableString alloc] init];
    
    //printf("add method: %s\n", selectorName);
    //return type
    //
    const char* typeLooper = luaObjC_checkString(L, 3);
    const char* returnType = LuaObjCTypeEncodingOfType(typeLooper);
    
    [typeEncoding appendFormat: @"%s", LuaObjCTypeEncodingOfType(typeLooper)];
    
    //id && selector
    //
    [typeEncoding appendString: @"@:"];
    
    for (int iLooper = 4; iLooper < argCount; ++iLooper)
    {
        typeLooper = luaObjC_checkString(L, iLooper);
        
        [typeEncoding appendFormat: @"%s", LuaObjCTypeEncodingOfType(typeLooper)];
    }
    
    
    SEL sel = sel_registerName(selectorName);
    
    Class theClass = luaObjC_getClass(className);
    Class classToAddClosure = theClass;
    
    if (!isObjectMethod)
    {
        theClass = objc_getMetaClass(className);
    }
    
    const char* typeEncodingCString = [typeEncoding UTF8String];
    
    IMP imp = NULL;
    
    switch (*returnType)
    {
        case _C_CHR:
        case _C_INT:
        case _C_SHT:
        case _C_LNG:
        case _C_LNG_LNG:
        case _C_UCHR:
        case _C_UINT:
        case _C_USHT:
        case _C_ULNG:
        case _C_ULNG_LNG:
        case _C_BOOL:
        {
            imp = (IMP)__luaClass_IMP_integer_return;
            break;
        }
        case _C_FLT:
        case _C_DBL:
        {
            imp = (IMP)__luaClass_IMP_float_return;
            break;
        }
        case _C_STRUCT_B:
        {
            imp = (IMP)__luaClass_IMP_struct_return;
            break;
        }
        default:
        {
            imp = __luaClass_IMP_gerneral;
            break;
        }
            
    }
    
    if(!class_addMethod(theClass, sel, imp, typeEncodingCString))
    {
        Method existsMethod = NULL;
        if (!isObjectMethod)
        {
            existsMethod = class_getClassMethod(theClass, sel);
            
        }else
        {
            existsMethod = class_getInstanceMethod(theClass, sel);
        }
        
        if (existsMethod)
        {
            method_setImplementation(existsMethod, imp);
            
        }else
        {
            printf("Fail to class:%s registered method:%s typeencoding:%s return type:%s\n", className, (const char*)sel, typeEncodingCString, returnType);
        }
    }
    
    luaObjC_addClosureIDForSelector(classToAddClosure, luaL_ref(L, LUA_REGISTRYINDEX), selectorName, !isObjectMethod);
    
    [typeEncoding release];
    
    return 0;
}


int LuaIMPAddInstanceMethod(lua_State *L)
{
    return luaObjC_class_addMethod(L, YES);
}

int LuaIMPAddClassMethod(lua_State *L)
{
    return luaObjC_class_addMethod(L, NO);
}
