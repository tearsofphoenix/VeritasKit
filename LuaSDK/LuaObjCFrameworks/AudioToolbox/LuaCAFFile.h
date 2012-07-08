//
//  LuaCAFFile.h
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
#define LUA_CAFFile_METANAME	"CAFFile"
LUAMOD_API int (LuaOpenCAFFile)(lua_State *L);
#include <AudioToolbox/CAFFile.h>
#ifdef __cplusplus
}
#endif
