//
//  LuaQuartzCore.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
    
#include "luaconf.h"
    
    struct lua_State;
    
    LUAMOD_API int (LuaOpenQuartzCore)(struct lua_State *L);


#ifdef __cplusplus
}
#endif
