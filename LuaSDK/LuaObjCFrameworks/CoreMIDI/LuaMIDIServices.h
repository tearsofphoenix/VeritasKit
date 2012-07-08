//
//  LuaMIDIServices.h
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
#define LUA_MIDIServices_METANAME	"MIDIServices"
LUAMOD_API int (LuaOpenMIDIServices)(lua_State *L);
#include <CoreMIDI/MIDIServices.h>
#ifdef __cplusplus
}
#endif
