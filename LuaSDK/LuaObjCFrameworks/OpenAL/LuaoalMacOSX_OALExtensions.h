//
//  LuaoalMacOSX_OALExtensions.h
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
#define LUA_oalMacOSX_OALExtensions_METANAME	"oalMacOSX_OALExtensions"
LUAMOD_API int (LuaOpenoalMacOSX_OALExtensions)(lua_State *L);
#include <OpenAL/oalMacOSX_OALExtensions.h>
#ifdef __cplusplus
}
#endif
