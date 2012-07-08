//
//  LuaSecBase.h
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
#define LUA_SecBase_METANAME	"SecBase"
LUAMOD_API int (LuaOpenSecBase)(lua_State *L);
#include <Security/SecBase.h>
#ifdef __cplusplus
}
#endif
