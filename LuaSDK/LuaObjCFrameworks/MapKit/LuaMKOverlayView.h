//
//  LuaMKOverlayView.h
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
#define LUA_MKOverlayView_METANAME	"MKOverlayView"
LUAMOD_API int (LuaOpenMKOverlayView)(lua_State *L);
#include <MapKit/MKOverlayView.h>
#ifdef __cplusplus
}
#endif
