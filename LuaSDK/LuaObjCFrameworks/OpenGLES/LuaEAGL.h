//
//  LuaEAGL.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lua.h"
#define LUA_EAGL_METANAME	"EAGL"
LUAMOD_API int (LuaOpenEAGL)(lua_State *L);
#include <OpenGLES/EAGL.h>
#ifdef __cplusplus
}
#endif
