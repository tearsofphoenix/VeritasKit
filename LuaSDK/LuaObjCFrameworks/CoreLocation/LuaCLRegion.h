//
//  LuaCLRegion.h
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
#define LUA_CLRegion_METANAME	"CLRegion"
LUAMOD_API int (LuaOpenCLRegion)(lua_State *L);
#include <CoreLocation/CLRegion.h>
#ifdef __cplusplus
}
#endif
