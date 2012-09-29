//
//  LuaUIKit.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;

#include "luaconf.h"

#include "LuaObjCBase.h"

__BEGIN_DECLS

#define LUA_UIKITLIBNAME	"UIKit"

LUAMOD_API int LuaOpenUIKit(struct lua_State *L);

__END_DECLS
