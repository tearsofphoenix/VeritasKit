//
//  LuaAudioConverter.h
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
#define LUA_AudioConverter_METANAME	"AudioConverter"
LUAMOD_API int (LuaOpenAudioConverter)(lua_State *L);
#include <AudioToolbox/AudioConverter.h>
#ifdef __cplusplus
}
#endif
