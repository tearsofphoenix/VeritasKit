//
//  LuaSFNTTypes.h
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
#define LUA_SFNTTypes_METANAME	"SFNTTypes"
LUAMOD_API int (LuaOpenSFNTTypes)(lua_State *L);
#include <CoreText/SFNTTypes.h>
#ifdef __cplusplus
}
#endif
