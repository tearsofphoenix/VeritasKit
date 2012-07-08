//
//  LuaMusicPlayer.h
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
#define LUA_MusicPlayer_METANAME	"MusicPlayer"
LUAMOD_API int (LuaOpenMusicPlayer)(lua_State *L);
#include <AudioToolbox/MusicPlayer.h>
#ifdef __cplusplus
}
#endif
