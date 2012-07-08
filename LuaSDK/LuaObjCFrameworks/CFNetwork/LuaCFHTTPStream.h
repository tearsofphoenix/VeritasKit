//
//  LuaCFHTTPStream.h
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
#define LUA_CFHTTPStream_METANAME	"CFHTTPStream"
LUAMOD_API int (LuaOpenCFHTTPStream)(lua_State *L);
#include <CFNetwork/CFHTTPStream.h>
#ifdef __cplusplus
}
#endif
