//
//  LuaSystemConfiguration.h
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
#define LUA_SystemConfiguration_METANAME	"SystemConfiguration"
LUAMOD_API int (LuaOpenSystemConfiguration)(lua_State *L);
#include <SystemConfiguration/SystemConfiguration.h>
#ifdef __cplusplus
}
#endif
