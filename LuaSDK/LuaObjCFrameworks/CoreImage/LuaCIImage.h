//
//  LuaCIImage.h
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
#define LUA_CIImage_METANAME	"CIImage"
LUAMOD_API int (LuaOpenCIImage)(lua_State *L);
#include <CoreImage/CIImage.h>
#ifdef __cplusplus
}
#endif
