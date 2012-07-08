//
//  LuaCaptiveNetwork.h
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
#define LUA_CaptiveNetwork_METANAME	"CaptiveNetwork"
LUAMOD_API int (LuaOpenCaptiveNetwork)(lua_State *L);
#include <SystemConfiguration/CaptiveNetwork.h>
#ifdef __cplusplus
}
#endif
