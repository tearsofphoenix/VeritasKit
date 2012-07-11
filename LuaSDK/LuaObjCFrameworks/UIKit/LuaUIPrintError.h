//
//  LuaUIPrintError.h
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
#define LUA_UIPrintError_METANAME	"UIPrintError"
LUAMOD_API int (LuaOpenUIPrintError)(lua_State *L);
#include <UIKit/UIPrintError.h>
#ifdef __cplusplus
}
#endif
