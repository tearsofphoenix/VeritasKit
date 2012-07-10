//
//  LuaObjCMessage.m
//  LuaIOS
//
//  Created by E-Reach Administrator on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCMessage.h"
#import "LuaObjCClass.h"
#import "LuaObjCInternal.h"
#import "LuaObjCAccelerator.h"
#import "LuaCGGeometry.h"
#import "LuaObjCAuxiliary.h"

#import <objc/runtime.h>
#import <objc/message.h>


static bool ObjectSupport_NeedsStret(NSString* return_value_objc_encoding_type)
{
    //
    // From PyObjC and JSCocoa: when to call objc_msgSend_stret, for structure return
    //		Depending on structure size & architecture, structures are returned as function first argument (done transparently by ffi) or via registers
    //
#if defined(__ppc__)
#   define SMALL_STRUCT_LIMIT	4
#elif defined(__ppc64__)
#   define SMALL_STRUCT_LIMIT	8
#elif defined(__i386__) 
#   define SMALL_STRUCT_LIMIT 	8
#elif defined(__x86_64__) 
#   define SMALL_STRUCT_LIMIT	16
#elif TARGET_OS_IPHONE
    // TOCHECK
#   define SMALL_STRUCT_LIMIT	4
#else
#   error "Unsupported MACOSX platform"
#endif
    
	int resultSize = 0;
	if(nil == return_value_objc_encoding_type)
	{
		return false;
	}
	char returnEncoding = [return_value_objc_encoding_type UTF8String][0];
	if (returnEncoding == _C_STRUCT_B)
	{
		resultSize = sizeof(CGRect);		
	}
	if (returnEncoding == _C_STRUCT_B && 
        
		(resultSize > SMALL_STRUCT_LIMIT
#ifdef __i386__
		 /* darwin/x86 ABI is slightly odd ;-) */
		 || (resultSize != 1 
			 && resultSize != 2 
			 && resultSize != 4 
			 && resultSize != 8)
#endif
#ifdef __x86_64__
		 /* darwin/x86-64 ABI is slightly odd ;-) */
		 || (resultSize != 1 
			 && resultSize != 2 
			 && resultSize != 4 
			 && resultSize != 8
			 && resultSize != 16
			 )
#endif
		 )
		//#endif /* !__ppc64__ */
		) 
    {
		return true;
	}
	
    return false;	
    
#undef SMALL_STRUCT_LIMIT
    
}

//
//	Return the correct objc_msgSend* variety according to encodings
//
static void* ObjectSupport_GetObjcMsgSendCallAddress(NSString* return_value_objc_encoding_type, bool is_super)
{
	bool needs_stret = ObjectSupport_NeedsStret(return_value_objc_encoding_type);
	void* call_address = NULL;
    
	if(is_super)
	{
		if(needs_stret)
		{
			call_address = (void*)objc_msgSendSuper_stret;
		}
		else
		{
			call_address = (void*)objc_msgSendSuper;
		}
	}
	else
	{
		if(needs_stret)
		{	
			call_address = (void*)objc_msgSend_stret;
		}
#if defined(__i386__)
		else if(!strncmp([return_value_objc_encoding_type UTF8String], @encode(float), 1) || !strncmp([return_value_objc_encoding_type UTF8String], @encode(double), 1) || !strncmp([return_value_objc_encoding_type UTF8String], @encode(long double), 1))
		{
			call_address = objc_msgSend_fpret;
		}
#elif defined(__x86_64__)
		else if(!strncmp([return_value_objc_encoding_type UTF8String], @encode(long double), 1))
		{
			call_address = objc_msgSend_fpret;
		}
#endif
		else
		{
			call_address = objc_msgSend;
		}
	}
	
	return call_address;
}

static int _luaObjC_objc_messageSendGeneral(lua_State *L, BOOL isToSelfClass)
{    
    LuaObjCClassRef anObj = lua_touserdata(L, 1);   
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
    
    id obj = LuaObjCClassGetObject(anObj);
    
    //optimize for nil object call
    //
    if (!obj)
    {
        lua_pushnil(L);
        return 0;
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
        
        
        for (NSUInteger iLooper = 2; iLooper < numberOfArguments; ++iLooper)
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
                    int integerPara = luaObjC_checkInteger(L,  iLooper + 1);
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

int luaObjc_method_super_call(lua_State *L)
{
    return _luaObjC_objc_messageSendGeneral(L, NO);
}