//
//  LuaEKError.h
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
#define LUA_EKError_METANAME	"EKError"
LUAMOD_API int (LuaOpenEKError)(lua_State *L);
#include <EventKit/EKError.h>
#ifdef __cplusplus
}
#endif
