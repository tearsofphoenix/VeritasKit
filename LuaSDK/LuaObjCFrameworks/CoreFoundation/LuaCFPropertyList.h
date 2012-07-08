//
//  LuaCFPropertyList.h
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
#define LUA_CFPropertyList_METANAME	"CFPropertyList"
LUAMOD_API int (LuaOpenCFPropertyList)(lua_State *L);
#include <CoreFoundation/CFPropertyList.h>
#ifdef __cplusplus
}
#endif
