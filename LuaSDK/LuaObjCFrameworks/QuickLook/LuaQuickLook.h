//
//  LuaQuickLook.h
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
#define LUA_QuickLook_METANAME	"QuickLook"
LUAMOD_API int (LuaOpenQuickLook)(lua_State *L);
#include <QuickLook/QuickLook.h>
#ifdef __cplusplus
}
#endif
