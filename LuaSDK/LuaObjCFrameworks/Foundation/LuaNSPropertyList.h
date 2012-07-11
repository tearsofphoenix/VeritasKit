//
//  LuaNSPropertyList.h
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
#define LUA_NSPropertyList_METANAME	"NSPropertyList"
LUAMOD_API int (LuaOpenNSPropertyList)(lua_State *L);
#include <Foundation/NSPropertyList.h>
#ifdef __cplusplus
}
#endif
