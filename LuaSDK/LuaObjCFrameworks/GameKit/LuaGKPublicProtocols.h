//
//  LuaGKPublicProtocols.h
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
#define LUA_GKPublicProtocols_METANAME	"GKPublicProtocols"
LUAMOD_API int (LuaOpenGKPublicProtocols)(lua_State *L);
#include <GameKit/GKPublicProtocols.h>
#ifdef __cplusplus
}
#endif
