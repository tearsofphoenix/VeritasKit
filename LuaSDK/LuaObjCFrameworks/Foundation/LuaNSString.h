//
//  LuaNSString.h
//  LuaIOS
//
//  Created by tearsofphoenix on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lua.h"
#define LUA_NSString_METANAME	"NSString"
LUAMOD_API int (LuaOpenNSString)(lua_State *L);
#include <Foundation/NSString.h>
#ifdef __cplusplus
}
#endif
