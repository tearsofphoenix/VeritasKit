//
//  LuaCGError.h
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
#define LUA_CGError_METANAME	"CGError"
LUAMOD_API int (LuaOpenCGError)(lua_State *L);
#include <CoreGraphics/CGError.h>
#ifdef __cplusplus
}
#endif
