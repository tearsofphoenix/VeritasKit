//
//  LuaCipherSuite.h
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
#define LUA_CipherSuite_METANAME	"CipherSuite"
LUAMOD_API int (LuaOpenCipherSuite)(lua_State *L);
#include <Security/CipherSuite.h>
#ifdef __cplusplus
}
#endif
