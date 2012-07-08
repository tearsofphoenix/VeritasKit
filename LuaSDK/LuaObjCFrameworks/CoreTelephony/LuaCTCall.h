//
//  LuaCTCall.h
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
#define LUA_CTCall_METANAME	"CTCall"
LUAMOD_API int (LuaOpenCTCall)(lua_State *L);
#include <CoreTelephony/CTCall.h>
#ifdef __cplusplus
}
#endif
