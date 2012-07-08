//
//  LuaEAAccessoryManager.h
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
#define LUA_EAAccessoryManager_METANAME	"EAAccessoryManager"
LUAMOD_API int (LuaOpenEAAccessoryManager)(lua_State *L);
#include <ExternalAccessory/EAAccessoryManager.h>
#ifdef __cplusplus
}
#endif
