//
//  LuaCGFunction.h
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
#define LUA_CGFunction_METANAME	"CGFunction"
LUAMOD_API int (LuaOpenCGFunction)(lua_State *L);
#include <CoreGraphics/CGFunction.h>
#ifdef __cplusplus
}
#endif
