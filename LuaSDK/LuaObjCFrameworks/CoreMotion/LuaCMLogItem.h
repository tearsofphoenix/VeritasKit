//
//  LuaCMLogItem.h
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
#define LUA_CMLogItem_METANAME	"CMLogItem"
LUAMOD_API int (LuaOpenCMLogItem)(lua_State *L);
#include <CoreMotion/CMLogItem.h>
#ifdef __cplusplus
}
#endif
