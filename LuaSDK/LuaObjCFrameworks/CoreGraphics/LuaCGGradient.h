//
//  LuaCGGradient.h
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
#define LUA_CGGradient_METANAME	"CGGradient"
LUAMOD_API int (LuaOpenCGGradient)(lua_State *L);
#include <CoreGraphics/CGGradient.h>
#ifdef __cplusplus
}
#endif
