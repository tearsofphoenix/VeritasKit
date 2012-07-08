//
//  LuaCVBuffer.h
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
#define LUA_CVBuffer_METANAME	"CVBuffer"
LUAMOD_API int (LuaOpenCVBuffer)(lua_State *L);
#include <CoreVideo/CVBuffer.h>
#ifdef __cplusplus
}
#endif
