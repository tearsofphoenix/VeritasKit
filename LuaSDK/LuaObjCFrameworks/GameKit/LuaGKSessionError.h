//
//  LuaGKSessionError.h
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
#define LUA_GKSessionError_METANAME	"GKSessionError"
LUAMOD_API int (LuaOpenGKSessionError)(lua_State *L);
#include <GameKit/GKSessionError.h>
#ifdef __cplusplus
}
#endif
