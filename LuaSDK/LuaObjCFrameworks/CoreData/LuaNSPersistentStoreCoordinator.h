//
//  LuaNSPersistentStoreCoordinator.h
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
#define LUA_NSPersistentStoreCoordinator_METANAME	"NSPersistentStoreCoordinator"
LUAMOD_API int (LuaOpenNSPersistentStoreCoordinator)(lua_State *L);
#include <CoreData/NSPersistentStoreCoordinator.h>
#ifdef __cplusplus
}
#endif
