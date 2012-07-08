//
//  LuaEventKitUIDefines.h
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
#define LUA_EventKitUIDefines_METANAME	"EventKitUIDefines"
LUAMOD_API int (LuaOpenEventKitUIDefines)(lua_State *L);
#include <EventKitUI/EventKitUIDefines.h>
#ifdef __cplusplus
}
#endif
