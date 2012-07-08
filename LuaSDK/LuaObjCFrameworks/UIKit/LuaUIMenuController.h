//
//  LuaUIMenuController.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lstate.h"
#define LUA_UIMenuController_METANAME	"UIMenuController"
LUAMOD_API int (LuaOpenUIMenuController)(lua_State *L);
#include <UIKit/UIMenuController.h>
#ifdef __cplusplus
}
#endif
