//
//  LuaACError.h
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
#define LUA_ACError_METANAME	"ACError"
LUAMOD_API int (LuaOpenACError)(lua_State *L);
#include <Accounts/ACError.h>
#ifdef __cplusplus
}
#endif
