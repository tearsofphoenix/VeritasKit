//
//  LuaCGBitmapContext.h
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
#define LUA_CGBitmapContext_METANAME	"CGBitmapContext"
LUAMOD_API int (LuaOpenCGBitmapContext)(lua_State *L);
#include <CoreGraphics/CGBitmapContext.h>
#ifdef __cplusplus
}
#endif
