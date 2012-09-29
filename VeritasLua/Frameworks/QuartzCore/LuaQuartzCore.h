//
//  LuaQuartzCore.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;


#include "luaconf.h"
#include "LuaObjCBase.h"

__BEGIN_DECLS

    struct lua_State;
    
    LUAMOD_API int (LuaOpenQuartzCore)(struct lua_State *L);

__END_DECLS
