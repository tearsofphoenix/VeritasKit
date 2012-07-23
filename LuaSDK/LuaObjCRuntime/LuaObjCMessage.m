//
//  LuaObjCMessage.m
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCMessage.h"
#import "LuaObjCClass.h"
#import "LuaObjCInternal.h"
#import "LuaObjCAccelerator.h"
#import "LuaCGGeometry.h"
#import "LuaObjCAuxiliary.h"
#import "lua.h"
#import "lauxlib.h"
#import "ffi.h"
#import "LuaBridgeFunctor.h"
#import "NSMethodSignature+argumentsEncodings.h"
#import <objc/runtime.h>
#import <objc/message.h>

static int _luaObjC_objc_messageSendGeneral(lua_State *L, BOOL isToSelfClass)
{    
    LuaClassRef anObj = lua_touserdata(L, 1);   
    //optimize for nil object call
    //
    if (!anObj)
    {
        lua_pushnil(L);
        return 0;
    }
    
    const char *selectorName = lua_tostring(L, 2);    
    //printf("SEL: %s\n", selectorName);
    SEL selector = sel_registerName(selectorName);
    
    //deside object
    //
    
    id obj = LuaClassGetObject(anObj);
    
    //optimize for nil object call
    //
    if (!obj)
    {
        lua_pushnil(L);
        return 0;
    }
    
    //is implemented by objective-lua ?
    lua_Debug ar;
    lua_getstack(L, 1, &ar);
    int index = 2;
    const char *name = lua_getlocal(L, &ar, index);
    if (name && !strcmp(name, "_cmd"))
    {
        lua_pushstring(L, selectorName);
        if(!lua_rawequal(L, -1, -2))
        {
            Class targetClass = nil;
            if (isToSelfClass)
            {
                targetClass = [obj class];
            }else
            {
                targetClass = [obj superclass];
            }
            
            LuaClassRef classRef = luaObjC_getRegisteredClassByName(NSStringFromClass(targetClass));
            
            int closurID = LuaClassGetClouserIDOfSelector(classRef, selector);
            if (closurID != LuaObjCInvalidClouserID)
            {
                lua_rawgeti(L, LUA_REGISTRYINDEX, closurID);
                //lua_settop(L, -1);
                lua_replace(L, -1);

                int count = luaObjCInternal_getArgumentOfSelector(selector) + 1 + 1; //include the 'self' and '_cmd' argument
                //lua_replace(L, -1);
                //lua_insert(L, 0);
                printf("SEL: %s\n", selectorName);
                //stackDump(L);
                int status = lua_pcall(L, count, 1, 0);
                if(status != LUA_OK)
                {
                    lua_error(L);
                }
                
                //stackDump(L);
                
                //set return value on top of stack
                //
                //lua_settop(L, 1);
                return 1;
            }
        }
    }
    
    //deside IMP
    //
    IMP impRef = (IMP)luaObjC_getAcceleratorIMPBySelector(selector);
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
            impRef = class_getMethodImplementation([obj superclass], selector);
            
        }
        
        NSMethodSignature *methodSignature = [obj methodSignatureForSelector: selector];
        
        if (!methodSignature) 
        {
            printf("[#ERROR#] line: %d nil method signature for SEL:%s\n", __LINE__, selectorName);
        }
        
        NSUInteger numberOfArguments = [methodSignature numberOfArguments];
        const char* returnType = [methodSignature methodReturnType];
        
        //printf("SEL: %s\n", (const char*)selector);
        
        if (numberOfArguments == 2)
        {
            return luaObjC_callImplementation_specializeForNoArgument(L, returnType, impRef, obj, selector);
        }
        
        if (numberOfArguments == 3)
        {
            const char* firstArgType = [methodSignature getArgumentTypeAtIndex: 2];
            return luaObjC_callImplementation_specializeForOneArgument(L, firstArgType, returnType, impRef, obj, selector);
        }
        
        NSInvocation *invokation = [NSInvocation invocationWithMethodSignature: methodSignature];
        [invokation setTarget: obj];
        [invokation setSelector: selector];
        
        
        for (int iLooper = 2; iLooper < numberOfArguments; ++iLooper)
        {
            const char* argType = [methodSignature getArgumentTypeAtIndex: iLooper];
            argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);
            switch (*argType)
            {
                case 'c':
                case 'i':
                case 's':
                case 'l':
                case 'q':
                case 'C':
                case 'I':
                case 'S':
                case 'L':
                case 'Q':
                case 'B':
                {
                    lua_Integer integerPara = luaObjC_checkInteger(L,  iLooper + 1);
                    [invokation setArgument: &integerPara
                                    atIndex: iLooper];
                    break;
                }
                case 'f':
                case 'd':
                {
                    CGFloat doublePara = lua_tonumber(L,  iLooper + 1);
                    [invokation setArgument: &doublePara
                                    atIndex: iLooper];
                    break;
                }
                case '*':
                {
                    const char *str = lua_tostring(L,  iLooper + 1);
                    [invokation setArgument: &str
                                    atIndex: iLooper];
                    break;
                }
                case '@':
                {
                    id argLooper = luaObjC_checkNSObject(L,  iLooper + 1);
                    [invokation setArgument: &argLooper
                                    atIndex: iLooper];
                    break;
                }
                case ':':
                {
                    const char *str = lua_tostring(L,  iLooper + 1);
                    SEL sel = NSSelectorFromString([NSString stringWithCString: str
                                                                      encoding: NSUTF8StringEncoding]);
                    [invokation setArgument: &sel
                                    atIndex: iLooper];
                    
                    break;
                }
                case '{':
                {
                    if (!strcmp(argType, @encode(CGRect)))
                    {
                        CGRect *rect = lua_touserdata(L,  iLooper + 1);
                        [invokation setArgument: rect
                                        atIndex: iLooper];
                        
                    }else if (!strcmp(argType, @encode(CGPoint)))
                    {
                        CGPoint *point = lua_touserdata(L,  iLooper + 1);
                        [invokation setArgument: point
                                        atIndex: iLooper];
                        
                    }else if (!strcmp(argType, @encode(CGSize)))
                    {
                        CGSize *size = lua_touserdata(L,  iLooper + 1);
                        [invokation setArgument: size
                                        atIndex: iLooper];
                    }
                    break;
                }
                case '^':
                case '[':
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
        [invokation invoke];
        
        switch (*returnType) 
        {
                
            case 'c':
            case 'i':
            case 's':
            case 'l':
            case 'q':
            case 'C':
            case 'I':
            case 'S':
            case 'L':
            case 'Q':
            case 'B':
            {
                int integerPara = 0;
                [invokation getReturnValue: &integerPara];
                lua_pushinteger(L, integerPara);
                return 1;
            }
            case 'f':
            case 'd':
            {
                CGFloat doublePara = 0;
                [invokation getReturnValue: &doublePara];
                lua_pushnumber(L, doublePara);
                return 1;
            }
            case '*':
            {
                const char *str = NULL;
                [invokation getReturnValue: &str];
                lua_pushstring(L, str);
                return 1;
            }
            case '@':
            {
                id obj = nil;                
                [invokation getReturnValue: &obj];
                luaObjC_pushNSObject(L, obj);
                return 1;
            }
            case ':':
            {
                SEL sel = NULL;
                [invokation getReturnValue: &sel];
                luaObjC_pushNSObject(L, NSStringFromSelector(sel));
                return 1;
            }
            case '{':
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
            case '^':
            case '[':
            {
                void *p = NULL;
                [invokation getReturnValue: &p];
                lua_pushlightuserdata(L, p);
                return 1;
            }
            case 'v':
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

int luaObjC_objc_messageSend(lua_State *L)
{    
    return _luaObjC_objc_messageSendGeneral(L, YES);
}

int luaObjC_objc_messageSend_Super(lua_State *L)
{
    return _luaObjC_objc_messageSendGeneral(L, NO);
}