//
//  LuaGLKMathUtils.h
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
#include <GLKit/GLKMathUtils.h>
   
    #define LUA_GLKMatrix2_METANAME "GLKMatrix2"
    extern int lua_pushGLKMatrix2(lua_State *L, GLKMatrix2 matrix);
    
    LUAMOD_API int (LuaOpenGLKMathUtils)(lua_State *L);
    
#ifdef __cplusplus
}
#endif
