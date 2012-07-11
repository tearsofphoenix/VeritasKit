//
//  LuaGLKMatrix3.h
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
#include <GLKit/GLKMatrix3.h>

    extern  int lua_pushGLKMatrix3(lua_State *L, GLKMatrix3 matrix);
    #define LUA_GLKMatrix3_METANAME	"GLKMatrix3"
    LUAMOD_API int (LuaOpenGLKMatrix3)(lua_State *L);
#ifdef __cplusplus
}
#endif
