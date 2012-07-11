//
//  LuaCGLayer.h
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
#define LUA_CGLayer_METANAME	"CGLayer"
LUAMOD_API int (LuaOpenCGLayer)(lua_State *L);
#include <CoreGraphics/CGLayer.h>
#ifdef __cplusplus
}
#endif
