//
//  LuaCGImageSource.h
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
#define LUA_CGImageSource_METANAME	"CGImageSource"
LUAMOD_API int (LuaOpenCGImageSource)(lua_State *L);
#include <ImageIO/CGImageSource.h>
#ifdef __cplusplus
}
#endif
