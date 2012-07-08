//
//  LuaAVAssetWriter.h
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
#define LUA_AVAssetWriter_METANAME	"AVAssetWriter"
LUAMOD_API int (LuaOpenAVAssetWriter)(lua_State *L);
#include <AVFoundation/AVAssetWriter.h>
#ifdef __cplusplus
}
#endif
