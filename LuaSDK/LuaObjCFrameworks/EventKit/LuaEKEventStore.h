//
//  LuaEKEventStore.h
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
#define LUA_EKEventStore_METANAME	"EKEventStore"
LUAMOD_API int (LuaOpenEKEventStore)(lua_State *L);
#include <EventKit/EKEventStore.h>
#ifdef __cplusplus
}
#endif
