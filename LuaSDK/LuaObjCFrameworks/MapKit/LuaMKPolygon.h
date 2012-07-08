//
//  LuaMKPolygon.h
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
#define LUA_MKPolygon_METANAME	"MKPolygon"
LUAMOD_API int (LuaOpenMKPolygon)(lua_State *L);
#include <MapKit/MKPolygon.h>
#ifdef __cplusplus
}
#endif
