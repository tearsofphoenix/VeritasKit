//
//  LuaAVCompositionTrackSegment.h
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
#define LUA_AVCompositionTrackSegment_METANAME	"AVCompositionTrackSegment"
LUAMOD_API int (LuaOpenAVCompositionTrackSegment)(lua_State *L);
#include <AVFoundation/AVCompositionTrackSegment.h>
#ifdef __cplusplus
}
#endif
