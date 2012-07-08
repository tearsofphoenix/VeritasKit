//
//  LuaMKFoundation.h
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
#define LUA_MKFoundation_METANAME	"MKFoundation"
LUAMOD_API int (LuaOpenMKFoundation)(lua_State *L);
#include <MapKit/MKFoundation.h>
#ifdef __cplusplus
}
#endif
