//
//  LuaAVCompositionTrack.h
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
#define LUA_AVCompositionTrack_METANAME	"AVCompositionTrack"
LUAMOD_API int (LuaOpenAVCompositionTrack)(lua_State *L);
#include <AVFoundation/AVCompositionTrack.h>
#ifdef __cplusplus
}
#endif
