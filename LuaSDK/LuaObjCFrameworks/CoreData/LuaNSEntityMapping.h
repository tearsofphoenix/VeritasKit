//
//  LuaNSEntityMapping.h
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
#define LUA_NSEntityMapping_METANAME	"NSEntityMapping"
LUAMOD_API int (LuaOpenNSEntityMapping)(lua_State *L);
#include <CoreData/NSEntityMapping.h>
#ifdef __cplusplus
}
#endif
