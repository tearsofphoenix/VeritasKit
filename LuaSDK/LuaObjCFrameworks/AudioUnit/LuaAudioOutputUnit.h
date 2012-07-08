//
//  LuaAudioOutputUnit.h
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
#define LUA_AudioOutputUnit_METANAME	"AudioOutputUnit"
LUAMOD_API int (LuaOpenAudioOutputUnit)(lua_State *L);
#include <AudioUnit/AudioOutputUnit.h>
#ifdef __cplusplus
}
#endif
