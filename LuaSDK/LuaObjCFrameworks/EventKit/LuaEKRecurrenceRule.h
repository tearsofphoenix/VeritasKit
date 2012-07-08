//
//  LuaEKRecurrenceRule.h
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
#define LUA_EKRecurrenceRule_METANAME	"EKRecurrenceRule"
LUAMOD_API int (LuaOpenEKRecurrenceRule)(lua_State *L);
#include <EventKit/EKRecurrenceRule.h>
#ifdef __cplusplus
}
#endif
