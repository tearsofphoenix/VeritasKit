//
//  LuaObjCAuxiliary.h
//  LuaIOS
//
//  Created by tearsofphoenix on 6/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "LuaObjCBase.h"

extern const char * LUA_NSOBJECT_METATABLENAME;

__BEGIN_DECLS

VK_EXPORT id luaObjC_checkNSObject(struct lua_State *L, int index);

VK_EXPORT int luaObjC_pushNSObject(struct lua_State *L, id obj);

VK_EXPORT const char* luaObjC_checkString(struct lua_State *L, int index);

VK_EXPORT NSInteger luaObjC_checkInteger(struct lua_State *L, int index);

#define luaObjC_pushSelector(L, selector) lua_pushstring((L), (const char*)(selector))


VK_EXPORT void luaObjC_loadGlobalFunctionsWithLength(struct lua_State *L, const struct luaL_Reg *functions, NSUInteger count);

VK_EXPORT void luaObjC_loadGlobalFunctions(struct lua_State *L, const struct luaL_Reg *functions);

VK_EXPORT void luaObjC_createMetatable(struct lua_State *L, const char *name, const struct luaL_Reg *methods);

__END_DECLS