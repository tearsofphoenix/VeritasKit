//
//  LuaMKMultiPoint.h
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
#define LUA_MKMultiPoint_METANAME	"MKMultiPoint"
LUAMOD_API int (LuaOpenMKMultiPoint)(lua_State *L);
#include <MapKit/MKMultiPoint.h>
#ifdef __cplusplus
}
#endif
