//
//  LuaACAccountStore.h
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
#define LUA_ACAccountStore_METANAME	"ACAccountStore"
LUAMOD_API int (LuaOpenACAccountStore)(lua_State *L);
#include <Accounts/ACAccountStore.h>
#ifdef __cplusplus
}
#endif
