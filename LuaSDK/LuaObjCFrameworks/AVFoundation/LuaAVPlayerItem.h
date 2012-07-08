//
//  LuaAVPlayerItem.h
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
#define LUA_AVPlayerItem_METANAME	"AVPlayerItem"
LUAMOD_API int (LuaOpenAVPlayerItem)(lua_State *L);
#include <AVFoundation/AVPlayerItem.h>
#ifdef __cplusplus
}
#endif
