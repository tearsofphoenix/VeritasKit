//
//  LuaAVUtilities.h
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
#define LUA_AVUtilities_METANAME	"AVUtilities"
LUAMOD_API int (LuaOpenAVUtilities)(lua_State *L);
#include <AVFoundation/AVUtilities.h>
#ifdef __cplusplus
}
#endif
