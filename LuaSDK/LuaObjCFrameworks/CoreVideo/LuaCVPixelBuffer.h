//
//  LuaCVPixelBuffer.h
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
#define LUA_CVPixelBuffer_METANAME	"CVPixelBuffer"
LUAMOD_API int (LuaOpenCVPixelBuffer)(lua_State *L);
#include <CoreVideo/CVPixelBuffer.h>
#ifdef __cplusplus
}
#endif
