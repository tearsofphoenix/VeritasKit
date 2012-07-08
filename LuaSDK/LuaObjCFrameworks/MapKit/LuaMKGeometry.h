//
//  LuaMKGeometry.h
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
#define LUA_MKGeometry_METANAME	"MKGeometry"
LUAMOD_API int (LuaOpenMKGeometry)(lua_State *L);
#include <MapKit/MKGeometry.h>
#ifdef __cplusplus
}
#endif
