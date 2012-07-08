//
//  LuaCBPeripheral.h
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
#define LUA_CBPeripheral_METANAME	"CBPeripheral"
LUAMOD_API int (LuaOpenCBPeripheral)(lua_State *L);
#include <CoreBluetooth/CBPeripheral.h>
#ifdef __cplusplus
}
#endif
