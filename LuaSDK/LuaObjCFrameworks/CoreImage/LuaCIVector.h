//
//  LuaCIVector.h
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
#define LUA_CIVector_METANAME	"CIVector"
LUAMOD_API int (LuaOpenCIVector)(lua_State *L);
#include <CoreImage/CIVector.h>
#ifdef __cplusplus
}
#endif
