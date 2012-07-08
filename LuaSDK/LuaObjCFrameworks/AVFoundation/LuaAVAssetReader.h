//
//  LuaAVAssetReader.h
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
#define LUA_AVAssetReader_METANAME	"AVAssetReader"
LUAMOD_API int (LuaOpenAVAssetReader)(lua_State *L);
#include <AVFoundation/AVAssetReader.h>
#ifdef __cplusplus
}
#endif
