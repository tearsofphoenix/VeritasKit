//
//  LuaNSFileVersion.h
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
#define LUA_NSFileVersion_METANAME	"NSFileVersion"
LUAMOD_API int (LuaOpenNSFileVersion)(lua_State *L);
#include <Foundation/NSFileVersion.h>
#ifdef __cplusplus
}
#endif
