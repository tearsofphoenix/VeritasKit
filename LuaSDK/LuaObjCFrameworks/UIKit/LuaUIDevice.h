//
//  LuaUIDevice.h
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
#define LUA_UIDevice_METANAME	"UIDevice"
LUAMOD_API int (LuaOpenUIDevice)(lua_State *L);
#include <UIKit/UIDevice.h>
#ifdef __cplusplus
}
#endif
