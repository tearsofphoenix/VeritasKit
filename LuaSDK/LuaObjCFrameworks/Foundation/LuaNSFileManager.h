//
//  LuaNSFileManager.h
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
#define LUA_NSFileManager_METANAME	"NSFileManager"
LUAMOD_API int (LuaOpenNSFileManager)(lua_State *L);
#include <Foundation/NSFileManager.h>
#ifdef __cplusplus
}
#endif
