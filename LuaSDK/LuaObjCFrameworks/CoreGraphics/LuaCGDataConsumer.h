//
//  LuaCGDataConsumer.h
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
#define LUA_CGDataConsumer_METANAME	"CGDataConsumer"
LUAMOD_API int (LuaOpenCGDataConsumer)(lua_State *L);
#include <CoreGraphics/CGDataConsumer.h>
#ifdef __cplusplus
}
#endif
