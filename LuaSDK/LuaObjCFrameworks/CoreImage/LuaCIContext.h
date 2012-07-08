//
//  LuaCIContext.h
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
#define LUA_CIContext_METANAME	"CIContext"
LUAMOD_API int (LuaOpenCIContext)(lua_State *L);
#include <CoreImage/CIContext.h>
#ifdef __cplusplus
}
#endif
