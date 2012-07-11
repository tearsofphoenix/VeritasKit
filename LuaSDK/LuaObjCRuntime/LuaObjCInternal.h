//
//  LuaObjCInternal.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef LuaIOS_LuaObjCInternal_h
#define LuaIOS_LuaObjCInternal_h

#define LUA_NSOBJECT_METATABLENAME "NSObject"    

struct lua_State;
struct luaL_Reg;

extern int luaObjC_preloadGlobalFunctions(struct lua_State *L, const struct luaL_Reg *functions, NSUInteger count);

#define luaObjC_loadGlobalFunctions(L, f) luaObjC_preloadGlobalFunctions(L, f, sizeof(f) / sizeof(f[0]))

extern void luaObjC_throwExceptionIfError(struct lua_State *L);

extern void objc_dumpClass(Class theClass);

extern void stackDump (struct lua_State *L);

#define FunctionDebugPrint() printf("In func: %s line: %d\n", __FUNCTION__, __LINE__)

extern const char* _luaObjCInternal_jumpoverEncodingDecorator(const char* charLooper);

#endif
