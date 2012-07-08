//
//  LuaGKAchievementDescription.h
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
#define LUA_GKAchievementDescription_METANAME	"GKAchievementDescription"
LUAMOD_API int (LuaOpenGKAchievementDescription)(lua_State *L);
#include <GameKit/GKAchievementDescription.h>
#ifdef __cplusplus
}
#endif
