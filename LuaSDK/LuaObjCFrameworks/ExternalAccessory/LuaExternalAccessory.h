//
//  LuaExternalAccessory.h
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
#define LUA_ExternalAccessory_METANAME	"ExternalAccessory"
LUAMOD_API int (LuaOpenExternalAccessory)(lua_State *L);
#include <ExternalAccessory/ExternalAccessory.h>
#ifdef __cplusplus
}
#endif
