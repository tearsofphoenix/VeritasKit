//
//  LuaCTTextTab.h
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
#define LUA_CTTextTab_METANAME	"CTTextTab"
LUAMOD_API int (LuaOpenCTTextTab)(lua_State *L);
#include <CoreText/CTTextTab.h>
#ifdef __cplusplus
}
#endif
