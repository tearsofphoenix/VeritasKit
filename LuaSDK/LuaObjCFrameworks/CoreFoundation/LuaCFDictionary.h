//
//  LuaCFDictionary.h
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
#define LUA_CFDictionary_METANAME	"CFDictionary"
LUAMOD_API int (LuaOpenCFDictionary)(lua_State *L);
#include <CoreFoundation/CFDictionary.h>
#ifdef __cplusplus
}
#endif
