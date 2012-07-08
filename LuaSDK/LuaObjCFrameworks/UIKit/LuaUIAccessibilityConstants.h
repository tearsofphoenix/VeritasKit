//
//  LuaUIAccessibilityConstants.h
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
#define LUA_UIAccessibilityConstants_METANAME	"UIAccessibilityConstants"
LUAMOD_API int (LuaOpenUIAccessibilityConstants)(lua_State *L);
#include <UIKit/UIAccessibilityConstants.h>
#ifdef __cplusplus
}
#endif
