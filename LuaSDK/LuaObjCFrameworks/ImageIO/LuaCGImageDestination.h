//
//  LuaCGImageDestination.h
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
#define LUA_CGImageDestination_METANAME	"CGImageDestination"
LUAMOD_API int (LuaOpenCGImageDestination)(lua_State *L);
#include <ImageIO/CGImageDestination.h>
#ifdef __cplusplus
}
#endif
