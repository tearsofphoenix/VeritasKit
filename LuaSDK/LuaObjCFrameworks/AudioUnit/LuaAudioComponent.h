//
//  LuaAudioComponent.h
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
#define LUA_AudioComponent_METANAME	"AudioComponent"
LUAMOD_API int (LuaOpenAudioComponent)(lua_State *L);
#include <AudioUnit/AudioComponent.h>
#ifdef __cplusplus
}
#endif
