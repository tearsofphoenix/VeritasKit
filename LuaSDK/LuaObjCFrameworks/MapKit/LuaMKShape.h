//
//  LuaMKShape.h
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
#define LUA_MKShape_METANAME	"MKShape"
LUAMOD_API int (LuaOpenMKShape)(lua_State *L);
#include <MapKit/MKShape.h>
#ifdef __cplusplus
}
#endif
