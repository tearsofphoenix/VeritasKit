//
//  LuaCFStream.h
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
#define LUA_CFStream_METANAME	"CFStream"
LUAMOD_API int (LuaOpenCFStream)(lua_State *L);
#include <CoreFoundation/CFStream.h>
#ifdef __cplusplus
}
#endif
