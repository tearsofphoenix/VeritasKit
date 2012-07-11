//
//  LuaNSLocale.h
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
#define LUA_NSLocale_METANAME	"NSLocale"
LUAMOD_API int (LuaOpenNSLocale)(lua_State *L);
#include <Foundation/NSLocale.h>
#ifdef __cplusplus
}
#endif
