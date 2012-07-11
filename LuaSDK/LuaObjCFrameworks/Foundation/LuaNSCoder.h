//
//  LuaNSCoder.h
//  LuaIOS
//
//  Created by tearsofphoenix tearsofphoenix on 6/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifdef __cplusplus
extern "C" 
{
#endif
#include "luaconf.h"
#include "lua.h"
    
    LUAMOD_API int (LuaOpenNSCoder)(lua_State *L);
#ifdef __cplusplus
}
#endif
