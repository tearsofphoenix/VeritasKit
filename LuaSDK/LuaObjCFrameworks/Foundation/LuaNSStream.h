//
//  LuaNSStream.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lua.h"
#define LUA_NSStream_METANAME	"NSStream"
LUAMOD_API int (LuaOpenNSStream)(lua_State *L);
#include <Foundation/NSStream.h>
#ifdef __cplusplus
}
#endif
