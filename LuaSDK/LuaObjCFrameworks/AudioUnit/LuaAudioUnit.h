//
//  LuaAudioUnit.h
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
#define LUA_AudioUnit_METANAME	"AudioUnit"
LUAMOD_API int (LuaOpenAudioUnit)(lua_State *L);
#include <AudioUnit/AudioUnit.h>
#ifdef __cplusplus
}
#endif
