//
//  LuaExternalAccessoryDefines.h
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
#define LUA_ExternalAccessoryDefines_METANAME	"ExternalAccessoryDefines"
LUAMOD_API int (LuaOpenExternalAccessoryDefines)(lua_State *L);
#include <ExternalAccessory/ExternalAccessoryDefines.h>
#ifdef __cplusplus
}
#endif
