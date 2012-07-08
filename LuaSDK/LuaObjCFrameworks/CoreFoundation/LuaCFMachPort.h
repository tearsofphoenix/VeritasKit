//
//  LuaCFMachPort.h
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
#define LUA_CFMachPort_METANAME	"CFMachPort"
LUAMOD_API int (LuaOpenCFMachPort)(lua_State *L);
#include <CoreFoundation/CFMachPort.h>
#ifdef __cplusplus
}
#endif
