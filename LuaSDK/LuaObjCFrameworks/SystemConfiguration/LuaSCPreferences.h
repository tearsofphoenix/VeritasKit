//
//  LuaSCPreferences.h
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
#define LUA_SCPreferences_METANAME	"SCPreferences"
LUAMOD_API int (LuaOpenSCPreferences)(lua_State *L);
#include <SystemConfiguration/SCPreferences.h>
#ifdef __cplusplus
}
#endif
