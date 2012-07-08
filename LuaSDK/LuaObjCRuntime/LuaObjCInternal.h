//
//  LuaObjCInternal.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef LuaIOS_LuaObjCInternal_h
#define LuaIOS_LuaObjCInternal_h

#import "lauxlib.h"

#define LUA_NSOBJECT_METATABLENAME "NSObject"    

extern int luaObjC_preloadGlobalFunctions(lua_State *L, const luaL_Reg functions[], NSUInteger count);

#define luaObjC_loadGlobalFunctions(L, f) luaObjC_preloadGlobalFunctions(L, f, sizeof(f) / sizeof(f[0]))

extern void luaObjC_throwExceptionIfError(lua_State *L);

extern void objc_dumpClass(Class theClass);

extern void stackDump (lua_State *L);
#define FunctionDebugPrint() printf("In func: %s\n", __FUNCTION__)
#endif
