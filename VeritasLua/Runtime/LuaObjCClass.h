//
//  LuaClass.h
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

#pragma mark - type encoding

VK_EXPORT const char * LuaObjCTypeEncodingOfType(const char *typeName);

VK_EXPORT void LuaObjCAddEncodingForPredeclearClass(const char *className);

//register class
//
VK_EXPORT Class LuaInternalGetClass(const char *className);

VK_EXPORT void LuaInternalAllocateClass(struct lua_State *L, Class theClass, const char *className);

VK_EXPORT struct lua_State *LuaInternalGetLuaStateOfClass(Class theClass);

/*
 *   internal api of IMP imeplementation, you should never use them directly.
 */

VK_EXPORT int LuaIMPAddInstanceMethod(struct lua_State *L);

VK_EXPORT int LuaIMPAddClassMethod(struct lua_State *L);

LUAMOD_API int LuaObjCClassInitialize(struct lua_State *L);

__END_DECLS
