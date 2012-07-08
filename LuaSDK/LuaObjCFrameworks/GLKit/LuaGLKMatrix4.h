//
//  LuaGLKMatrix4.h
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
#include <GLKit/GLKMatrix4.h>
    
    extern int lua_pushGLKMatrix4(lua_State *L, GLKMatrix4 matrix);

    #define LUA_GLKMatrix4_METANAME	"GLKMatrix4"
    
    LUAMOD_API int (LuaOpenGLKMatrix4)(lua_State *L);
#ifdef __cplusplus
}
#endif
