//
//  LuaCoreGraphics.h
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
#define LUA_CoreGraphics_METANAME	"CoreGraphics"
LUAMOD_API int (LuaOpenCoreGraphics)(lua_State *L);
#include <CoreGraphics/CoreGraphics.h>
#ifdef __cplusplus
}
#endif
