//
//  LuaObjCInternal.h
//  LuaIOS
//
//  Created by tearsofphoenix on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef LuaIOS_LuaObjCInternal_h
#define LuaIOS_LuaObjCInternal_h

#include "LuaObjCBase.h"

__BEGIN_DECLS

VK_EXPORT int LuaObjCInternal_loadGlobalFunctions(struct lua_State *L, const struct luaL_Reg *functions, NSUInteger count);

#define luaObjC_loadGlobalFunctions(L, f) LuaObjCInternal_loadGlobalFunctions(L, f, sizeof(f) / sizeof(f[0]))

VK_EXPORT void luaObjC_throwExceptionIfError(struct lua_State *L);

VK_EXPORT void objc_dumpClass(Class theClass);

VK_EXPORT void stackDump(struct lua_State *L);

VK_EXPORT const char* LuaObjCInternal_jumpoverEncodingDecorator(const char* charLooper);

VK_EXPORT void LuaObjCInternal_createMetatable(struct lua_State *L, const char *name, const struct luaL_Reg *methods);

VK_EXPORT NSUInteger LuaObjCInternal_argumentCountOfSelector(SEL selector);

__END_DECLS


#endif
