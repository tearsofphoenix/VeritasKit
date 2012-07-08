//
//  LuaNSError.h
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
#define LUA_NSError_METANAME	"NSError"
LUAMOD_API int (LuaOpenNSError)(lua_State *L);
#include <Foundation/NSError.h>
#ifdef __cplusplus
}
#endif
