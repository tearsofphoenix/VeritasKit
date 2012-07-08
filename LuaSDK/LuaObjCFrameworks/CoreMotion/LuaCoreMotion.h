//
//  LuaCoreMotion.h
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
#define LUA_CoreMotion_METANAME	"CoreMotion"
LUAMOD_API int (LuaOpenCoreMotion)(lua_State *L);
#include <CoreMotion/CoreMotion.h>
#ifdef __cplusplus
}
#endif
