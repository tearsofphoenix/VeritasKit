//
//  VMKAuxiliary.h
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#ifndef __VMK_VMKAUXILIARY__
#define __VMK_VMKAUXILIARY__ 1

#include "VMKBase.h"
#include <objc/objc.h>

VMK_EXTERN_C_BEGIN

VMK_EXPORT const char * kVMKNSObjectMetaTableName;

VMK_EXPORT const char * kVMKClassMetaTableName;

VMK_EXPORT id VMKCheckObject(VMKLuaStateRef state, int index);

VMK_EXPORT int VMKPushObject(VMKLuaStateRef state, id obj, bool shouldStoreInPool, bool isClass);

VMK_EXPORT const char* VMKCheckString(VMKLuaStateRef state, int index);

VMK_EXPORT CFIndex VMKCheckInteger(VMKLuaStateRef state, int index);

#define VMKPushSelector(L, selector) lua_pushstring((L), (const char*)(selector))


VMK_EXPORT void VMKLoadGlobalFunctionsWithLength(VMKLuaStateRef state, const struct luaL_Reg *functions, CFIndex count);

VMK_EXPORT void VMKLoadGlobalFunctions(VMKLuaStateRef state, const struct luaL_Reg *functions);

VMK_EXPORT void VMKLoadCreateMetatable(VMKLuaStateRef state, const char *name, const struct luaL_Reg *methods);

VMK_EXPORT const char *VMKCopyUTF8StringFromString(CFStringRef str);

VMK_EXTERN_C_END

#endif
