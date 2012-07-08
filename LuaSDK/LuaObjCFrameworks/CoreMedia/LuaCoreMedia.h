//
//  LuaCoreMedia.h
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
#define LUA_CoreMedia_METANAME	"CoreMedia"
LUAMOD_API int (LuaOpenCoreMedia)(lua_State *L);
#include <CoreMedia/CoreMedia.h>
#ifdef __cplusplus
}
#endif
