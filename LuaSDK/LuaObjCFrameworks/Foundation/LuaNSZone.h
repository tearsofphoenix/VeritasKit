//
//  LuaNSZone.h
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
#define LUA_NSZone_METANAME	"NSZone"
LUAMOD_API int (LuaOpenNSZone)(lua_State *L);
#include <Foundation/NSZone.h>
#ifdef __cplusplus
}
#endif
