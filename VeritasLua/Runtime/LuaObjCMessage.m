//
//  LuaObjCMessage.m
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaNSObjectSupport.h"

#import "LuaObjCMessage.h"

#import "LuaCGGeometry.h"

#import "LuaObjCAuxiliary.h"

#import "LuaObjCStructs.h"

#import <objc/message.h>

#pragma mark - support for extend accelerator

static CFMutableDictionaryRef __preAccelerators = nil;

static inline void LuaObjCAcceleratorInitialize(void)
{
    __preAccelerators = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 64, NULL, &kCFTypeDictionaryValueCallBacks);
}

void LuaObjCRegisterAccelerator(Class theClass, SEL selector, LuaObjCAcceleratorIMP imp)
{
    if (!__preAccelerators)
    {
        LuaObjCAcceleratorInitialize();
    }
    
    CFMutableDictionaryRef classAccelerators = (CFMutableDictionaryRef)CFDictionaryGetValue(__preAccelerators, theClass);
    if (!classAccelerators)
    {
        classAccelerators = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 1024, NULL, NULL);
        
        CFDictionaryAddValue(__preAccelerators, theClass, classAccelerators);
        
        CFRelease(classAccelerators);
        
    }
    
    CFDictionaryAddValue(classAccelerators, selector, imp);
    
}

LuaObjCAcceleratorIMP LuaObjCGetRegisterIMPOfSelector(Class theClass, SEL selector)
{
    CFMutableDictionaryRef classAccelerators = (CFMutableDictionaryRef)CFDictionaryGetValue(__preAccelerators, theClass);
    if (classAccelerators)
    {
        return CFDictionaryGetValue(classAccelerators, selector);
    }
    
    return NULL;
}

#pragma mark - accelerator

static const char* LuaInternalJumpoverEncodingDecorator(const char* charLooper)
{
    if (charLooper)
    {
        switch (*charLooper)
        {
            case _C_CONST: //const
            case 'n': //in
            case 'N': //inout
            case 'o': //out
            case 'O': //bycopy
            case 'R': //byref
            case 'V': //oneway
            {
                return ++charLooper;
            }
            default:
            {
                return charLooper;
            }
        }
    }
    return charLooper;
}

//accelerator for methods that have no argument
//
static int LuaObjCAcceleratorForNoArgument(lua_State *L, const char* returnType,
                                    IMP impRef, id obj, SEL selector)
{
    returnType = LuaInternalJumpoverEncodingDecorator(returnType);
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
            typedef NSInteger (* _IMP_T)(id, SEL);
            lua_pushinteger(L, ((_IMP_T)impRef)(obj, selector));
            return 1;
        }
        case _C_FLT:
        case _C_DBL:
        {
            typedef float (* _IMP_T)(id, SEL);
            lua_pushnumber(L, ((_IMP_T)impRef)(obj, selector));
            return 1;
        }
        case _C_CHARPTR:
        {
            typedef const char* (* _IMP_T)(id, SEL);
            lua_pushstring(L, ((_IMP_T)impRef)(obj, selector));
            return 1;
        }
        case _C_CLASS:
        {
            id result = impRef(obj, selector);
            LuaObjCPushObject(L, result, true, true);
            return 1;
        }
        case _C_ID:
        {
            id result = impRef(obj, selector);
            
            if (sel_isEqual(selector, @selector(alloc)))
            {
                
                LuaObjCPushObject(L, result, false, false);
                
            }else
            {
                LuaObjCPushObject(L, result, true, false);
            }
            
            return 1;
        }
        case _C_SEL:
        {
            typedef SEL (* _IMP_T)(id, SEL);
            LuaObjCPushSelector(L, ((_IMP_T)impRef)(obj, selector));
            return 1;
        }
        case _C_STRUCT_B:
        {
            if (!strcmp(returnType, @encode(CGRect)))
            {
                typedef CGRect (* _IMP_T)(id, SEL);
                LuaObjCPushCGRect(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CGPoint)))
            {
                typedef CGPoint (* _IMP_T)(id, SEL);
                LuaObjCPushCGPoint(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CGSize)))
            {
                typedef CGSize (* _IMP_T)(id, SEL);
                LuaObjCPushCGSize(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(NSRange)))
            {
                typedef NSRange (* _IMP_T)(id, SEL);
                LuaObjCPushNSRange(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CATransform3D)))
            {
                typedef CATransform3D (* _IMP_T)(id, SEL);
                LuaObjCPushCATransform3D(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CGAffineTransform)))
            {
                typedef CGAffineTransform (* _IMP_T)(id, SEL);
                LuaObjCPushCGAffineTransform(L, ((_IMP_T)impRef)(obj, selector));
            }
            return 1;
        }
        case _C_PTR:
        case _C_ARY_B:
        {
            typedef void* (* _IMP_T)(id, SEL);
            void *p = ((_IMP_T)impRef)(obj, selector);
            lua_pushlightuserdata(L, p);
            return 1;
        }
        case _C_VOID:
        case 'V':
        {
            typedef void (* _IMP_T)(id, SEL);
            ((_IMP_T)impRef)(obj, selector);
            return 0;
        }
        default:
        {
            return 0;
        }
    }
}

