//
//  LuaNSFileHandle.h
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
#define LUA_NSFileHandle_METANAME	"NSFileHandle"
LUAMOD_API int (LuaOpenNSFileHandle)(lua_State *L);
#include <Foundation/NSFileHandle.h>
#ifdef __cplusplus
}
#endif
