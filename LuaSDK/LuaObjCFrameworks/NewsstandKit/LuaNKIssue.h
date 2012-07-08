//
//  LuaNKIssue.h
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
#define LUA_NKIssue_METANAME	"NKIssue"
LUAMOD_API int (LuaOpenNKIssue)(lua_State *L);
#include <NewsstandKit/NKIssue.h>
#ifdef __cplusplus
}
#endif
