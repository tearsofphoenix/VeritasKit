//
//  LuaMKPolygonView.h
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
#define LUA_MKPolygonView_METANAME	"MKPolygonView"
LUAMOD_API int (LuaOpenMKPolygonView)(lua_State *L);
#include <MapKit/MKPolygonView.h>
#ifdef __cplusplus
}
#endif
