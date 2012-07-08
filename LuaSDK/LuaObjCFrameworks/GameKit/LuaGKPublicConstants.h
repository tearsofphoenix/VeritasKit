//
//  LuaGKPublicConstants.h
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
#define LUA_GKPublicConstants_METANAME	"GKPublicConstants"
LUAMOD_API int (LuaOpenGKPublicConstants)(lua_State *L);
#include <GameKit/GKPublicConstants.h>
#ifdef __cplusplus
}
#endif
