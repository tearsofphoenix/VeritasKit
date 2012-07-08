//
//  LuaCMError.h
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
#define LUA_CMError_METANAME	"CMError"
LUAMOD_API int (LuaOpenCMError)(lua_State *L);
#include <CoreMotion/CMError.h>
#ifdef __cplusplus
}
#endif
