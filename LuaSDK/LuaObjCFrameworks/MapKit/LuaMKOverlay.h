//
//  LuaMKOverlay.h
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
#define LUA_MKOverlay_METANAME	"MKOverlay"
LUAMOD_API int (LuaOpenMKOverlay)(lua_State *L);
#include <MapKit/MKOverlay.h>
#ifdef __cplusplus
}
#endif
