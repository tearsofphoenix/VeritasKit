//
//  LuaGLKVector2.h
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
#include <GLKit/GLKVector2.h>

    #define LUA_GLKVector2_METANAME	"GLKVector2"
    
    int lua_pushGLKVector2(lua_State *L, GLKVector2 vector);
    
    LUAMOD_API int (LuaOpenGLKVector2)(lua_State *L);
#ifdef __cplusplus
}
#endif
