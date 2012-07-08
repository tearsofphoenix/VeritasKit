//
//  LuaNSRelationshipDescription.h
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
#define LUA_NSRelationshipDescription_METANAME	"NSRelationshipDescription"
LUAMOD_API int (LuaOpenNSRelationshipDescription)(lua_State *L);
#include <CoreData/NSRelationshipDescription.h>
#ifdef __cplusplus
}
#endif
