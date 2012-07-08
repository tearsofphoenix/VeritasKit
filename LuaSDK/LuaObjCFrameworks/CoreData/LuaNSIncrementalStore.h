//
//  LuaNSIncrementalStore.h
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
#define LUA_NSIncrementalStore_METANAME	"NSIncrementalStore"
LUAMOD_API int (LuaOpenNSIncrementalStore)(lua_State *L);
#include <CoreData/NSIncrementalStore.h>
#ifdef __cplusplus
}
#endif
