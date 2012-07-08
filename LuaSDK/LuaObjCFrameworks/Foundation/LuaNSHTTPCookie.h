//
//  LuaNSHTTPCookie.h
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
#define LUA_NSHTTPCookie_METANAME	"NSHTTPCookie"
LUAMOD_API int (LuaOpenNSHTTPCookie)(lua_State *L);
#include <Foundation/NSHTTPCookie.h>
#ifdef __cplusplus
}
#endif
