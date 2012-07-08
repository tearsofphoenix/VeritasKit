//
//  LuaSCSchemaDefinitions.h
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
#define LUA_SCSchemaDefinitions_METANAME	"SCSchemaDefinitions"
LUAMOD_API int (LuaOpenSCSchemaDefinitions)(lua_State *L);
#include <SystemConfiguration/SCSchemaDefinitions.h>
#ifdef __cplusplus
}
#endif
