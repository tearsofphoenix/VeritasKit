//
//  LuaNSMigrationManager.h
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
#define LUA_NSMigrationManager_METANAME	"NSMigrationManager"
LUAMOD_API int (LuaOpenNSMigrationManager)(lua_State *L);
#include <CoreData/NSMigrationManager.h>
#ifdef __cplusplus
}
#endif
