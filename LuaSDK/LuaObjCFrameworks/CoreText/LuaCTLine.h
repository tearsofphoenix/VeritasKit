//
//  LuaCTLine.h
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
#define LUA_CTLine_METANAME	"CTLine"
LUAMOD_API int (LuaOpenCTLine)(lua_State *L);
#include <CoreText/CTLine.h>
#ifdef __cplusplus
}
#endif
