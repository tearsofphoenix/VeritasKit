//
//  LuaAccountsDefines.h
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
#define LUA_AccountsDefines_METANAME	"AccountsDefines"
LUAMOD_API int (LuaOpenAccountsDefines)(lua_State *L);
#include <Accounts/AccountsDefines.h>
#ifdef __cplusplus
}
#endif
