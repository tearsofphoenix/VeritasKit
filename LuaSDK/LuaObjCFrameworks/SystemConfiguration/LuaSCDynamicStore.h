//
//  LuaSCDynamicStore.h
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
#define LUA_SCDynamicStore_METANAME	"SCDynamicStore"
LUAMOD_API int (LuaOpenSCDynamicStore)(lua_State *L);
#include <SystemConfiguration/SCDynamicStore.h>
#ifdef __cplusplus
}
#endif
