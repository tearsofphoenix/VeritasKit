//
//  LuaCMBase.h
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
#define LUA_CMBase_METANAME	"CMBase"
LUAMOD_API int (LuaOpenCMBase)(lua_State *L);
#include <CoreMedia/CMBase.h>
#ifdef __cplusplus
}
#endif
