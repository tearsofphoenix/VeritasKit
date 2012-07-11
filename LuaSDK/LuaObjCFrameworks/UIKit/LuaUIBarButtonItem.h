//
//  LuaUIBarButtonItem.h
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
#define LUA_UIBarButtonItem_METANAME	"UIBarButtonItem"
LUAMOD_API int (LuaOpenUIBarButtonItem)(lua_State *L);
#include <UIKit/UIBarButtonItem.h>
#ifdef __cplusplus
}
#endif
