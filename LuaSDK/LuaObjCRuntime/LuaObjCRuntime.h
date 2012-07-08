//
//  LuaObjCRuntime.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 3/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include "luaconf.h"

#define LUA_NSLIBNAME       "NS"    

struct lua_State;

LUAMOD_API int (luaopen_foundation)(struct lua_State *L);
