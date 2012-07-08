//
//  LuaCFRunLoop.h
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
#define LUA_CFRunLoop_METANAME	"CFRunLoop"
LUAMOD_API int (LuaOpenCFRunLoop)(lua_State *L);
#include <CoreFoundation/CFRunLoop.h>
#ifdef __cplusplus
}
#endif
