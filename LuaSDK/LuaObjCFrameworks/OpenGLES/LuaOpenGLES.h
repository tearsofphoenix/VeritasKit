//
//  LuaOpenGLES.h
//  LuaIOS
//
//  Created by tearsofphoenix tearsofphoenix on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lstate.h"
    LUAMOD_API int (LuaOpenGLES)(lua_State *L);
    
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES1/gl.h>
#include <OpenGLES/ES1/glext.h>
#ifdef __cplusplus
}
#endif