//
//  LuaNSMergePolicy.h
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
#define LUA_NSMergePolicy_METANAME	"NSMergePolicy"
LUAMOD_API int (LuaOpenNSMergePolicy)(lua_State *L);
#include <CoreData/NSMergePolicy.h>
#ifdef __cplusplus
}
#endif
