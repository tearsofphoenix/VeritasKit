//
//  LuaUIKit.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#include "luaconf.h"

#define LUA_UIKITLIBNAME	"UIKit"

struct lua_State;

LUAMOD_API int (LuaOpenUIKit)(struct lua_State *L);
