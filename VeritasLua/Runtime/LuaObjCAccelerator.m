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

#import <objc/message.h>

int LuaObjCAcceleratorForNoArgument(lua_State *L, const char* returnType,
                                    IMP impRef, id obj, SEL selector)
{
    returnType = LuaObjCInternal_jumpoverEncodingDecorator(returnType);
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
        case _C_ID:
        {
            luaObjC_pushNSObject(L, impRef(obj, selector));
            return 1;
        }
        case _C_SEL:
        {
            typedef SEL (* _IMP_T)(id, SEL);
            luaObjC_pushSelector(L, ((_IMP_T)impRef)(obj, selector));
            return 1;
        }
        case _C_STRUCT_B:
        {
            if (!strcmp(returnType, @encode(CGRect)))
            {
                typedef CGRect (* _IMP_T)(id, SEL);
                lua_pushCGRect(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CGPoint)))
            {
                typedef CGPoint (* _IMP_T)(id, SEL);
                lua_pushCGPoint(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CGSize)))
            {
                typedef CGSize (* _IMP_T)(id, SEL);
                lua_pushCGSize(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(NSRange)))
            {
                typedef NSRange (* _IMP_T)(id, SEL);
                lua_pushNSRange(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CATransform3D)))
            {
                typedef CATransform3D (* _IMP_T)(id, SEL);
                lua_pushCATransform3D(L, ((_IMP_T)impRef)(obj, selector));
                
            }else if (!strcmp(returnType, @encode(CGAffineTransform)))
            {
                typedef CGAffineTransform (* _IMP_T)(id, SEL);
                lua_pushCGAffineTransform(L, ((_IMP_T)impRef)(obj, selector));
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
static const CFIndex __preAcceleratorCapacity = 1024;

static inline void LuaObjCAcceleratorInitialize(void)
{
    __preAccelerators = CFDictionaryCreateMutable(CFAllocatorGetDefault(), __preAcceleratorCapacity, NULL, NULL);
}

void LuaObjCAcceleratorRegister(Class theClass, SEL selector, LuaObjCAcceleratorIMP imp)
{
    if (!__preAccelerators)
    {
        LuaObjCAcceleratorInitialize();
    }
    
    CFDictionaryAddValue(__preAccelerators, selector, imp);
}

LuaObjCAcceleratorIMP LuaObjCAcceleratorGetIMPBySelector(Class theClass, SEL selector)
{
    return CFDictionaryGetValue(__preAccelerators, selector);
}

