//
//  LuaCFDate.h
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
#define LUA_CFDate_METANAME	"CFDate"
LUAMOD_API int (LuaOpenCFDate)(lua_State *L);
#include <CoreFoundation/CFDate.h>
#ifdef __cplusplus
}
#endif
