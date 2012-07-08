//
//  LuaMKUserTrackingBarButtonItem.h
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
#define LUA_MKUserTrackingBarButtonItem_METANAME	"MKUserTrackingBarButtonItem"
LUAMOD_API int (LuaOpenMKUserTrackingBarButtonItem)(lua_State *L);
#include <MapKit/MKUserTrackingBarButtonItem.h>
#ifdef __cplusplus
}
#endif
