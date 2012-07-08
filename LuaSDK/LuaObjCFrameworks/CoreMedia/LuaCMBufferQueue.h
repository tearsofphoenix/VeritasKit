//
//  LuaCMBufferQueue.h
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
#define LUA_CMBufferQueue_METANAME	"CMBufferQueue"
LUAMOD_API int (LuaOpenCMBufferQueue)(lua_State *L);
#include <CoreMedia/CMBufferQueue.h>
#ifdef __cplusplus
}
#endif
