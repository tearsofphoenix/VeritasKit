//
//  LuaACAccountCredential.h
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
#define LUA_ACAccountCredential_METANAME	"ACAccountCredential"
LUAMOD_API int (LuaOpenACAccountCredential)(lua_State *L);
#include <Accounts/ACAccountCredential.h>
#ifdef __cplusplus
}
#endif
