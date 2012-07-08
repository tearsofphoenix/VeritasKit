//
//  LuaCTTypesetter.h
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
#define LUA_CTTypesetter_METANAME	"CTTypesetter"
LUAMOD_API int (LuaOpenCTTypesetter)(lua_State *L);
#include <CoreText/CTTypesetter.h>
#ifdef __cplusplus
}
#endif
