//
//  LuaAudioFile.h
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
#define LUA_AudioFile_METANAME	"AudioFile"
LUAMOD_API int (LuaOpenAudioFile)(lua_State *L);
#include <AudioToolbox/AudioFile.h>
#ifdef __cplusplus
}
#endif
