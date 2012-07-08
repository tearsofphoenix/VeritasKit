//
//  LuaNSPropertyDescription.h
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
#define LUA_NSPropertyDescription_METANAME	"NSPropertyDescription"
LUAMOD_API int (LuaOpenNSPropertyDescription)(lua_State *L);
#include <CoreData/NSPropertyDescription.h>
#ifdef __cplusplus
}
#endif
