//
//  LuaMKPolyline.h
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
#define LUA_MKPolyline_METANAME	"MKPolyline"
LUAMOD_API int (LuaOpenMKPolyline)(lua_State *L);
#include <MapKit/MKPolyline.h>
#ifdef __cplusplus
}
#endif
