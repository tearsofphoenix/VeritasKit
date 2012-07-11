//
//  LuaGLKMatrixStack.h
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
#define LUA_GLKMatrixStack_METANAME	"GLKMatrixStack"
LUAMOD_API int (LuaOpenGLKMatrixStack)(lua_State *L);
#include <GLKit/GLKMatrixStack.h>
#ifdef __cplusplus
}
#endif
