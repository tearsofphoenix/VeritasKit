//
//  LuaCLPlacemark.h
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
#define LUA_CLPlacemark_METANAME	"CLPlacemark"
LUAMOD_API int (LuaOpenCLPlacemark)(lua_State *L);
#include <CoreLocation/CLPlacemark.h>
#ifdef __cplusplus
}
#endif
