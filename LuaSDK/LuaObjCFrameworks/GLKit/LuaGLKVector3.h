//
//  LuaGLKVector3.h
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
#include <GLKit/GLKVector3.h>

    #define LUA_GLKVector3_METANAME	"GLKVector3"
        
    extern int lua_pushGLKVector3(lua_State *L, GLKVector3 vector);
    
    LUAMOD_API int (LuaOpenGLKVector3)(lua_State *L);
    
#ifdef __cplusplus
}
#endif
