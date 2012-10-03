//
//  LuaObjCAuxiliary.h
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "LuaObjCBase.h"

#define LUA_NSOBJECT_METATABLENAME "NSObject"

__BEGIN_DECLS

VK_EXPORT id luaObjC_checkNSObject(struct lua_State *L, int index);

VK_EXPORT const char* luaObjC_checkString(struct lua_State *L, int index);

VK_EXPORT int luaObjC_pushNSObject(struct lua_State *L, id nsObject);

VK_EXPORT NSInteger luaObjC_checkInteger(struct lua_State *L, int index);

#define luaObjC_pushSelector(L, selector) lua_pushstring((L), (const char*)(selector))


VK_EXPORT int LuaObjCLoadGlobalFunctions(struct lua_State *L, const struct luaL_Reg *functions, NSUInteger count);

#define luaObjC_loadGlobalFunctions(L, f) LuaObjCLoadGlobalFunctions(L, f, sizeof(f) / sizeof(f[0]))

VK_EXPORT void LuaObjC_createMetatable(struct lua_State *L, const char *name, const struct luaL_Reg *methods);

__END_DECLS