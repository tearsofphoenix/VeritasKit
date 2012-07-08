//
//  LuaCTRunDelegate.h
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
#define LUA_CTRunDelegate_METANAME	"CTRunDelegate"
LUAMOD_API int (LuaOpenCTRunDelegate)(lua_State *L);
#include <CoreText/CTRunDelegate.h>
#ifdef __cplusplus
}
#endif
