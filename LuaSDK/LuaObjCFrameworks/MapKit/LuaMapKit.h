//
//  LuaMapKit.h
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
#define LUA_MapKit_METANAME	"MapKit"
LUAMOD_API int (LuaOpenMapKit)(lua_State *L);
#include <MapKit/MapKit.h>
#ifdef __cplusplus
}
#endif
