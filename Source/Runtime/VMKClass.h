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

#pragma mark - type encoding

VMK_EXPORT const char * VMKTypeEncodingOfType(const char *typeName);

VMK_EXPORT void VMKAddEncodingForPredeclearClass(const char *className);

//register class
//
VMK_EXPORT Class LuaInternalGetClass(const char *className);

VMK_EXPORT void LuaInternalAllocateClass(struct lua_State *L, Class theClass, const char *className);

VMK_EXPORT struct lua_State *LuaInternalGetLuaStateOfClass(Class theClass);

/*
 *   internal api of IMP imeplementation, you should never use them directly.
 */

VMK_EXPORT int LuaIMPAddInstanceMethod(struct lua_State *L);

VMK_EXPORT int LuaIMPAddClassMethod(struct lua_State *L);

LUAMOD_API int VMKClassInitialize(struct lua_State *L);

VMK_EXTERN__C_END

#endif
