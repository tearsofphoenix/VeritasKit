//
//  LuaObjCInternal.h
//  LuaIOS
//
//  Created by tearsofphoenix on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef LuaIOS_LuaObjCInternal_h
#define LuaIOS_LuaObjCInternal_h

#define LUA_NSOBJECT_METATABLENAME "NSObject"    
#define Lua_Class_MetaTableName "Class"

struct lua_State;
struct luaL_Reg;

extern int luaObjC_preloadGlobalFunctions(struct lua_State *L, const struct luaL_Reg *functions, NSUInteger count);

#define luaObjC_loadGlobalFunctions(L, f) luaObjC_preloadGlobalFunctions(L, f, sizeof(f) / sizeof(f[0]))

extern void luaObjC_throwExceptionIfError(struct lua_State *L);

extern void objc_dumpClass(Class theClass);

extern void stackDump (struct lua_State *L);

#define FunctionDebugPrint() printf("In func: %s line: %d\n", __FUNCTION__, __LINE__)

extern const char* _luaObjCInternal_jumpoverEncodingDecorator(const char* charLooper);

extern size_t _luaObjCInternal_sizeOfStructWithEncoding(const char *encoding);

extern void luaObjCInternal_createmeta(struct lua_State *L, const char *name, const struct luaL_Reg *methods);

extern NSUInteger luaObjCInternal_getArgumentOfSelector(SEL selector);

extern int luaObjC_pack (struct lua_State *L);

extern int luaObjC_unpack (struct lua_State *L);

#endif
