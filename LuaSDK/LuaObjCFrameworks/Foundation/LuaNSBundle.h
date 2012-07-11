//
//  LuaNSBundle.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lua.h"
#define LUA_NSBundle_METANAME	"NSBundle"
LUAMOD_API int (LuaOpenNSBundle)(lua_State *L);
#include <Foundation/NSBundle.h>
#ifdef __cplusplus
}
#endif
