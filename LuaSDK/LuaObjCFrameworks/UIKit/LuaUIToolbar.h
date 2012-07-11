//
//  LuaUIToolbar.h
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
#define LUA_UIToolbar_METANAME	"UIToolbar"
LUAMOD_API int (LuaOpenUIToolbar)(lua_State *L);
#include <UIKit/UIToolbar.h>
#ifdef __cplusplus
}
#endif
