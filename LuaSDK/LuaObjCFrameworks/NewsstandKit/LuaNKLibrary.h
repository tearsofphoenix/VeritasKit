//
//  LuaNKLibrary.h
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
#define LUA_NKLibrary_METANAME	"NKLibrary"
LUAMOD_API int (LuaOpenNKLibrary)(lua_State *L);
#include <NewsstandKit/NKLibrary.h>
#ifdef __cplusplus
}
#endif
