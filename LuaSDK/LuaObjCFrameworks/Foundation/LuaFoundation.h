//
//  LuaFoundation.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lua.h"
#define LUA_Foundation_METANAME	"Foundation"
LUAMOD_API int (LuaOpenFoundation)(lua_State *L);
#include <Foundation/Foundation.h>
#ifdef __cplusplus
}
#endif
