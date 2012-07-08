//
//  LuaNSManagedObjectContext.h
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
#define LUA_NSManagedObjectContext_METANAME	"NSManagedObjectContext"
LUAMOD_API int (LuaOpenNSManagedObjectContext)(lua_State *L);
#include <CoreData/NSManagedObjectContext.h>
#ifdef __cplusplus
}
#endif
