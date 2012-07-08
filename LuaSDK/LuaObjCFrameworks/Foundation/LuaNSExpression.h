//
//  LuaNSExpression.h
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
#define LUA_NSExpression_METANAME	"NSExpression"
LUAMOD_API int (LuaOpenNSExpression)(lua_State *L);
#include <Foundation/NSExpression.h>
#ifdef __cplusplus
}
#endif
