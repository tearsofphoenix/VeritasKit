//
//  LuaUIButton.h
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
#define LUA_UIButton_METANAME	"UIButton"
LUAMOD_API int (LuaOpenUIButton)(lua_State *L);
#include <UIKit/UIButton.h>
#ifdef __cplusplus
}
#endif
