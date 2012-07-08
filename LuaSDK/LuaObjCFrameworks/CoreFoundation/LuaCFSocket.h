//
//  LuaCFSocket.h
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
#define LUA_CFSocket_METANAME	"CFSocket"
LUAMOD_API int (LuaOpenCFSocket)(lua_State *L);
#include <CoreFoundation/CFSocket.h>
#ifdef __cplusplus
}
#endif
