//
//  LuaCFTree.h
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
#define LUA_CFTree_METANAME	"CFTree"
LUAMOD_API int (LuaOpenCFTree)(lua_State *L);
#include <CoreFoundation/CFTree.h>
#ifdef __cplusplus
}
#endif
