//
//  LuaNSAtomicStoreCacheNode.h
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
#define LUA_NSAtomicStoreCacheNode_METANAME	"NSAtomicStoreCacheNode"
LUAMOD_API int (LuaOpenNSAtomicStoreCacheNode)(lua_State *L);
#include <CoreData/NSAtomicStoreCacheNode.h>
#ifdef __cplusplus
}
#endif
