//
//  LuaMKPinAnnotationView.h
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
#define LUA_MKPinAnnotationView_METANAME	"MKPinAnnotationView"
LUAMOD_API int (LuaOpenMKPinAnnotationView)(lua_State *L);
#include <MapKit/MKPinAnnotationView.h>
#ifdef __cplusplus
}
#endif
