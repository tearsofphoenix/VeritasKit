//
//  LuaMPMusicPlayerController.h
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
#define LUA_MPMusicPlayerController_METANAME	"MPMusicPlayerController"
LUAMOD_API int (LuaOpenMPMusicPlayerController)(lua_State *L);
#include <MediaPlayer/MPMusicPlayerController.h>
#ifdef __cplusplus
}
#endif
