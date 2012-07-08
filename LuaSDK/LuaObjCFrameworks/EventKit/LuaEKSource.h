//
//  LuaEKSource.h
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
#define LUA_EKSource_METANAME	"EKSource"
LUAMOD_API int (LuaOpenEKSource)(lua_State *L);
#include <EventKit/EKSource.h>
#ifdef __cplusplus
}
#endif