#pragma mark - helper functions

static const char* LuaInternalGetCurrentLineSource(lua_Debug *ar)
{
    if (ar)
    {
        const char* source = ar->source;
        
        NSString *theString = [NSString stringWithUTF8String: source];
        
        NSArray *result = [theString componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]];
        
        NSString *theLineSource = [result objectAtIndex: ar->currentline];
        
        return [theLineSource UTF8String];
    }
    
    return NULL;
}

#pragma mark - message send routine implementation

@interface NSInvocation (PrivateMethodsExpose)

- (void)invokeSuper;

@end

static int _luaObjC_objc_messageSendGeneral(lua_State *L, BOOL isToSelfClass)
{
 
#if DEBUG
    /*
    lua_Debug debugInfo;
    lua_getstack(L, 1, &debugInfo);
    lua_getinfo(L, "Sl", &debugInfo);
    printf("in line: %d %s\n", debugInfo.currentline, LuaInternalGetCurrentLineSource(&debugInfo));
     */
#else
    
#endif
    
    LuaObjectRef anObj = lua_touserdata(L, 1);
    //optimize for nil object call
    //
    if (!anObj)
    {
        lua_pushnil(L);
        return 0;
    }
    
    const char *selectorName = lua_tostring(L, 2);

    SEL selector = sel_getUid(selectorName);
    
    //deside object
    //
    
    id obj = LuaObjectGetObject(anObj);
    
    //optimize for nil object call
    //
    if (!obj)
    {
        lua_pushnil(L);
        return 0;
    }
    
    Class objClass = object_getClass(obj);
    
    IMP impRef = (IMP)LuaObjCGetRegisterIMPOfSelector(objClass, selector);
    if (impRef)
    {
        return ((LuaObjCAcceleratorIMP)impRef)(obj, selector, L);
    }else
    {
        if (isToSelfClass)
        {
            impRef = [obj methodForSelector: selector];
            
        }else
        {
            impRef = class_getMethodImplementation(class_getSuperclass(objClass), selector);
            
        }
        
        NSMethodSignature *methodSignature = [obj methodSignatureForSelector: selector];
        
        if (!methodSignature)
        {
            NSException *exception = [NSException exceptionWithName: @"LuaObjCInvalidArgument"
                                                             reason: [NSString stringWithFormat: @"[#ERROR#] line: %d nil method signature for SEL:%s for: %@\n", __LINE__, selectorName, obj]
                                                           userInfo: nil];
                        
            @throw exception;
        }
        
        NSUInteger numberOfArguments = [methodSignature numberOfArguments];
        const char* returnType = [methodSignature methodReturnType];
                
        if (numberOfArguments == 2)
        {
            return LuaObjCAcceleratorForNoArgument(L, returnType, impRef, obj, selector);
        }
        
        NSInvocation *invokation = [NSInvocation invocationWithMethodSignature: methodSignature];
        [invokation setTarget: obj];
        [invokation setSelector: selector];
        
        
        for (int iLooper = 2; iLooper < numberOfArguments; ++iLooper)
        {
            const char* argType = [methodSignature getArgumentTypeAtIndex: iLooper];
            argType = LuaInternalJumpoverEncodingDecorator(argType);
            switch (*argType)
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
                    lua_Integer integerPara = LuaObjCCheckInteger(L,  iLooper + 1);
                    [invokation setArgument: &integerPara
                                    atIndex: iLooper];
                    break;
                }
                case _C_FLT:
                case _C_DBL:
                {
                    CGFloat doublePara = lua_tonumber(L,  iLooper + 1);
                    [invokation setArgument: &doublePara
                                    atIndex: iLooper];
                    break;
                }
                case _C_CHARPTR:
                {
                    const char *str = lua_tostring(L,  iLooper + 1);
                    [invokation setArgument: &str
                                    atIndex: iLooper];
                    break;
                }
                case _C_CLASS:
                case _C_ID:
                {
                    id argLooper = LuaObjCCheckObject(L,  iLooper + 1);
                    [invokation setArgument: &argLooper
                                    atIndex: iLooper];
                    break;
                }
                case _C_SEL:
                {
                    const char *str = lua_tostring(L,  iLooper + 1);
                    SEL sel = sel_getUid(str);

                    [invokation setArgument: &sel
                                    atIndex: iLooper];
                    
                    break;
                }
                case _C_STRUCT_B:
                {
                    void *structValue = lua_touserdata(L,  iLooper + 1);
                    [invokation setArgument: structValue
                                    atIndex: iLooper];
                    
                    break;
                }
                case _C_PTR:
                case _C_ARY_B:
                {
                    void *p = lua_touserdata(L,  iLooper + 1);
                    [invokation setArgument: &p
                                    atIndex: iLooper];
                    break;
                }
                default:
                {
                    break;
                }
            }
        }
        
        [invokation retainArguments];
        
        if (isToSelfClass)
        {
            [invokation invoke];
        }else
        {
            [invokation invokeSuper];
        }
        
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
                NSInteger integerPara = 0;
                [invokation getReturnValue: &integerPara];
                lua_pushinteger(L, integerPara);
                return 1;
            }
            case _C_FLT:
            case _C_DBL:
            {
                CGFloat doublePara = 0;
                [invokation getReturnValue: &doublePara];
                lua_pushnumber(L, doublePara);
                return 1;
            }
            case _C_CHARPTR:
            {
                const char *str = NULL;
                [invokation getReturnValue: &str];
                lua_pushstring(L, str);
                return 1;
            }
            case _C_CLASS:
            {
                id obj = nil;
                [invokation getReturnValue: &obj];
                
                LuaObjCPushObject(L, obj, true, true);
                
                return 1;

            }
            case _C_ID:
            {
                id obj = nil;
                [invokation getReturnValue: &obj];
               
                LuaObjCPushObject(L, obj, true, false);
                
                return 1;
            }
            case _C_SEL:
            {
                SEL sel = NULL;
                [invokation getReturnValue: &sel];
                LuaObjCPushSelector(L, sel);
                return 1;
            }
            case _C_STRUCT_B:
            {
                
                if (!strcmp(returnType, @encode(CGRect)))
                {
                    CGRect cgRect ;
                    [invokation getReturnValue: &cgRect];
                    LuaObjCPushCGRect(L, cgRect);
                    
                }else if (!strcmp(returnType, @encode(CGPoint)))
                {
                    CGPoint cgPoint;
                    [invokation getReturnValue: &cgPoint];
                    LuaObjCPushCGPoint(L, cgPoint);
                    
                }else if (!strcmp(returnType, @encode(CGSize)))
                {
                    CGSize cgSize;
                    [invokation getReturnValue: &cgSize];
                    LuaObjCPushCGSize(L, cgSize);
                }
                return 1;
            }
            case _C_PTR:
            case _C_ARY_B:
            {
                void *p = NULL;
                [invokation getReturnValue: &p];
                lua_pushlightuserdata(L, p);
                return 1;
            }
            case _C_VOID:
            {
                return 0;
            }
            default:
            {
                return 0;
            }
        }
    }
    return 1;
}

int LuaObjCMessageSend(lua_State *L)
{
    return _luaObjC_objc_messageSendGeneral(L, YES);
}

int LuaObjCMessageSendSuper(lua_State *L)
{
    return _luaObjC_objc_messageSendGeneral(L, NO);
}