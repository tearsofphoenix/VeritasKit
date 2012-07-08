//
//  LuaCoreMIDI.h
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
#define LUA_CoreMIDI_METANAME	"CoreMIDI"
LUAMOD_API int (LuaOpenCoreMIDI)(lua_State *L);
#include <CoreMIDI/CoreMIDI.h>
#ifdef __cplusplus
}
#endif
