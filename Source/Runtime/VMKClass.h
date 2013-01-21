//
//  LuaClass.h
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#ifndef __VMK_VMKCLASS__
#define __VMK_VMKCLASS__ 1

#include "VMKBase.h"

VMK_EXTERN_C_BEGIN

#include <objc/objc.h>

VMK_EXPORT const char * VMKTypeEncodingOfType(const char *typeName);

VMK_EXPORT void VMKAddEncodingForPredeclearClass(const char *className);

//register class
//

VMK_EXPORT void LuaInternalAllocateClass(struct lua_State *L, id theClass, const char *className);

VMK_EXPORT struct lua_State *LuaInternalGetLuaStateOfClass(id theClass);

VMK_EXPORT id LuaInternalGetClass(const char *className);

/*
 *   internal api of IMP imeplementation, you should never use them directly.
 */

VMK_EXPORT int LuaIMPAddInstanceMethod(struct lua_State *L);

VMK_EXPORT int LuaIMPAddClassMethod(struct lua_State *L);

LUAMOD_API int VMKClassInitialize(struct lua_State *L);


VMK_EXPORT const char * kVMKTypeEncodingBOOL;
VMK_EXPORT const char * kVMKTypeEncodingSEL;

VMK_EXPORT const char * kVMKTypeEncodingchar;
VMK_EXPORT const char * kVMKTypeEncodingint;
VMK_EXPORT const char * kVMKTypeEncodingshort;
VMK_EXPORT const char * kVMKTypeEncodinglong;
VMK_EXPORT const char * kVMKTypeEncodinglonglong;

VMK_EXPORT const char * kVMKTypeEncodinguchar;
VMK_EXPORT const char * kVMKTypeEncodinguint;
VMK_EXPORT const char * kVMKTypeEncodingushort;
VMK_EXPORT const char * kVMKTypeEncodingulong;
VMK_EXPORT const char * kVMKTypeEncodingulonglong;

VMK_EXPORT const char * kVMKTypeEncodingfloat;
VMK_EXPORT const char * kVMKTypeEncodingdouble;
VMK_EXPORT const char * kVMKTypeEncodingvoid;
VMK_EXPORT const char * kVMKTypeEncodingcstring;

VMK_EXPORT const char * kVMKTypeEncodingid;

VMK_EXPORT const char * kVMKTypeEncodingClass;

VMK_EXTERN__C_END

#endif
