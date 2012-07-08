//
//  LuaNSPersistentStore.h
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
#define LUA_NSPersistentStore_METANAME	"NSPersistentStore"
LUAMOD_API int (LuaOpenNSPersistentStore)(lua_State *L);
#include <CoreData/NSPersistentStore.h>
#ifdef __cplusplus
}
#endif
