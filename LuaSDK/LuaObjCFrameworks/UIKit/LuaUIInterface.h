//
//  LuaUIInterface.h
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
#define LUA_UIInterface_METANAME	"UIInterface"
LUAMOD_API int (LuaOpenUIInterface)(lua_State *L);
#include <UIKit/UIInterface.h>
#ifdef __cplusplus
}
#endif
