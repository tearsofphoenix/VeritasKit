//
//  LuaObjCAccelerator.m
//  LuaIOS
//
//  Created by tearsofphoenix on 3/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LuaObjCAccelerator.h"

#import "LuaObjCStructs.h"

#import "LuaObjCAuxiliary.h"

#import "LuaObjCInternal.h"

#import "LuaNSObjectSupport.h"

#import <objc/message.h>

int LuaObjCAcceleratorForNoArgument(lua_State *L, const char* returnType,
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

#pragma mark - source

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

