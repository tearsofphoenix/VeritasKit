//
//  LuaNSEntityMigrationPolicy.h
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
#define LUA_NSEntityMigrationPolicy_METANAME	"NSEntityMigrationPolicy"
LUAMOD_API int (LuaOpenNSEntityMigrationPolicy)(lua_State *L);
#include <CoreData/NSEntityMigrationPolicy.h>
#ifdef __cplusplus
}
#endif
