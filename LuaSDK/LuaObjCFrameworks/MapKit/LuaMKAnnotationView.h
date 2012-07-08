//
//  LuaMKAnnotationView.h
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
#define LUA_MKAnnotationView_METANAME	"MKAnnotationView"
LUAMOD_API int (LuaOpenMKAnnotationView)(lua_State *L);
#include <MapKit/MKAnnotationView.h>
#ifdef __cplusplus
}
#endif
