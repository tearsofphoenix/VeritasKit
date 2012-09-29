//
//  LuaObjCRuntime.h
//  LuaIOS
//
//  Created by tearsofphoenix on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "LuaObjCBase.h"

__BEGIN_DECLS

#define LUA_NSLIBNAME       "NS"    

LUAMOD_API int luaopen_foundation(struct lua_State *L);

__END_DECLS
