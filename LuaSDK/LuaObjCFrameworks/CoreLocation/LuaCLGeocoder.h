//
//  LuaCLGeocoder.h
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
#define LUA_CLGeocoder_METANAME	"CLGeocoder"
LUAMOD_API int (LuaOpenCLGeocoder)(lua_State *L);
#include <CoreLocation/CLGeocoder.h>
#ifdef __cplusplus
}
#endif
