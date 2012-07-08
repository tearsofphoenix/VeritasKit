//
//  LuaAVMediaSelectionGroup.h
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
#define LUA_AVMediaSelectionGroup_METANAME	"AVMediaSelectionGroup"
LUAMOD_API int (LuaOpenAVMediaSelectionGroup)(lua_State *L);
#include <AVFoundation/AVMediaSelectionGroup.h>
#ifdef __cplusplus
}
#endif
