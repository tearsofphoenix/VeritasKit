//
//  LuaCFPreferences.h
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
#define LUA_CFPreferences_METANAME	"CFPreferences"
LUAMOD_API int (LuaOpenCFPreferences)(lua_State *L);
#include <CoreFoundation/CFPreferences.h>
#ifdef __cplusplus
}
#endif
