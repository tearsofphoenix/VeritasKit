//
//  LuaCGAffineTransform.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#ifdef __cplusplus
extern "C" {
#endif
    
#include "luaconf.h"

    struct lua_State;
#define LUA_CGAffineTransform_METANAME	"CGAffineTransform"
    
    extern int lua_pushCGAffineTransform(struct lua_State *L, CGAffineTransform t);
    
    LUAMOD_API int (LuaOpenCGAffineTransform)(struct lua_State *L);

#ifdef __cplusplus
}
#endif
