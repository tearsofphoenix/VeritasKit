//
//  LuaCFStringEncodingExt.h
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
#define LUA_CFStringEncodingExt_METANAME	"CFStringEncodingExt"
LUAMOD_API int (LuaOpenCFStringEncodingExt)(lua_State *L);
#include <CoreFoundation/CFStringEncodingExt.h>
#ifdef __cplusplus
}
#endif
