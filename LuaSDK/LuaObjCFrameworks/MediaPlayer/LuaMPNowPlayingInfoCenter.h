//
//  LuaMPNowPlayingInfoCenter.h
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
#define LUA_MPNowPlayingInfoCenter_METANAME	"MPNowPlayingInfoCenter"
LUAMOD_API int (LuaOpenMPNowPlayingInfoCenter)(lua_State *L);
#include <MediaPlayer/MPNowPlayingInfoCenter.h>
#ifdef __cplusplus
}
#endif
