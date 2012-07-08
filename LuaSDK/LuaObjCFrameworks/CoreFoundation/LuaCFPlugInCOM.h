//
//  LuaCFPlugInCOM.h
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
#define LUA_CFPlugInCOM_METANAME	"CFPlugInCOM"
LUAMOD_API int (LuaOpenCFPlugInCOM)(lua_State *L);
#include <CoreFoundation/CFPlugInCOM.h>
#ifdef __cplusplus
}
#endif
