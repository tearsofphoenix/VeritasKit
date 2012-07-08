//
//  LuaSCNetworkConfiguration.h
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
#define LUA_SCNetworkConfiguration_METANAME	"SCNetworkConfiguration"
LUAMOD_API int (LuaOpenSCNetworkConfiguration)(lua_State *L);
#include <SystemConfiguration/SCNetworkConfiguration.h>
#ifdef __cplusplus
}
#endif
