//
//  LuaMKTypes.h
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
#define LUA_MKTypes_METANAME	"MKTypes"
LUAMOD_API int (LuaOpenMKTypes)(lua_State *L);
#include <MapKit/MKTypes.h>
#ifdef __cplusplus
}
#endif
