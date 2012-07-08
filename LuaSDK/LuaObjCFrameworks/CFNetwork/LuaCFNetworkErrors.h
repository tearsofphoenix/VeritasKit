//
//  LuaCFNetworkErrors.h
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
#define LUA_CFNetworkErrors_METANAME	"CFNetworkErrors"
LUAMOD_API int (LuaOpenCFNetworkErrors)(lua_State *L);
#include <CFNetwork/CFNetworkErrors.h>
#ifdef __cplusplus
}
#endif
