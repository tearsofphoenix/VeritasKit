//
//  LuaUITextField.h
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
#define LUA_UITextField_METANAME	"UITextField"
LUAMOD_API int (LuaOpenUITextField)(lua_State *L);
#include <UIKit/UITextField.h>
#ifdef __cplusplus
}
#endif
