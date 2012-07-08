//
//  LuaCTDefines.h
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
#define LUA_CTDefines_METANAME	"CTDefines"
LUAMOD_API int (LuaOpenCTDefines)(lua_State *L);
#include <CoreText/CTDefines.h>
#ifdef __cplusplus
}
#endif
