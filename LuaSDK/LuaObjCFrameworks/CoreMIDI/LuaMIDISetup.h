//
//  LuaMIDISetup.h
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
#define LUA_MIDISetup_METANAME	"MIDISetup"
LUAMOD_API int (LuaOpenMIDISetup)(lua_State *L);
#include <CoreMIDI/MIDISetup.h>
#ifdef __cplusplus
}
#endif
