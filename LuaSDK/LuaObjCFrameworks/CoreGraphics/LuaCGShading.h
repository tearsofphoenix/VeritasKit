//
//  LuaCGShading.h
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
#define LUA_CGShading_METANAME	"CGShading"
LUAMOD_API int (LuaOpenCGShading)(lua_State *L);
#include <CoreGraphics/CGShading.h>
#ifdef __cplusplus
}
#endif
