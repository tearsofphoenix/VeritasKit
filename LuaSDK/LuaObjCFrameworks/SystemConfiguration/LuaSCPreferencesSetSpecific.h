//
//  LuaSCPreferencesSetSpecific.h
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
#define LUA_SCPreferencesSetSpecific_METANAME	"SCPreferencesSetSpecific"
LUAMOD_API int (LuaOpenSCPreferencesSetSpecific)(lua_State *L);
#include <SystemConfiguration/SCPreferencesSetSpecific.h>
#ifdef __cplusplus
}
#endif
