//
//  LuaNSFetchRequestExpression.h
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
#define LUA_NSFetchRequestExpression_METANAME	"NSFetchRequestExpression"
LUAMOD_API int (LuaOpenNSFetchRequestExpression)(lua_State *L);
#include <CoreData/NSFetchRequestExpression.h>
#ifdef __cplusplus
}
#endif
