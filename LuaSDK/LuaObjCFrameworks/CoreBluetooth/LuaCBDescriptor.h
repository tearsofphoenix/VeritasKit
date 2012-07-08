//
//  LuaCBDescriptor.h
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
#define LUA_CBDescriptor_METANAME	"CBDescriptor"
LUAMOD_API int (LuaOpenCBDescriptor)(lua_State *L);
#include <CoreBluetooth/CBDescriptor.h>
#ifdef __cplusplus
}
#endif
