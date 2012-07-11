//
//  LuaGLKTextureLoader.h
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
#define LUA_GLKTextureLoader_METANAME	"GLKTextureLoader"
LUAMOD_API int (LuaOpenGLKTextureLoader)(lua_State *L);
#include <GLKit/GLKTextureLoader.h>
#ifdef __cplusplus
}
#endif
