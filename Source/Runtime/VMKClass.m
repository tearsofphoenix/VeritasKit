//
//  LuaClass.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKClass.h"

#import "VMKAuxiliary.h"

#import "VMKRuntime.h"

#import "LuaCGGeometry.h"

#import "VMKObject.h"

#import <objc/runtime.h>

#pragma mark - type encoding support

static Boolean LuaInternalCStringEqual(const void *value1, const void *value2)
{
    const char *str1 = value1;
    const char *str2 = value2;
    
    if(!strcmp(str1, str2))
    {
        return YES;
    }
    
    return NO;
}

static void LuaInternalFreeCallback(CFAllocatorRef allocator, const void *value)
{
    free((void *)value);
}

CFDictionaryKeyCallBacks kVMKCStringDictionaryKeyCallBacks =
{
    .equal = LuaInternalCStringEqual,
    .release = LuaInternalFreeCallback,
    .hash = (CFDictionaryHashCallBack)strlen
};

static CFDictionaryValueCallBacks kVMKCFTypeDictionaryValueCallbacks =
{
    .equal = LuaInternalCStringEqual,
};

static CFMutableDictionaryRef __sVMKTypeEncodingDictionary = NULL;

static inline void _LuaObjC_initTypeEncodingDictionary(CFMutableDictionaryRef dict)
{
    
#define _AddTypeEncoding(type) CFDictionaryAddValue(__sVMKTypeEncodingDictionary, #type, @encode(type))
    
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

static inline void VMKTypeEncodingInitialize(void)
{
    __sVMKTypeEncodingDictionary = CFDictionaryCreateMutable(NULL, 32, &kVMKCStringDictionaryKeyCallBacks, &kVMKCFTypeDictionaryValueCallbacks);
    _LuaObjC_initTypeEncodingDictionary(__sVMKTypeEncodingDictionary);
    
}

void VMKAddEncodingForPredeclearClass(const char *className)
{
    if (!__sVMKTypeEncodingDictionary)
    {
        VMKTypeEncodingInitialize();
    }
    
    CFDictionaryAddValue(__sVMKTypeEncodingDictionary, strdup(className), @encode(id));
}

const char * VMKTypeEncodingOfType(const char *typeName)
{
    const char *typeEncoding = CFDictionaryGetValue(__sVMKTypeEncodingDictionary, typeName);
    if (!typeEncoding)
    {
        typeEncoding = @encode(id);
    }
    
    return typeEncoding;
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
    CFMutableDictionaryRef classMethods = CFDictionaryCreateMutable(NULL, 16, &kVMKCStringDictionaryKeyCallBacks, NULL);
    
    objc_setAssociatedObject(theClass, key, (id)classMethods, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    CFRelease(classMethods);
    
}

void LuaInternalAllocateClass(VMKLuaStateRef state, Class theClass, const char *className)
{
    CFDictionaryAddValue(__LuaObjC_ClassDictionary, strdup(className), theClass);
    
    objc_setAssociatedObject(theClass, &__LuaObjC_KeyForLuaState, [NSValue valueWithPointer: state], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //Notice: the Class has not been registerd into the objc runtime
    //at this time
    //
    _luaClassAttachDictionaryToClass(theClass, &__LuaObjC_KeyForMethods);
    _luaClassAttachDictionaryToClass(theClass, &__LuaObjC_KeyForClassMethods);
}

struct lua_State *LuaInternalGetLuaStateOfClass(Class theClass)
{
    return [objc_getAssociatedObject(theClass, &__LuaObjC_KeyForLuaState) pointerValue];
}

Class LuaInternalGetClass(const char *className)
{
    return CFDictionaryGetValue(__LuaObjC_ClassDictionary, className);
}

int VMKClassInitialize(VMKLuaStateRef state)
{
    __LuaObjC_ClassDictionary = CFDictionaryCreateMutable(NULL, 1024, &kVMKCStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
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
    
    return VMKInvalidClouserID;
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

static inline NSUInteger VMKInternal_argumentCountOfSelector(SEL selector)
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


static void __luaClass_IMP_preprocess(VMKLuaStateRef *returnedLuaState, id obj, SEL sel, va_list ap)
{
    Class theClass = object_getClass(obj);
    bool isClassMethod = (theClass == obj);
    
    LuaClosureType clouserID = luaObjC_getClosureIDOfSelector(theClass, sel, isClassMethod);
    VMKLuaStateRef luaState = LuaInternalGetLuaStateOfClass(theClass);
    
    if (clouserID != VMKInvalidClouserID)
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
        
        NSUInteger numberOfArgument = VMKInternal_argumentCountOfSelector(sel);
        
        const char* methodTypeEncoding = method_getTypeEncoding(class_getInstanceMethod(theClass, sel));
        
        //jump over return type, id, SEL
        //
        const char* typeLooper = methodTypeEncoding + 1 + 1;
        
        
        //push 'self' argument first
        //
        VMKPushObject(luaState, obj, true, false);
        
        //push '_cmd' argument next
        //
        VMKPushSelector(luaState, sel);
        
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
                    VMKPushObject(luaState, argLooper, true, false);
                    break;
                }
                case _C_SEL:
                {
                    SEL sel = va_arg(ap, SEL);
                    VMKPushSelector(luaState, sel);
                    break;
                }
                case _C_STRUCT_B:
                {
                    if (!strncmp(typeLooper, @encode(CGRect), strlen(@encode(CGRect))))
                    {
                        VMKPushCGRect(luaState, va_arg(ap, CGRect));
                        
                    }else if (!strncmp(typeLooper, @encode(CGPoint), strlen(@encode(CGPoint))))
                    {
                        VMKPushCGPoint(luaState, va_arg(ap, CGPoint));
                        
                    }else if (!strncmp(typeLooper, @encode(CGSize), strlen(@encode(CGSize))))
                    {
                        VMKPushCGSize(luaState, va_arg(ap, CGSize));
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
        VMKPushObject(luaState, imp(obj, sel, VMKCheckObject(luaState, 1)), true, false);
        
    }else
    {
        luaL_error(luaState, "fail to find @property IMP for : %s", (const char*)sel);
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

///TODO
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
    
//    char* returnType = method_copyReturnType(method);
    
//    NSUInteger size;
//    NSGetSizeAndAlignment(returnType, &size, NULL);
    
    //free(returnType);
    
    //return returnData;
    lua_pushvalue(L, -1);
}

static id __luaClass_IMP_gerneral(id obj, SEL sel, ...)
{
    __LuaClassPreprocess(obj, sel, L);
    
    return VMKCheckObject(L, -1);
}

#undef __LuaClassPreprocess

static int luaObjC_class_addMethod(VMKLuaStateRef state, BOOL isObjectMethod)
{
    int argCount = lua_gettop(state);
    
    const char * className = lua_tostring(state, 1);
    const char* selectorName = VMKCheckString(state, 2);
    
    NSMutableString *typeEncoding = [[NSMutableString alloc] init];
    
    //return type
    //
    const char* typeLooper = VMKCheckString(state, 3);
    const char* returnType = VMKTypeEncodingOfType(typeLooper);
    
    [typeEncoding appendFormat: @"%s", VMKTypeEncodingOfType(typeLooper)];
    
    //id && selector
    //
    [typeEncoding appendString: @"@:"];
    
    for (int iLooper = 4; iLooper < argCount; ++iLooper)
    {
        typeLooper = VMKCheckString(state, iLooper);
        
        [typeEncoding appendFormat: @"%s", VMKTypeEncodingOfType(typeLooper)];
    }
    
    
    SEL sel = sel_registerName(selectorName);
    
    Class theClass = LuaInternalGetClass(className);
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
    
    luaObjC_addClosureIDForSelector(classToAddClosure, luaL_ref(state, LUA_REGISTRYINDEX), selectorName, !isObjectMethod);
    
    [typeEncoding release];
    
    return 0;
}


int LuaIMPAddInstanceMethod(VMKLuaStateRef state)
{
    return luaObjC_class_addMethod(state, YES);
}

int LuaIMPAddClassMethod(VMKLuaStateRef state)
{
    return luaObjC_class_addMethod(state, NO);
}
