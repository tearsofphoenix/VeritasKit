//
//  LuaAVSynchronizedLayer.h
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
#define LUA_AVSynchronizedLayer_METANAME	"AVSynchronizedLayer"
LUAMOD_API int (LuaOpenAVSynchronizedLayer)(lua_State *L);
#include <AVFoundation/AVSynchronizedLayer.h>
#ifdef __cplusplus
}
#endif
