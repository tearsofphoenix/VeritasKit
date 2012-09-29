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

#define LUA_NSOBJECT_METATABLENAME "NSObject"    

struct lua_State;
struct luaL_Reg;

extern int LuaObjCInternal_loadGlobalFunctions(struct lua_State *L, const struct luaL_Reg *functions, NSUInteger count);

#define luaObjC_loadGlobalFunctions(L, f) LuaObjCInternal_loadGlobalFunctions(L, f, sizeof(f) / sizeof(f[0]))

extern void luaObjC_throwExceptionIfError(struct lua_State *L);

extern void objc_dumpClass(Class theClass);

extern void stackDump(struct lua_State *L);

#define FunctionDebugPrint() printf("In func: %s line: %d\n", __FUNCTION__, __LINE__)

extern const char* LuaObjCInternal_jumpoverEncodingDecorator(const char* charLooper);

extern void LuaObjCInternal_createMetatable(struct lua_State *L, const char *name, const struct luaL_Reg *methods);

extern NSUInteger LuaObjCInternal_argumentCountOfSelector(SEL selector);

__END_DECLS


#endif
