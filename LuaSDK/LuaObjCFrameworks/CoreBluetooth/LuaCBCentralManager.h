//
//  LuaCBCentralManager.h
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
#define LUA_CBCentralManager_METANAME	"CBCentralManager"
LUAMOD_API int (LuaOpenCBCentralManager)(lua_State *L);
#include <CoreBluetooth/CBCentralManager.h>
#ifdef __cplusplus
}
#endif
