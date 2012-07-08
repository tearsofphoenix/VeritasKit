//
//  LuaAVFoundation.h
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
#define LUA_AVFoundation_METANAME	"AVFoundation"
LUAMOD_API int (LuaOpenAVFoundation)(lua_State *L);
#include <AVFoundation/AVFoundation.h>
#ifdef __cplusplus
}
#endif
