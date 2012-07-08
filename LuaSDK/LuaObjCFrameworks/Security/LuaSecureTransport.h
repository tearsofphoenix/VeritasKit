//
//  LuaSecureTransport.h
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
#define LUA_SecureTransport_METANAME	"SecureTransport"
LUAMOD_API int (LuaOpenSecureTransport)(lua_State *L);
#include <Security/SecureTransport.h>
#ifdef __cplusplus
}
#endif
