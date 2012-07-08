//
//  LuaCGAffineTransform.h
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
#define LUA_CGAffineTransform_METANAME	"CGAffineTransform"
    
    extern int lua_pushCGAffineTransform(lua_State *L, CGAffineTransform t);
    
    LUAMOD_API int (LuaOpenCGAffineTransform)(lua_State *L);
#include <CoreGraphics/CGAffineTransform.h>
#ifdef __cplusplus
}
#endif
