//
//  LuaEKCalendar.h
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
#define LUA_EKCalendar_METANAME	"EKCalendar"
LUAMOD_API int (LuaOpenEKCalendar)(lua_State *L);
#include <EventKit/EKCalendar.h>
#ifdef __cplusplus
}
#endif
