//
//  LuaSCNetworkConnection.h
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
#define LUA_SCNetworkConnection_METANAME	"SCNetworkConnection"
LUAMOD_API int (LuaOpenSCNetworkConnection)(lua_State *L);
#include <SystemConfiguration/SCNetworkConnection.h>
#ifdef __cplusplus
}
#endif
