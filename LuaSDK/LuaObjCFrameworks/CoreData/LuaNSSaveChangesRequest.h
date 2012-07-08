//
//  LuaNSSaveChangesRequest.h
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
#define LUA_NSSaveChangesRequest_METANAME	"NSSaveChangesRequest"
LUAMOD_API int (LuaOpenNSSaveChangesRequest)(lua_State *L);
#include <CoreData/NSSaveChangesRequest.h>
#ifdef __cplusplus
}
#endif
