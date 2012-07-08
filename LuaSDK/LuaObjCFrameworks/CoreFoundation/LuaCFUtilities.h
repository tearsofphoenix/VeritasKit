//
//  LuaCFUtilities.h
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
#define LUA_CFUtilities_METANAME	"CFUtilities"
LUAMOD_API int (LuaOpenCFUtilities)(lua_State *L);
#include <CoreFoundation/CFUtilities.h>
#ifdef __cplusplus
}
#endif
