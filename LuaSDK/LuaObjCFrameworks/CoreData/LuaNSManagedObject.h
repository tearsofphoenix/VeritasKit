//
//  LuaNSManagedObject.h
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
#define LUA_NSManagedObject_METANAME	"NSManagedObject"
LUAMOD_API int (LuaOpenNSManagedObject)(lua_State *L);
#include <CoreData/NSManagedObject.h>
#ifdef __cplusplus
}
#endif
