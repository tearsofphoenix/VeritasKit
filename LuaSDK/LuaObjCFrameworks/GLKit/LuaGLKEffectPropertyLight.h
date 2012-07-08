//
//  LuaGLKEffectPropertyLight.h
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
#define LUA_GLKEffectPropertyLight_METANAME	"GLKEffectPropertyLight"
LUAMOD_API int (LuaOpenGLKEffectPropertyLight)(lua_State *L);
#include <GLKit/GLKEffectPropertyLight.h>
#ifdef __cplusplus
}
#endif
