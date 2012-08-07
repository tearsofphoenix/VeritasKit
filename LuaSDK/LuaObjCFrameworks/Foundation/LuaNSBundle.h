//
//  LuaNSBundle.h
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
    
    LUAMOD_API int (LuaOpenNSBundle)(struct lua_State *L);

#ifdef __cplusplus
}
#endif
