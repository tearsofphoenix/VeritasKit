//
//  LuaUIBezierPath.h
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
#define LUA_UIBezierPath_METANAME	"UIBezierPath"
LUAMOD_API int (LuaOpenUIBezierPath)(lua_State *L);
#include <UIKit/UIBezierPath.h>
#ifdef __cplusplus
}
#endif
