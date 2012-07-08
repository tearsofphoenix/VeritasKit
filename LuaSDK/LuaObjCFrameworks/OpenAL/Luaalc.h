//
//  Luaalc.h
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
#define LUA_alc_METANAME	"alc"
LUAMOD_API int (LuaOpenalc)(lua_State *L);
#include <OpenAL/alc.h>
#ifdef __cplusplus
}
#endif
