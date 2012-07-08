//
//  LuaGKScore.h
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
#define LUA_GKScore_METANAME	"GKScore"
LUAMOD_API int (LuaOpenGKScore)(lua_State *L);
#include <GameKit/GKScore.h>
#ifdef __cplusplus
}
#endif
