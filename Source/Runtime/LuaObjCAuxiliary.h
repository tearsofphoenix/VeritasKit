//
//  LuaObjCAuxiliary.h
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "LuaObjCBase.h"

extern const char * LUA_NSOBJECT_METATABLENAME;

extern const char * LUA_CLASS_METATABLENAME;

__BEGIN_DECLS

VK_EXPORT id LuaObjCCheckObject(struct lua_State *L, int index);

VK_EXPORT int LuaObjCPushObject(struct lua_State *L, id obj, bool shouldStoreInPool, bool isClass);

VK_EXPORT const char* LuaObjCCheckString(struct lua_State *L, int index);

VK_EXPORT NSInteger LuaObjCCheckInteger(struct lua_State *L, int index);

#define LuaObjCPushSelector(L, selector) lua_pushstring((L), (const char*)(selector))


VK_EXPORT void LuaObjCLoadGlobalFunctionsWithLength(struct lua_State *L, const struct luaL_Reg *functions, NSUInteger count);

VK_EXPORT void LuaObjCLoadGlobalFunctions(struct lua_State *L, const struct luaL_Reg *functions);

VK_EXPORT void LuaObjCLoadCreateMetatable(struct lua_State *L, const char *name, const struct luaL_Reg *methods);

__END_DECLS