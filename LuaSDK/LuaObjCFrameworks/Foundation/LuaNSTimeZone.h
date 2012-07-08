//
//  LuaNSTimeZone.h
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
#define LUA_NSTimeZone_METANAME	"NSTimeZone"
LUAMOD_API int (LuaOpenNSTimeZone)(lua_State *L);
#include <Foundation/NSTimeZone.h>
#ifdef __cplusplus
}
#endif
