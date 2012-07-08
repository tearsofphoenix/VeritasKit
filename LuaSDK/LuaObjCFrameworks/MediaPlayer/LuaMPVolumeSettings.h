//
//  LuaMPVolumeSettings.h
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
#define LUA_MPVolumeSettings_METANAME	"MPVolumeSettings"
LUAMOD_API int (LuaOpenMPVolumeSettings)(lua_State *L);
#include <MediaPlayer/MPVolumeSettings.h>
#ifdef __cplusplus
}
#endif
