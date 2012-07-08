//
//  LuaCFCalendar.h
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
#define LUA_CFCalendar_METANAME	"CFCalendar"
LUAMOD_API int (LuaOpenCFCalendar)(lua_State *L);
#include <CoreFoundation/CFCalendar.h>
#ifdef __cplusplus
}
#endif
