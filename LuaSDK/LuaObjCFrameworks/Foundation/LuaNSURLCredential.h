//
//  LuaNSURLCredential.h
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
#define LUA_NSURLCredential_METANAME	"NSURLCredential"
LUAMOD_API int (LuaOpenNSURLCredential)(lua_State *L);
#include <Foundation/NSURLCredential.h>
#ifdef __cplusplus
}
#endif
