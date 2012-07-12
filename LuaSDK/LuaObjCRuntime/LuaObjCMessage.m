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
#import "ffi.h"
#import "LuaBridgeFunctor.h"
#import "NSMethodSignature+argumentsEncodings.h"
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
        
        LuaBridgeFuncotrRef invocation = LuaObjCInvocationCreate(impRef);
        LuaBridgeFunctorInitialize(invocation, [methodSignature argumentsEncodings], returnType);
        
        LuaObjCInvocationSetArgumentAtInex(invocation, 0, obj);
        LuaObjCInvocationSetArgumentAtInex(invocation, 1, selector);
        //stackDump(L);
        for (NSUInteger iLooper = 2; iLooper < numberOfArguments; ++iLooper)
        {
            const char* argType = [methodSignature getArgumentTypeAtIndex: iLooper];
            argType = _luaObjCInternal_jumpoverEncodingDecorator(argType);
            
            LuaObjCInvocationSetArgumentFromLuaStateAtInex(invocation, L, iLooper + 1, argType, iLooper);
        }
        
        LuaObjCInvoke(L, invocation);
        
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