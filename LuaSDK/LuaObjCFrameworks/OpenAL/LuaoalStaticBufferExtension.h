//
//  LuaoalStaticBufferExtension.h
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
#define LUA_oalStaticBufferExtension_METANAME	"oalStaticBufferExtension"
LUAMOD_API int (LuaOpenoalStaticBufferExtension)(lua_State *L);
#include <OpenAL/oalStaticBufferExtension.h>
#ifdef __cplusplus
}
#endif
