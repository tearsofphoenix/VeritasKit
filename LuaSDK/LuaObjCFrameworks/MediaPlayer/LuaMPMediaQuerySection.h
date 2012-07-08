//
//  LuaMPMediaQuerySection.h
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
#define LUA_MPMediaQuerySection_METANAME	"MPMediaQuerySection"
LUAMOD_API int (LuaOpenMPMediaQuerySection)(lua_State *L);
#include <MediaPlayer/MPMediaQuerySection.h>
#ifdef __cplusplus
}
#endif
