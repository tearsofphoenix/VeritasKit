//
//  LuaUIGraphics.h
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
#define LUA_UIGraphics_METANAME	"UIGraphics"
LUAMOD_API int (LuaOpenUIGraphics)(lua_State *L);
#include <UIKit/UIGraphics.h>
#ifdef __cplusplus
}
#endif
