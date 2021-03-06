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

#define VMKPushSelector(L, selector) lua_pushstring((L), sel_getName(selector))

VMK_EXPORT const char * kVMKNSObjectMetaTableName;

VMK_EXPORT const char * kVMKClassMetaTableName;

VMK_EXPORT id VMKCheckObject(struct lua_State *L, int index);

VMK_EXPORT int VMKPushClass(struct lua_State *L, id nsObject);

VMK_EXPORT int VMKPushObject(struct lua_State *L, id obj, bool shouldStoreInPool);

VMK_EXPORT const char* VMKCheckString(struct lua_State *L, int index);

VMK_EXPORT CFIndex VMKCheckInteger(struct lua_State *L, int index);



VMK_EXPORT void VMKLoadGlobalFunctionsWithLength(struct lua_State *L, const struct luaL_Reg *functions, CFIndex count);

VMK_EXPORT void VMKLoadGlobalFunctions(struct lua_State *L, const struct luaL_Reg *functions);

VMK_EXPORT void VMKLoadCreateMetatable(struct lua_State *L, const char *name, const struct luaL_Reg *methods);

VMK_EXPORT const char *VMKCopyUTF8StringFromString(CFStringRef str);

VMK_EXTERN__C_END

#endif
