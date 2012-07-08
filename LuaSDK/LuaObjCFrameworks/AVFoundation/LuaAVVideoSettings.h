//
//  LuaAVVideoSettings.h
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
#define LUA_AVVideoSettings_METANAME	"AVVideoSettings"
LUAMOD_API int (LuaOpenAVVideoSettings)(lua_State *L);
#include <AVFoundation/AVVideoSettings.h>
#ifdef __cplusplus
}
#endif
