//
//  LuaGLKQuaternion.h
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
#include <GLKit/GLKQuaternion.h>

    #define LUA_GLKQuaternion_METANAME	"GLKQuaternion"

    int lua_pushGLKQuaternion(lua_State *L, GLKQuaternion quaternion);

    LUAMOD_API int (LuaOpenGLKQuaternion)(lua_State *L);
    
#ifdef __cplusplus
}
#endif
