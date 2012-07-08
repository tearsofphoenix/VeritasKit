//
//  LuaGLKEffectPropertyFog.h
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
#define LUA_GLKEffectPropertyFog_METANAME	"GLKEffectPropertyFog"
LUAMOD_API int (LuaOpenGLKEffectPropertyFog)(lua_State *L);
#include <GLKit/GLKEffectPropertyFog.h>
#ifdef __cplusplus
}
#endif
