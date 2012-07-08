//
//  LuaMKAnnotation.h
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
#define LUA_MKAnnotation_METANAME	"MKAnnotation"
LUAMOD_API int (LuaOpenMKAnnotation)(lua_State *L);
#include <MapKit/MKAnnotation.h>
#ifdef __cplusplus
}
#endif
