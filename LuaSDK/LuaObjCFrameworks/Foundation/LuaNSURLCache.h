//
//  LuaNSURLCache.h
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
#define LUA_NSURLCache_METANAME	"NSURLCache"
LUAMOD_API int (LuaOpenNSURLCache)(lua_State *L);
#include <Foundation/NSURLCache.h>
#ifdef __cplusplus
}
#endif
