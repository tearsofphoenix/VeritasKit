//
//  LuaCLLocationManagerDelegate.h
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
#define LUA_CLLocationManagerDelegate_METANAME	"CLLocationManagerDelegate"
LUAMOD_API int (LuaOpenCLLocationManagerDelegate)(lua_State *L);
#include <CoreLocation/CLLocationManagerDelegate.h>
#ifdef __cplusplus
}
#endif
