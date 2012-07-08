//
//  LuaCVPixelBufferPool.h
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
#define LUA_CVPixelBufferPool_METANAME	"CVPixelBufferPool"
LUAMOD_API int (LuaOpenCVPixelBufferPool)(lua_State *L);
#include <CoreVideo/CVPixelBufferPool.h>
#ifdef __cplusplus
}
#endif
