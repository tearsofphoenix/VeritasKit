//
//  LuaCFBase.h
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
#define LUA_CFBase_METANAME	"CFBase"
LUAMOD_API int (LuaOpenCFBase)(lua_State *L);
#include <CoreFoundation/CFBase.h>
#ifdef __cplusplus
}
#endif
