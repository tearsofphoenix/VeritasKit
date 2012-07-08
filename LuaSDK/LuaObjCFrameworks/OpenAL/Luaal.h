//
//  Luaal.h
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
#define LUA_al_METANAME	"al"
LUAMOD_API int (LuaOpenal)(lua_State *L);
#include <OpenAL/al.h>
#ifdef __cplusplus
}
#endif
