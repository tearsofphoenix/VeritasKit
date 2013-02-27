//
//  VMKMessage.m
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VMKObject.h"
#import "VMKMessage.h"

#import "VMKAuxiliary.h"
#import "VMKStructs.h"

#import "LuaCGGeometry.h"

#import <objc/message.h>

#pragma mark - support for extend accelerator

static CFMutableDictionaryRef __preAccelerators = NULL;

void VMKRegisterAccelerator(Class theClass, SEL selector, VMKAcceleratorIMP imp)
{
    if (!__preAccelerators)
    {
        __preAccelerators = CFDictionaryCreateMutable(NULL, 64, NULL, &kCFTypeDictionaryValueCallBacks);
    }
    
    CFMutableDictionaryRef classAccelerators = (CFMutableDictionaryRef)CFDictionaryGetValue(__preAccelerators, theClass);
    if (!classAccelerators)
    {
        classAccelerators = CFDictionaryCreateMutable(NULL, 1024, NULL, NULL);
        
        CFDictionaryAddValue(__preAccelerators, theClass, classAccelerators);
        
        CFRelease(classAccelerators);
        
    }
    
    CFDictionaryAddValue(classAccelerators, selector, imp);
    
}

VMKAcceleratorIMP VMKGetRegisterIMPOfSelector(Class theClass, SEL selector)
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
static int VMKAcceleratorForNoArgument(VMKLuaStateRef state, const char* returnType,
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
            lua_pushinteger(state, ((_IMP_T)impRef)(obj, selector));
            return 1;
        }
        case _C_FLT:
        case _C_DBL:
        {
            typedef float (* _IMP_T)(id, SEL);
            lua_pushnumber(state, ((_IMP_T)impRef)(obj, selector));
            return 1;
        }
        case _C_CHARPTR:
        {
            typedef const char* (* _IMP_T)(id, SEL);
            lua_pushstring(state, ((_IMP_T)impRef)(obj, selector));
            return 1;
        }
        case _C_CLASS:
        {
            id result = impRef(obj, selector);
            VMKPushObject(state, result, true);
            return 1;
        }
        case _C_ID:
        {
            id result = impRef(obj, selector);
            
            if (sel_isEqual(selector, @selector(alloc)))
            {
                
                VMKPushObject(state, result, false);
                
            }else
            {
                VMKPushObject(state, result, false);
            }
            
            return 1;
        }
        case _C_SEL:
        {
            typedef SEL (* _IMP_T)(id, SEL);
            VMKPushSelector(state, ((_IMP_T)impRef)(obj, selector));
            return 1;
        }
        case _C_STRUCT_B:
        {
            if (!strcmp(returnType, @encode(CGRect)))
            {
                typedef CGRect (* _IMP_T)(id, SEL);
                VMKPushCGRect(state, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CGPoint)))
            {
                typedef CGPoint (* _IMP_T)(id, SEL);
                VMKPushCGPoint(state, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CGSize)))
            {
                typedef CGSize (* _IMP_T)(id, SEL);
                VMKPushCGSize(state, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(NSRange)))
            {
                typedef NSRange (* _IMP_T)(id, SEL);
                VMKPushNSRange(state, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CATransform3D)))
            {
                typedef CATransform3D (* _IMP_T)(id, SEL);
                VMKPushCATransform3D(state, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CGAffineTransform)))
            {
                typedef CGAffineTransform (* _IMP_T)(id, SEL);
                VMKPushCGAffineTransform(state, ((_IMP_T)impRef)(obj, selector));
            }
            return 1;
        }
        case _C_PTR:
        case _C_ARY_B:
        {
            typedef void* (* _IMP_T)(id, SEL);
            void *p = ((_IMP_T)impRef)(obj, selector);
            lua_pushlightuserdata(state, p);
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
        
        NSString *theString = @( source );
        
        NSArray *result = [theString componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]];
        
        NSString *theLineSource = [result objectAtIndex: ar->currentline];
        
        return [theLineSource UTF8String];
    }
    
    return NULL;
}

#pragma mark - message send routine implementation

