//
//  LuaMusicDevice.h
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
#define LUA_MusicDevice_METANAME	"MusicDevice"
LUAMOD_API int (LuaOpenMusicDevice)(lua_State *L);
#include <AudioUnit/MusicDevice.h>
#ifdef __cplusplus
}
#endif
