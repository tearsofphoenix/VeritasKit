//
//  LuaMPMediaQuery.h
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
#define LUA_MPMediaQuery_METANAME	"MPMediaQuery"
LUAMOD_API int (LuaOpenMPMediaQuery)(lua_State *L);
#include <MediaPlayer/MPMediaQuery.h>
#ifdef __cplusplus
}
#endif
