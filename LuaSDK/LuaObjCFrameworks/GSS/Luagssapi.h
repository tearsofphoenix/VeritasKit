//
//  Luagssapi.h
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
#define LUA_gssapi_METANAME	"gssapi"
LUAMOD_API int (LuaOpengssapi)(lua_State *L);
#include <GSS/gssapi.h>
#ifdef __cplusplus
}
#endif
