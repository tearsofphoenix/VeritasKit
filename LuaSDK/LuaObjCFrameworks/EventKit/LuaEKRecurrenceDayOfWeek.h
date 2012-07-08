//
//  LuaEKRecurrenceDayOfWeek.h
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
#define LUA_EKRecurrenceDayOfWeek_METANAME	"EKRecurrenceDayOfWeek"
LUAMOD_API int (LuaOpenEKRecurrenceDayOfWeek)(lua_State *L);
#include <EventKit/EKRecurrenceDayOfWeek.h>
#ifdef __cplusplus
}
#endif
