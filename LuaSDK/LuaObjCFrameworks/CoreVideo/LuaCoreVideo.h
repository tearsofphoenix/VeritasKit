//
//  LuaCoreVideo.h
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
#define LUA_CoreVideo_METANAME	"CoreVideo"
LUAMOD_API int (LuaOpenCoreVideo)(lua_State *L);
#include <CoreVideo/CoreVideo.h>
#ifdef __cplusplus
}
#endif
