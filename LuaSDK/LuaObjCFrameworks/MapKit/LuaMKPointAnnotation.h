//
//  LuaMKPointAnnotation.h
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
#define LUA_MKPointAnnotation_METANAME	"MKPointAnnotation"
LUAMOD_API int (LuaOpenMKPointAnnotation)(lua_State *L);
#include <MapKit/MKPointAnnotation.h>
#ifdef __cplusplus
}
#endif
