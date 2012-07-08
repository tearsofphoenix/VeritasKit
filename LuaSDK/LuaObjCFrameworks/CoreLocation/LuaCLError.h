//
//  LuaCLError.h
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
#define LUA_CLError_METANAME	"CLError"
LUAMOD_API int (LuaOpenCLError)(lua_State *L);
#include <CoreLocation/CLError.h>
#ifdef __cplusplus
}
#endif
