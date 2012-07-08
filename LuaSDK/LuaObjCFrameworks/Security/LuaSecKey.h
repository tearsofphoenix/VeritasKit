//
//  LuaSecKey.h
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
#define LUA_SecKey_METANAME	"SecKey"
LUAMOD_API int (LuaOpenSecKey)(lua_State *L);
#include <Security/SecKey.h>
#ifdef __cplusplus
}
#endif
