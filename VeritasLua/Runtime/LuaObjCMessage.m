//
//  LuaObjCMessage.m
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaNSObjectSupport.h"

#import "LuaObjCInternal.h"

#import "LuaObjCAccelerator.h"

#import "LuaCGGeometry.h"

#import "LuaObjCAuxiliary.h"

#import <objc/message.h>

@interface NSInvocation (PrivateMethodsExpose)

- (void)invokeSuper;

@end

static int _luaObjC_objc_messageSendGeneral(lua_State *L, BOOL isToSelfClass)
{
    
    LuaObjectRef anObj = lua_touserdata(L, 1);
    //optimize for nil object call
    //
    if (!anObj)
    {
        lua_pushnil(L);
        return 0;
    }
    
    const char *selectorName = lua_tostring(L, 2);
    //printf("SEL: %s\n", selectorName);
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
    
    IMP impRef = (IMP)luaObjC_getAcceleratorIMPOfSelector(objClass, selector);
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
            NSLog(@"[#ERROR#] line: %d nil method signature for SEL:%s for: %@\n", __LINE__, selectorName, obj);
        }
        
        NSUInteger numberOfArguments = [methodSignature numberOfArguments];
        const char* returnType = [methodSignature methodReturnType];
        
        //printf("SEL: %s\n", (const char*)selector);
        
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
            argType = LuaObjCInternal_jumpoverEncodingDecorator(argType);
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
                    lua_Integer integerPara = luaObjC_checkInteger(L,  iLooper + 1);
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
                    id argLooper = luaObjC_checkNSObject(L,  iLooper + 1);
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
            case _C_ID:
            {
                id obj = nil;
                [invokation getReturnValue: &obj];
               
                luaObjC_pushNSObject(L, obj, true);
                
                return 1;
            }
            case _C_SEL:
            {
                SEL sel = NULL;
                [invokation getReturnValue: &sel];
                luaObjC_pushSelector(L, sel);
                return 1;
            }
            case _C_STRUCT_B:
            {
                
                if (!strcmp(returnType, @encode(CGRect)))
                {
                    CGRect cgRect ;
                    [invokation getReturnValue: &cgRect];
                    lua_pushCGRect(L, cgRect);
                    
                }else if (!strcmp(returnType, @encode(CGPoint)))
                {
                    CGPoint cgPoint;
                    [invokation getReturnValue: &cgPoint];
                    lua_pushCGPoint(L, cgPoint);
                    
                }else if (!strcmp(returnType, @encode(CGSize)))
                {
                    CGSize cgSize;
                    [invokation getReturnValue: &cgSize];
                    lua_pushCGSize(L, cgSize);
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