//
//  LuaGLKEffectPropertyTexture.h
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
#define LUA_GLKEffectPropertyTexture_METANAME	"GLKEffectPropertyTexture"
LUAMOD_API int (LuaOpenGLKEffectPropertyTexture)(lua_State *L);
#include <GLKit/GLKEffectPropertyTexture.h>
#ifdef __cplusplus
}
#endif
