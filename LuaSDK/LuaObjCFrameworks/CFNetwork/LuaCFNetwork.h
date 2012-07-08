//
//  LuaCFNetwork.h
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
#define LUA_CFNetwork_METANAME	"CFNetwork"
LUAMOD_API int (LuaOpenCFNetwork)(lua_State *L);
#include <CFNetwork/CFNetwork.h>
#ifdef __cplusplus
}
#endif
