//
//  LuaAccelerate.h
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
#define LUA_Accelerate_METANAME	"Accelerate"
LUAMOD_API int (LuaOpenAccelerate)(lua_State *L);
#include <Accelerate/Accelerate.h>
#ifdef __cplusplus
}
#endif
