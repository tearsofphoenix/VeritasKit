//
//  LuaGLKit.h
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
#define LUA_GLKit_METANAME	"GLKit"
LUAMOD_API int (LuaOpenGLKit)(lua_State *L);
#include <GLKit/GLKit.h>
#ifdef __cplusplus
}
#endif
