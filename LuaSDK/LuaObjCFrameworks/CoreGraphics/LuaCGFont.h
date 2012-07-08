//
//  LuaCGFont.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lstate.h"
#define LUA_CGFont_METANAME	"CGFont"
LUAMOD_API int (LuaOpenCGFont)(lua_State *L);
#include <CoreGraphics/CGFont.h>
#ifdef __cplusplus
}
#endif