static int _luaObjC_objc_messageSendGeneral(VMKLuaStateRef state, BOOL isToSelfClass)
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
    
    VMKObjectRef anObj = lua_touserdata(state, 1);
    //optimize for nil object call
    //
    if (!anObj)
    {
        lua_pushnil(state);
        return 0;
    }
    
    const char *selectorName = lua_tostring(state, 2);

    SEL selector = sel_getUid(selectorName);
    
    //deside object
    //
    
    id obj = VMKObjectGetObject(anObj);
    
    //optimize for nil object call
    //
    if (!obj)
    {
        lua_pushnil(state);
        return 0;
    }
    
    Class objClass = object_getClass(obj);
    
    IMP impRef = (IMP)VMKGetRegisterIMPOfSelector(objClass, selector);
    if (impRef)
    {
        return ((VMKAcceleratorIMP)impRef)(obj, selector, state);
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
            NSException *exception = [NSException exceptionWithName: @"VMKInvalidArgument"
                                                             reason: [NSString stringWithFormat: @"[#ERROR#] line: %d nil method signature for SEL:%s for: %@\n", __LINE__, selectorName, obj]
                                                           userInfo: nil];
                        
            @throw exception;
        }
        
        NSUInteger numberOfArguments = [methodSignature numberOfArguments];
        const char* returnType = [methodSignature methodReturnType];
                
        if (numberOfArguments == 2)
        {
            return VMKAcceleratorForNoArgument(state, returnType, impRef, obj, selector);
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
                    lua_Integer integerPara = VMKCheckInteger(state,  iLooper + 1);
                    [invokation setArgument: &integerPara
                                    atIndex: iLooper];
                    break;
                }
                case _C_FLT:
                case _C_DBL:
                {
                    CGFloat doublePara = lua_tonumber(state,  iLooper + 1);
                    [invokation setArgument: &doublePara
                                    atIndex: iLooper];
                    break;
                }
                case _C_CHARPTR:
                {
                    const char *str = lua_tostring(state,  iLooper + 1);
                    [invokation setArgument: &str
                                    atIndex: iLooper];
                    break;
                }
                case _C_CLASS:
                case _C_ID:
                {
                    id argLooper = VMKCheckObject(state,  iLooper + 1);
                    [invokation setArgument: &argLooper
                                    atIndex: iLooper];
                    break;
                }
                case _C_SEL:
                {
                    const char *str = lua_tostring(state,  iLooper + 1);
                    SEL sel = sel_getUid(str);

                    [invokation setArgument: &sel
                                    atIndex: iLooper];
                    
                    break;
                }
                case _C_STRUCT_B:
                {
                    void *structValue = lua_touserdata(state,  iLooper + 1);
                    [invokation setArgument: structValue
                                    atIndex: iLooper];
                    
                    break;
                }
                case _C_PTR:
                case _C_ARY_B:
                {
                    void *p = lua_touserdata(state,  iLooper + 1);
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
            //as `invokeSuper' is private
            //
            objc_msgSend(invokation, @selector(invokeSuper));
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
                lua_pushinteger(state, integerPara);
                return 1;
            }
            case _C_FLT:
            case _C_DBL:
            {
                CGFloat doublePara = 0;
                [invokation getReturnValue: &doublePara];
                lua_pushnumber(state, doublePara);
                return 1;
            }
            case _C_CHARPTR:
            {
                const char *str = NULL;
                [invokation getReturnValue: &str];
                lua_pushstring(state, str);
                return 1;
            }
            case _C_CLASS:
            {
                id obj = nil;
                [invokation getReturnValue: &obj];
                
                VMKPushObject(state, obj, true);
                
                return 1;

            }
            case _C_ID:
            {
                id obj = nil;
                [invokation getReturnValue: &obj];
               
                VMKPushObject(state, obj, false);
                
                return 1;
            }
            case _C_SEL:
            {
                SEL sel = NULL;
                [invokation getReturnValue: &sel];
                VMKPushSelector(state, sel);
                return 1;
            }
            case _C_STRUCT_B:
            {
                
                if (!strcmp(returnType, @encode(CGRect)))
                {
                    CGRect cgRect ;
                    [invokation getReturnValue: &cgRect];
                    VMKPushCGRect(state, cgRect);
                    
                }else if (!strcmp(returnType, @encode(CGPoint)))
                {
                    CGPoint cgPoint;
                    [invokation getReturnValue: &cgPoint];
                    VMKPushCGPoint(state, cgPoint);
                    
                }else if (!strcmp(returnType, @encode(CGSize)))
                {
                    CGSize cgSize;
                    [invokation getReturnValue: &cgSize];
                    VMKPushCGSize(state, cgSize);
                }
                return 1;
            }
            case _C_PTR:
            case _C_ARY_B:
            {
                void *p = NULL;
                [invokation getReturnValue: &p];
                lua_pushlightuserdata(state, p);
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

int VMKMessageSend(VMKLuaStateRef state)
{
    return _luaObjC_objc_messageSendGeneral(state, YES);
}

int VMKMessageSendSuper(VMKLuaStateRef state)
{
    return _luaObjC_objc_messageSendGeneral(state, NO);
}