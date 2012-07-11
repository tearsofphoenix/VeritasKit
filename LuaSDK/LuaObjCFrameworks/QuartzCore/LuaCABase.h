//
//  LuaCABase.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lua.h"
#define LUA_CABase_METANAME	"CABase"
LUAMOD_API int (LuaOpenCABase)(lua_State *L);
#include <QuartzCore/CABase.h>
#ifdef __cplusplus
}
#endif
