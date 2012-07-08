//
//  LuaNSIncrementalStoreNode.h
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
#define LUA_NSIncrementalStoreNode_METANAME	"NSIncrementalStoreNode"
LUAMOD_API int (LuaOpenNSIncrementalStoreNode)(lua_State *L);
#include <CoreData/NSIncrementalStoreNode.h>
#ifdef __cplusplus
}
#endif
