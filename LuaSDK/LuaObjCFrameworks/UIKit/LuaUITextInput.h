//
//  LuaUITextInput.h
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
#define LUA_UITextInput_METANAME	"UITextInput"
LUAMOD_API int (LuaOpenUITextInput)(lua_State *L);
#include <UIKit/UITextInput.h>
#ifdef __cplusplus
}
#endif
