//
//  LuaMKMapView.h
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
#define LUA_MKMapView_METANAME	"MKMapView"
LUAMOD_API int (LuaOpenMKMapView)(lua_State *L);
#include <MapKit/MKMapView.h>
#ifdef __cplusplus
}
#endif
