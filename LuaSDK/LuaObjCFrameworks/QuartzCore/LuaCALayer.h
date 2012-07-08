//
//  LuaCALayer.h
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
#define LUA_CALayer_METANAME	"CALayer"
LUAMOD_API int (LuaOpenCALayer)(lua_State *L);
#include <QuartzCore/CALayer.h>
#ifdef __cplusplus
}
#endif
