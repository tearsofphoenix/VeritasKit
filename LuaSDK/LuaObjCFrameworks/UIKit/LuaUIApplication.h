//
//  LuaUIApplication.h
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
#include <UIKit/UIApplication.h>

#define LUA_UIApplication_METANAME	"UIApplication"
LUAMOD_API int (LuaOpenUIApplication)(lua_State *L);
#ifdef __cplusplus
}
#endif
