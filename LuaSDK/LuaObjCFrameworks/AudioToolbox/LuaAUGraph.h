//
//  LuaAUGraph.h
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
#define LUA_AUGraph_METANAME	"AUGraph"
LUAMOD_API int (LuaOpenAUGraph)(lua_State *L);
#include <AudioToolbox/AUGraph.h>
#ifdef __cplusplus
}
#endif
