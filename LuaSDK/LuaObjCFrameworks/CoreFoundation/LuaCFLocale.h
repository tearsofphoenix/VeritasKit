//
//  LuaCFLocale.h
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
#define LUA_CFLocale_METANAME	"CFLocale"
LUAMOD_API int (LuaOpenCFLocale)(lua_State *L);
#include <CoreFoundation/CFLocale.h>
#ifdef __cplusplus
}
#endif
