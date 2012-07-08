//
//  LuaGameKit.h
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
#define LUA_GameKit_METANAME	"GameKit"
LUAMOD_API int (LuaOpenGameKit)(lua_State *L);
#include <GameKit/GameKit.h>
#ifdef __cplusplus
}
#endif
