//
//  LuaTWRequest.h
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
#define LUA_TWRequest_METANAME	"TWRequest"
LUAMOD_API int (LuaOpenTWRequest)(lua_State *L);
#include <Twitter/TWRequest.h>
#ifdef __cplusplus
}
#endif
