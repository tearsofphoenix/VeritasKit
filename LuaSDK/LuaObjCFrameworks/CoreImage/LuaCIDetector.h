//
//  LuaCIDetector.h
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
#define LUA_CIDetector_METANAME	"CIDetector"
LUAMOD_API int (LuaOpenCIDetector)(lua_State *L);
#include <CoreImage/CIDetector.h>
#ifdef __cplusplus
}
#endif
