//
//  LuaAVTimedMetadataGroup.h
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
#define LUA_AVTimedMetadataGroup_METANAME	"AVTimedMetadataGroup"
LUAMOD_API int (LuaOpenAVTimedMetadataGroup)(lua_State *L);
#include <AVFoundation/AVTimedMetadataGroup.h>
#ifdef __cplusplus
}
#endif
