//
//  LuaNSComparisonPredicate.h
//  LuaIOS
//
//  Created by E-Reach Administrator on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//;
#ifdef __cplusplus
extern "C" {
#endif
#include "luaconf.h"
#include "lua.h"
#define LUA_NSComparisonPredicate_METANAME	"NSComparisonPredicate"
LUAMOD_API int (LuaOpenNSComparisonPredicate)(lua_State *L);
#include <Foundation/NSComparisonPredicate.h>
#ifdef __cplusplus
}
#endif
