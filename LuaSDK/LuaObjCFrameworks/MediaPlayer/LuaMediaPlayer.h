//
//  LuaMediaPlayer.h
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
#define LUA_MediaPlayer_METANAME	"MediaPlayer"
LUAMOD_API int (LuaOpenMediaPlayer)(lua_State *L);
#include <MediaPlayer/MediaPlayer.h>
#ifdef __cplusplus
}
#endif
