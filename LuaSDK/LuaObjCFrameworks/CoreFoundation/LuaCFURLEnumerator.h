//
//  LuaCFURLEnumerator.h
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
#define LUA_CFURLEnumerator_METANAME	"CFURLEnumerator"
LUAMOD_API int (LuaOpenCFURLEnumerator)(lua_State *L);
#include <CoreFoundation/CFURLEnumerator.h>
#ifdef __cplusplus
}
#endif
