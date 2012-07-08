//
//  LuaSecTrust.h
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
#define LUA_SecTrust_METANAME	"SecTrust"
LUAMOD_API int (LuaOpenSecTrust)(lua_State *L);
#include <Security/SecTrust.h>
#ifdef __cplusplus
}
#endif
