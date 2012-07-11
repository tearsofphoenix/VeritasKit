//
//  LuaGLKVector4.h
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
#include <GLKit/GLKVector4.h>

    #define LUA_GLKVector4_METANAME	"GLKVector4"
    extern int lua_pushGLKVector4(lua_State *L, GLKVector4 vector);
    LUAMOD_API int (LuaOpenGLKVector4)(lua_State *L);
    
#ifdef __cplusplus
}
#endif
